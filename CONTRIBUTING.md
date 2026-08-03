# Contributing

Thank you for taking the time to improve ScriptHub. Contributions are welcome when they are focused, understandable, and aligned with the project's direction.

## Before starting

Search existing issues before beginning work. Discuss substantial behavior, architecture, dependencies, or public interfaces with the maintainer before implementation. Small documentation corrections may be submitted directly.

External contributors should work from a fork. Create a focused branch from the latest `main` and keep one concern per pull request.

## Set up the project

Install Git, Docker, Visual Studio Code, and the Dev Containers extension. Then:

1. Clone your fork or the main repository.
2. Open the checkout in Visual Studio Code.
3. Run **Dev Containers: Reopen in Container**.
4. Wait for the setup script to install tools and configure Git hooks.
5. Verify the environment:

   ```bash
   mise doctor
   mise ls --current
   prek run --all-files
   ```

## Make a focused change

- Follow the existing structure and documented product boundaries.
- Add or update tests when behavior changes and a test structure exists.
- Update documentation when setup, behavior, or interfaces change.
- Do not include credentials, private data, or unrelated generated files.
- Understand and be able to explain everything you submit, including AI-assisted work.

## Verify the change

Run:

```bash
prek run --all-files
```

For documentation changes, also run:

```bash
uvx zensical build --clean
```

Run any additional application checks documented by the project once language-specific tooling is introduced.

## Commits and pull requests

Use Conventional Commits:

```text
<type>(<optional-scope>): <short description>
```

Complete the pull request template, link related issues, explain the observable change, and list the exact verification performed. Approval and merge remain at the maintainer's discretion.

## Security and community

Report vulnerabilities according to [SECURITY.md](SECURITY.md), not in a public issue. All participation must follow the [Code of Conduct](.github/CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contribution will be licensed under the same terms as this project. See [LICENSE](LICENSE).
