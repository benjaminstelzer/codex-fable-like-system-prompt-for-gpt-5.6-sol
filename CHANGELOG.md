# Changelog

## 2026-08-11: Calibrated dry humor (v1.1.2)

### Changed

- Refined the direct-conversation humor rule from 21 individually rated German
  variants.
- Favored compact technical contradictions and self-directed irony about
  overengineering.
- Rejected generic software jokes, explained punch lines, and invented
  incompetence, damage, or failure used only to create humor.
- Kept the existing artifact boundary and the humor shutoffs for frustration,
  production, money, security, personal data, and data loss.

### Validation

- The locked upstream preamble and everything from `# Working with the user`
  onward remain byte-identical.
- The protected `# Using skills` section retains its pinned upstream hash.
- `scripts/verify-upstream-boundaries.ps1` and `git diff --check` passed.
- No fresh full-model behavior suite was run. The 21 ratings calibrate the rule
  but do not prove runtime behavior.

## 2026-08-11: Simpler README punctuation (v1.1.1)

### Changed

- Removed em dashes and semicolons from the public README.
- Kept the prompt, Skills, scripts, and behavioral contracts unchanged.

### Validation

- Only `README.md` changed in the release commit.
- The README contained neither an em dash nor a semicolon.
- Local Markdown links and `git diff --check` passed.

## 2026-08-11: Upstream-exact operational contract (v1.1.0)

### Changed

- Rebased the prompt on the current GPT-5.6 Sol
  `model_messages.instructions_template` from OpenAI Codex commit
  `e20616d2650de6cde27e8513cbf266ed75851071`.
- Limited the complete Fable modification boundary to `# Personality` and kept
  the upstream preamble plus everything from `# Working with the user` onward
  word-for-word unchanged.
- Restored the current official `# Using skills` section instead of retaining
  later local rewrites of its announcement rules.
- Removed local operational additions that were not part of the public
  upstream template, including the extra instruction-boundary, code-style,
  root-cause, artifact-state, and expanded destructive-action sections.
- Added a locked upstream snapshot and a hash-based boundary verifier.
- Fixed LF line endings for the prompt, snapshot, and verifier so byte checks
  remain stable across Windows checkouts.
- Documented why the current SkillOpt Studio cannot yet optimize a system-prompt
  section safely and the adapter boundary required before it can.

### Validation

- The complete upstream snapshot matches SHA-256
  `cbefa6b0bede0e332d957fca70ccacf9f12f4c0ecdf81b819e5cbe1a3b16e265`.
- The protected prompt span and `# Using skills` section match their pinned
  upstream hashes.
- A fresh full-model behavior suite has not yet been run for the rebased
  composition; earlier Fable personality tests are not reported as new proof.

## 2026-08-11: README voice and structure (v1.0.1)

### Changed

- Reworked the public README in Benjamin's voice while preserving the
  model-specific installation contract, behavior claims, measured status,
  sources, license, and notice.
- Aligned its section order with the Scoville project READMEs and expanded the
  family section to all six current Skills.
- Kept the system prompt itself unchanged; this release changes its public
  explanation, not Codex behavior.

### Validation

- The README structure, internal links, shared family copy, and Markdown
  whitespace checks passed.
- No model-behavior benchmark was run because the system prompt did not change.

## 2026-08-03: Fable naming alignment

### Changed

- Named the repository, prompt file, and README for the Fable 5 outputs that
  supplied the actual comparison target.
- Made the system prompt state that it adopts observed response mechanics from
  Fable 5 without copying unsupported claims or model identity.
- Updated installation URLs and paths to use the Fable-aligned names.

## 2026-08-03: Family documentation alignment

### Changed

- Reorganized the README around the same introduction, installation, behavior,
  composition, design, sources, contents, status, and license sequence used by
  the Scoville repositories.
- Kept installation model-specific while making its explanation match the
  direct style of the Agent Skill repositories.
- Added one concise section explaining how the system prompt composes with the
  three Scoville skills.

### Validation

- README links and installation paths matched the current repository.
- `git diff --check` passed.

## 2026-08-03: Joint prompt and Scribe calibration

### Changed

- Clarified that the system prompt, project instructions, skills, and request
  act together during generation rather than as isolated writing passes.
- Made explicitly multi-part questions trigger matching lead-ins without
  forcing labels onto short connected arguments.
- Allowed visibly hypothetical numerical counterexamples when an unknown real
  rate would otherwise hide the mechanism.
- Let argument structure determine paragraph rhythm and made useful closing
  syntheses more salient without adding a summary quota.
- Integrated invited humor into the explanation before a callback and made
  artifact-local humor restrictions override the conversational permission.
- Bound required limitation sections to their affected claims or calculations.
- Made load-bearing examples carry one concrete instance through to its
  observable result instead of stopping at a list of named cases.
- Made claims about weak small-sample evidence trigger a visibly hypothetical
  probability instead of remaining qualitative.
- Made questions about what makes a tool, model, or practice useful trigger one
  representative case through contribution and external verification.
- Preserved meaningful totals, ratios, and bounds in numerical change
  summaries.
- Required status summaries to account for every enumerated completion
  condition before compressing.

### Validation

- `git diff --check` passed for the prompt, README, and changelog.
- The staged prompt kept the existing `# Using skills` section and everything
  after it byte-identical to `main`.
- Focused contract checks found the matching composition, structure,
  hypothetical-example, callback, synthesis, and limitation rules in the system
  prompt and Scribe.

## 2026-08-02: Fable-style explanatory depth

### Changed

- Made causal mechanisms, supported derived implications, concrete examples,
  and material boundaries part of a complete explanatory answer.
- Allowed short bold lead-ins, parallel lists, and closing syntheses when they
  expose or compress real argument structure.
- Replaced the direct-conversation em-dash ban with contextual punctuation
  guidance and let sentence rhythm follow the argument.
- Let dry humor grow out of the technical mechanism while preserving the hard
  shutoffs for frustration, production, money, security, personal data, and
  data loss.
- Preserved the boundary between direct conversation and requested artifacts;
  artifact voice still comes from the request, source, genre, and applicable
  skills.

### Validation

- The upstream `# Using skills` section remained byte-identical to the previous
  prompt at SHA-256
  `4cb96c7c117a1a94070816f0eb4a70b6907179cb3f3be80a1704b5b3c9ef4f24`.
- `git diff --check` passed for the prompt and README changes.
- The updated Scribe rules passed two fresh forward tests.
