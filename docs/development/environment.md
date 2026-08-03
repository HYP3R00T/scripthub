---
icon: lucide/container
---

# Development environment

ScriptHub uses a Linux Dev Container as its reference development environment. Mise provides the shared interface for installing repository tools and entering the project.

## Requirements

- Git
- Docker
- Visual Studio Code
- Visual Studio Code Dev Containers extension

## Start the environment

1. Clone the repository.
2. Open it in Visual Studio Code.
3. Run **Dev Containers: Reopen in Container**.
4. Allow `scripts/setup.sh` to install the tools declared in `mise.toml`.

The container activates Mise for Bash and Zsh. Sensitive local values may be placed in an untracked `.env` file.

## Verify the foundation

```bash
mise doctor
mise ls --current
prek run --all-files
uvx zensical build --clean
```

The repository checks validate common file formats, Markdown, shell scripts, commit messages, and repository hygiene. Language-specific build, formatting, linting, and test commands will be added only when the application implementation is introduced.
