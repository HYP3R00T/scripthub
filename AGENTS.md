# AGENTS.md

Instructions for coding agents working on ScriptHub.

## Project purpose

ScriptHub is a Linux-first tool for finding scripts in user-controlled collections. A user selects a script, and explicit shell integration inserts its safely quoted path into the current command line. The user remains free to add arguments, redirections, and pipelines before deciding whether to execute it.

## Product boundaries

- Selecting a script must never execute it.
- The application may return a selected path, but a child process cannot directly modify its parent shell's command buffer. Prompt insertion belongs in a shell-specific integration.
- Script collections remain ordinary user-controlled directories. They may be Git repositories, but ScriptHub does not own their storage or Git history.
- Scripts are untrusted content. Do not imply that ScriptHub audits or guarantees their safety.
- Keep the initial product Linux-first and document platform assumptions clearly.

## Repository state

The shell-based prototype is preserved on the `legacy-shell` branch. Do not use it as the architecture for new work on `main`.

`main` currently contains the language-agnostic development foundation. Rust implementation and Rust-specific commands will be documented here when that setup is introduced. Until then, do not add speculative application structure, dependencies, packaging, or release automation unless the requested increment explicitly requires it.

Key locations currently include:

- `.devcontainer/` — reference Linux development environment;
- `docs/product/scope.md` — accepted product scope and non-goals;
- `docs/development/` — contributor environment documentation;
- `mise.toml` — repository tools and shared tasks; and
- `.github/workflows/` — repository and documentation checks.

## Development commands

```sh
mise install
prek run --all-files
uvx zensical build --clean  # when documentation changes
```

Run additional build, lint, and test commands after they are established by the application toolchain.

## Working approach

Understand the requested behavior and inspect affected files before editing. Prefer the smallest complete and maintainable change. Avoid unrelated refactoring, premature abstractions, unnecessary dependencies, and configuration for capabilities that do not yet exist.

When behavior is introduced, add focused tests and update user or contributor documentation when interfaces, setup, or assumptions change.

## Verification

- Inspect existing changes and preserve unrelated work.
- Follow repository conventions and the closest applicable `AGENTS.md`.
- Run relevant checks and report anything that could not be verified.
- Do not bypass, disable, or weaken checks to make a change pass.
- Treat a shell integration and the application command it invokes as separate boundaries and test their failure and cancellation behavior.

## Safety and authority

- Never commit secrets, credentials, private data, or local `.env` contents.
- Ask before expanding scope, adding dependencies, changing public interfaces, or performing difficult-to-reverse actions.
- Do not overwrite unrelated work or use destructive commands without explicit authorization.
- Do not commit, push, open pull requests, merge, publish, or change external systems unless explicitly requested.
- State important assumptions, risks, limitations, and verification results in the final handoff.
