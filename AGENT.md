# ScriptHub Agent Notes

## Purpose

This repository is transitioning from a shell-based personal script launcher into a more focused ScriptHub product for Linux:

- catalog scripts from a configured repository
- help users find the right script quickly
- compose a trustworthy command for manual execution

The near-term goal is not to auto-run scripts or inject commands into the active shell prompt. The goal is to make script discovery and command composition fast, clear, and safe.

## Current State

- `main` reflects the previous Bash-based ScriptHub workflow
- this branch is now the rewrite workspace
- the old shell mechanism has been removed from this branch
- the Rust/TUI implementation is scaffolded but intentionally minimal

## Product Boundaries

Keep the project intentionally focused.

### Must protect

- exact command preview is always visible
- script path is never hidden
- metadata stays lightweight and optional
- output can fall back to plain stdout if clipboard support is unavailable

### Must avoid

- automatic script execution
- shell prompt injection
- structured argument forms
- plugin systems
- background indexing
- multi-repo management

## Proposed Shape

Core responsibilities:

1. scan a configured script repository
2. detect executable files with shebangs
3. parse a small leading metadata block
4. support search and inspection
5. compose a final command string safely
6. copy or print that command

Suggested metadata fields:

- `@name`
- `@description`
- `@tags`
- `@example`

## Working Agreement

While this branch is in setup mode:

- prefer documentation, planning, and structure over implementation
- keep changes easy to review and reversible
- treat README and planning docs as the source of truth for product direction

## Next Setup Targets

- refine the project spec into concrete commands and config shape
- choose the initial Rust crate layout
- decide where example metadata and sample repos should live
- document manual workflows for local experimentation
