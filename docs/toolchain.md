# Toolchain

Vala validation uses valac and GLib.

- macOS native feedback: Homebrew vala and GLib.
- GitHub native and SAST: Ubuntu 24.04 valac plus libglib2.0-dev.
- Portable runtime gate: Ubuntu 24.04 multi-stage Docker build with libglib2.0-0t64 in the non-root final image.
- Nix: development-shell policy only; GitHub and Docker remain release evidence.

Commands: valac --version, make analyze, make test, docker build -t vala-stakeholder .
