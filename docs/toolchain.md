# Toolchain

Vala native validation uses Homebrew `vala` and GLib on arm64 macOS.

## Proven commands

- `valac --version`
- `valac --pkg glib-2.0 -o bin/stakeholder src/stakeholder.vala`
- `make compiler-proof`
- `make test`

Toolchain source: Homebrew bottled `vala` 0.56.19 with GLib and formula transitive dependencies. Docker, Nix, and Vala package managers are not required for the current deterministic first tranche.
