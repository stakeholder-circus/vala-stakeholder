# Docker validation is intentionally deferred for this M1-safe local Vala tranche.
# The native validation lane uses Homebrew Vala plus GLib on macOS.
FROM alpine:3.20
CMD ["sh", "-c", "echo 'Docker validation deferred for vala-stakeholder'; exit 1"]
