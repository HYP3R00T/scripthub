---
icon: lucide/scan-search
---

# Product scope

## Purpose

ScriptHub helps Linux users locate scripts across their own collections and compose shell commands around them. Collections may be ordinary directories or independent Git repositories.

## Intended interaction

A user invokes a shell binding, searches for a script, and selects it. ScriptHub returns the selected path, and shell integration inserts a safely quoted representation at the current cursor position. The command remains editable and is not executed automatically.

## Initial priorities

- Search one or more user-controlled collection roots.
- Present enough path and metadata context to distinguish scripts.
- Return a selected path through a stable command-line interface.
- Document explicit shell integration, beginning with Zsh.
- Distribute the application without requiring a separate interactive picker.

## Non-goals

- Replacing the user's shell.
- Executing a script immediately after selection.
- Owning or hiding Git operations for script collections.
- Auditing third-party scripts or guaranteeing that they are safe.
- Defining application architecture before its implementation increment.
