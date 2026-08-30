# Deterministic tranche traceability

| Family group | Vala path | Source reference | Parity class |
| --- | --- | --- | --- |
| classic-six | src/stakeholder.vala | Rust and Java deterministic family registry and normalized output contract | dedicated |
| modern-core | src/stakeholder.vala | Rust and Java deterministic family registry and normalized output contract | dedicated |
| later families | src/stakeholder.vala | canonical grouped fallback policy | grouped fallback |
| CLI contract | src/stakeholder.vala, tests/test_cli.sh | stakeholder-core CLI and normalized JSON contract | deterministic |
| experimental provider | src/stakeholder.vala, tests/test_cli.sh | canonical provider isolation policy | explicit fail-fast |

Rust and Java remain canonical behavioral anchors. Native and Docker GitHub jobs validate this committed Vala tranche.
