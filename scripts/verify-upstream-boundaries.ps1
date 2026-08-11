[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$upstreamPath = Join-Path $repoRoot 'upstream/gpt-5.6-sol-instructions-template.md'
$fablePath = Join-Path $repoRoot 'gpt-5.6-sol-system-prompt-fable-like.md'
$expectedUpstreamSha256 = 'cbefa6b0bede0e332d957fca70ccacf9f12f4c0ecdf81b819e5cbe1a3b16e265'
$expectedProtectedSha256 = '9657b4e8f742be965454b0074449d4f29935bcb30a7c2a580a699d31370675e9'
$expectedSkillsSha256 = '375325511cea432c657ff9522642e23f400570b5fcab4932924ba2b01a6c225c'

$upstream = [System.IO.File]::ReadAllText($upstreamPath)
$fableFile = [System.IO.File]::ReadAllText($fablePath)
$fableStart = $fableFile.IndexOf('You are Codex')
if ($fableStart -lt 0) {
    throw 'Fable prompt body marker is missing.'
}
$fable = $fableFile.Substring($fableStart)

$personalityMarker = "# Personality`n"
$protectedMarker = "# Working with the user`n"
$upstreamPersonality = $upstream.IndexOf($personalityMarker)
$fablePersonality = $fable.IndexOf($personalityMarker)
$upstreamProtected = $upstream.IndexOf($protectedMarker)
$fableProtected = $fable.IndexOf($protectedMarker)

if ($upstreamPersonality -lt 0 -or $fablePersonality -lt 0 -or
    $upstreamProtected -lt 0 -or $fableProtected -lt 0) {
    throw 'Required prompt section marker is missing.'
}

$upstreamPreamble = $upstream.Substring(0, $upstreamPersonality)
$fablePreamble = $fable.Substring(0, $fablePersonality)
if ($fablePreamble -cne $upstreamPreamble) {
    throw 'The prompt preamble differs from the locked upstream template.'
}

$upstreamProtectedText = $upstream.Substring($upstreamProtected)
$fableProtectedText = $fable.Substring($fableProtected)
if ($fableProtectedText -cne $upstreamProtectedText) {
    throw 'Protected prompt text from # Working with the user onward differs from upstream.'
}

$upstreamEditable = $upstream.Substring(
    $upstreamPersonality,
    $upstreamProtected - $upstreamPersonality
)
$fableEditable = $fable.Substring(
    $fablePersonality,
    $fableProtected - $fablePersonality
)
if ($fableEditable -ceq $upstreamEditable) {
    throw 'The editable # Personality section contains no Fable modification.'
}

function Get-TextSha256([string] $Text) {
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
        return ([System.BitConverter]::ToString($sha256.ComputeHash($bytes)) -replace '-', '').ToLowerInvariant()
    }
    finally {
        $sha256.Dispose()
    }
}

$upstreamSha256 = Get-TextSha256 $upstream
$protectedSha256 = Get-TextSha256 $upstreamProtectedText
$skillsStart = $upstream.IndexOf("# Using skills`n")
if ($skillsStart -lt 0) {
    throw 'The locked upstream template has no # Using skills section.'
}
$skillsSha256 = Get-TextSha256 $upstream.Substring($skillsStart)

if ($upstreamSha256 -cne $expectedUpstreamSha256) {
    throw 'The locked upstream template differs from the pinned OpenAI source.'
}
if ($protectedSha256 -cne $expectedProtectedSha256) {
    throw 'The protected upstream span differs from its pinned hash.'
}
if ($skillsSha256 -cne $expectedSkillsSha256) {
    throw 'The # Using skills section differs from its pinned upstream hash.'
}

[pscustomobject]@{
    status = 'passed'
    upstream_sha256 = $upstreamSha256
    protected_sha256 = $protectedSha256
    skills_sha256 = $skillsSha256
    editable_section = '# Personality'
    protected_from = '# Working with the user'
} | ConvertTo-Json
