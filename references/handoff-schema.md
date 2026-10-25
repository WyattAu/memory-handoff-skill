# The handoff file, filled in

This is what a healthy handoff file looks like after a real session.
The project is invented; the shape is the contract.

```markdown
# handoff: crawlkit

## Status
crawlkit is a Rust web crawler with a Starlight docs site and a
dashboard. The 0.9 release is cut and CI is green. The docs pipeline
uses pele-rehype for math rendering. The next milestone is the
warehouse exporter (ADR-016), which is designed but not started.

## Open threads
- `warehouse-exporter`: branch exists, skeleton only. Entry point
  `crates/exporter/src/lib.rs`, design in `docs/adr/016-warehouse.md`.
- Dependency audit runs daily and was red on Oct 19 from the Ubuntu 26
  runner migration; the deny.toml `paste` ignore is deliberate until
  ADR-016 ships without it.
- fetch-kit#11 blocks upgrading fetch-kit; the fix PR is theirs to
  review, pin 0.2.0 until then.

## Decisions
- 2026-10-18: warehouse exporter writes parquet, not csv (ADR-016).
- 2026-10-12: stay on RustLS; no native-tls anywhere in the tree.

## Next step
Open `docs/adr/016-warehouse.md` and implement the arrow schema
section; start from `cargo new crates/exporter`.

## Updated
2026-10-24T18:30Z by opencode
```

## What each section is for

- `Status` is the only section a stranger reads. Write it last.
- `Open threads` are the resume points. If an item cannot name the
  branch, file, or command to resume with, it is not a thread, it is a
  wish; either make it concrete or drop it.
- `Decisions` prevent an eager session from redoing settled arguments.
  One line each; link the ADR or issue that carries the rationale.
- `Next step` exists so the next session's first minute is not spent
  choosing what to do. One item only.
- `Updated` is how a reader tells a live handoff from an abandoned
  one. Never skip it.
