# Changelog

All notable changes to the Gametainer catalog should be documented in this file.

This catalog has not started stable release tagging yet. Until catalog releases
are introduced, keep pending changes under `Unreleased` and move entries into a
dated release section when a tag is created.

The format is based on Keep a Changelog, with an additional `Compatibility`
section for runtime, migration, image, and data-portability changes that may
affect existing servers.

## Unreleased

### Added

- Added `runtime.compatibility` metadata to Factorio, Palworld, Valheim, and V
  Rising templates.

### Compatibility

- Marked current templates as supporting `native` and `fex` runtimes.
- Marked current template data portability and migration policy as same-runtime
  only. Cross-runtime restore and migration remain intentionally blocked until a
  game-specific conversion path is validated.
