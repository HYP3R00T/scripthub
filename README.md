# ScriptHub

> [!WARNING]
> ScriptHub will help users discover and compose commands for scripts, but it will not validate or sandbox those scripts for them.
> Always review what you plan to run.

ScriptHub is a Linux-first Rust project for finding scripts quickly and composing exact commands for manual execution.

## Direction

ScriptHub is being built to:

- discover executable files with shebangs from a configured repository
- parse optional lightweight metadata from leading comments
- search and inspect scripts quickly
- compose an exact command preview
- copy that command or print it to stdout

ScriptHub is not being built to:

- execute scripts automatically
- inject text into an existing shell prompt
- model complex flag schemas
- manage plugins or background indexing

Contributor notes and guardrails live in [AGENT.md](AGENT.md).

## Status

The repository is set up as an early rewrite workspace with a minimal Rust bootstrap, contributor guidance, and development tooling.

## License

[MIT](LICENSE)
