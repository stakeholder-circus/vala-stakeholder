# First push families

This local tranche ports the deterministic family-focus contract into a compiled Vala/GLib runtime.

| Family group | Vala path | Source reference | Parity class |
| --- | --- | --- | --- |
| classic-six | `src/stakeholder.vala` | current deterministic CLI family registry and smoke-contract shape | dedicated |
| modern-core | `src/stakeholder.vala` | current deterministic CLI family registry and smoke-contract shape | dedicated |
| later families | `src/stakeholder.vala` | grouped fallback policy in current deterministic repos | grouped fallback |
| CLI contract | `src/stakeholder.vala`, `tests/test_cli.sh` | small-tranche smoke contract | deterministic |
| experimental provider | `src/stakeholder.vala`, `tests/test_cli.sh` | fail-fast provider policy in current deterministic repos | explicit fail-fast |

Rust and Java remain canonical behavioral anchors; this Vala tranche is local-only and native-validated.
