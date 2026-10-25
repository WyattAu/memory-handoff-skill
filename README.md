# memory-handoff-skill

An agent skill for portable session handoff: one plaintext markdown
file per project, read at session start and rewritten at session end,
so any agent CLI picks up mid-thought instead of cold.

Works across CLIs (opencode, claude code, aider, anything that can
read and write files). No daemon, no database, no lock-in.

## Install

Point your agent at this directory, or install with
[skillkit](https://crates.io/crates/skillkit):

```sh
cargo install skillkit
skillkit pack memory-handoff-skill
```

`skillkit lint` on this tree exits zero; the packaged archive hash is
`13cd76e04c9499b4d42792704c190305b6495ed373f531ad2c30c36390c6c783`.

## The contract

`~/.agent/handoffs/<project-slug>.md` (or `$AGENT_HANDOFF_DIR`), five
fixed sections: Status, Open threads, Decisions, Next step, Updated.
The SKILL.md carries the procedure; references/handoff-schema.md shows
a filled-in example.

## Why

The fastest-accelerating cluster in our trend measurements is agent
memory: MemTensor's models went 25 to 12,500 downloads in eight days
and the ai-memory repo compounds daily, with handoff-between-CLIs named
as the pain. This skill is the boring, durable version of that: a file
format any agent can honor, verified by skillkit.

## License

Apache-2.0
