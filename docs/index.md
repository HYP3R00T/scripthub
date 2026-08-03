---
icon: lucide/library-big
---

# ScriptHub

ScriptHub is a Linux-first tool for finding scripts in user-controlled collections.

A user searches for a script and selects it. ScriptHub returns the selected path, and explicit shell integration inserts a safely quoted representation into the current command line. The command remains editable so the user can add arguments, pipes, and redirections before deciding whether to execute it.

ScriptHub does not execute a script merely because it was selected. Collections remain ordinary user-controlled directories and may be stored locally or in independent Git repositories.

The current repository contains the development foundation. Application code and installation instructions will be introduced in later increments.
