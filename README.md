# Gametainer Catalog

Official game template catalog for Gametainer.

This repository contains the game-specific metadata that `gametainer` uses to
create and run containerized self-hosted game servers. Templates describe how a
game is installed, configured, launched, persisted, exposed on the network, and
checked for readiness.

The catalog is intentionally separate from the main `gametainer` application so
game support can evolve without requiring a new controller binary release.

## Layout

```text
index.yaml
games/
  <game>/
    definition.yaml
    settings.spec.yaml
    settings.template.yaml
```

- `index.yaml` lists supported games and points to each game directory.
- `definition.yaml` defines install mode, image profile, ports, persistent
  paths, process launch details, lifecycle steps, and readiness checks.
- `settings.spec.yaml` defines user-facing settings and how they map to config
  files or process arguments.
- `settings.template.yaml` is the default generated `gamer` config input for a
  game.

## Local Use

From the main `gametainer` repository, this catalog is expected at:

```bash
../gametainer-catalog
```

You can override that path with:

```bash
GAMETAINER_CATALOG_ROOT=/path/to/catalog
```

or per command:

```bash
gametainer catalog validate --templates /path/to/catalog
gametainer games list --templates /path/to/catalog
gametainer servers create factorio my-factorio --templates /path/to/catalog
```

## Validation

This catalog is independent of the `gametainer` source repository. If the
`gametainer` CLI is installed and available on `PATH`, validate this checkout
from the catalog root with:

```bash
gametainer catalog validate --templates .
```

The included `Justfile` is only a convenience wrapper around the installed CLI:

```bash
just validate
just games
just show factorio
```

The catalog should validate before template changes are merged.

## Current Templates

- `factorio`: archive-based Linux dedicated server.
- `palworld`: SteamCMD Linux dedicated server.
- `valheim`: SteamCMD Linux dedicated server.
- `vrising`: SteamCMD Windows dedicated server through Wine.

## Contribution Notes

Templates should keep game-specific behavior in catalog files whenever possible.
The `gamer` container shim and `gametainer` controller should remain generic.

When adding or changing a game template:

- Include source/provenance links in template metadata when available.
- Prefer normalized user-facing setting names.
- Keep defaults close to the upstream server defaults.
- Declare all required ports and persistent paths.
- Add readiness metadata when the server has a reliable startup signal.
- Validate the catalog before opening a pull request.
