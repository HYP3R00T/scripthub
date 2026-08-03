<!-- rumdl-disable MD041 -->

<div align="center">

# ScriptHub

Find scripts from your own collections and insert their paths into your shell command line.

[Documentation](https://hyp3r00t.github.io/scripthub/) · [Contributing](CONTRIBUTING.md)

[![Quality Gate](https://img.shields.io/github/actions/workflow/status/HYP3R00T/scripthub/ci.yaml?branch=main&style=for-the-badge&label=Quality%20Gate&logo=githubactions)](https://github.com/HYP3R00T/scripthub/actions/workflows/ci.yaml)
[![License: MIT](https://img.shields.io/github/license/HYP3R00T/scripthub?style=for-the-badge&label=License)](LICENSE)

</div>

## About

ScriptHub is a Linux-first application for searching personal script collections. After a script is selected, its path is inserted into the current shell prompt so the user can add arguments, pipes, and redirections before choosing to execute it.

The project is currently establishing its development foundation. The application implementation and installation instructions will be added in a separate increment.

## Product direction

ScriptHub aims to:

- search scripts stored in one or more user-controlled directories;
- work with collections kept locally or in independent Git repositories;
- insert a safely quoted script path without executing it; and
- integrate with shells through a small, explicit shell-side adapter.

ScriptHub does not aim to replace the shell, hide command execution, or require it to manage a collection's Git history.

## Development

The reference development environment is the repository's Dev Container. It provides Mise and the language-agnostic repository checks without selecting an application language or architecture prematurely.

1. Install Docker, Visual Studio Code, and the Dev Containers extension.
2. Clone this repository and open it in Visual Studio Code.
3. Run **Dev Containers: Reopen in Container**.
4. Verify the foundation:

   ```bash
   mise doctor
   mise ls --current
   prek run --all-files
   uvx zensical build --clean
   ```

See the [development environment documentation](docs/development/environment.md) for details.

## Contributing

Contributions are welcome when they are focused and aligned with the project's direction. Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing a change.

## License

ScriptHub is available under the [MIT License](LICENSE).

<div align="center">

Developed with ❤️ by [HYP3R00T](https://github.com/HYP3R00T)

</div>
