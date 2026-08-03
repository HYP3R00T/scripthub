---
icon: lucide/library-big
---

# ScriptHub

ScriptHub is a Linux-first application for finding scripts in user-controlled collections and inserting a selected script's path into the current shell prompt.

## Current status

The repository currently contains the language-agnostic development foundation. Application code, runtime tooling, and shell integration will be introduced through separate, reviewable increments.

## Product boundary

Selecting a script does not execute it. ScriptHub leaves arguments, pipes, redirections, review, and execution under the user's control.

## Documentation

- [Product scope](product/scope.md)
- [Development environment](development/environment.md)
