# Contributing to ScriptHub

Thanks for contributing to ScriptHub. This repository is in an early rebuild phase, so the most helpful contributions are the ones that keep the project focused, understandable, and easy to evolve.

## Code of Conduct

Please review our [Code of Conduct](/.github/CODE_OF_CONDUCT.md). All contributors are expected to uphold it in issues, pull requests, and discussions.

## Getting Started

### Prerequisites

- Git installed and configured
- A GitHub account
- Rust toolchain installed
- Development environment set up (see [README.md](README.md))

### Setting Up Your Development Environment

1. **Fork the repository** on GitHub
2. **Clone your fork locally**:

   ```bash
   git clone https://github.com/YOUR-USERNAME/scripthub.git
   cd scripthub
   ```

3. **Create a development branch**:

   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Install local tools**:

   ```bash
   mise install
   ```

5. **Run the local checks**:

   ```bash
   cargo fmt --all --check
   cargo check
   cargo test
   ```

## Making Changes

### Code Standards

- Keep the product boundary clear: ScriptHub helps users discover scripts and compose commands, but should not silently execute or obscure them
- Use meaningful variable and function names
- Write clear comments explaining "why", not "what"
- Keep functions and modules focused and single-purpose
- Maintain consistency with the existing codebase
- Prefer small, reviewable pull requests over broad rewrites

### Commit Messages

We follow [Conventional Commits](https://www.conventionalcommits.org/).

**Format**: `<type>(<scope>): <subject>`

Examples:

- `feat: add new authentication module`
- `fix: resolve timeout in API calls`
- `docs: update installation guide`
- `test: add unit tests for user service`

### Testing

- Write tests for all new features and bug fixes
- Ensure all existing tests pass locally
- Run formatting and compile checks before submitting
- Aim for clear, isolated, deterministic tests

### Documentation

- Update the [README.md](README.md) if you're adding new features or changing functionality
- Add docs or comments when they clarify intent or tradeoffs
- Update relevant documentation files
- Include examples where helpful

## Submitting Changes

### Before You Submit

1. **Run local checks**:

   ```bash
   cargo fmt --all --check
   cargo check
   cargo test
   ```

2. **Ensure your branch is up to date** with `main`:

   ```bash
   git fetch origin
   git rebase origin/main
   ```

3. **Push your branch**:

   ```bash
   git push origin feature/your-feature-name
   ```

### Pull Request Process

1. **Open a pull request** on GitHub
2. **Use the PR template** (automatically loaded) and fill in all sections
3. **Link related issues** (e.g., "Closes #123")
4. **Describe your changes** clearly and concisely
5. **Wait for reviews** - address feedback constructively
6. **Ensure CI passes** - all automated checks must pass

### Pull Request Checklist

- [ ] Code follows project style guidelines
- [ ] Documentation is updated
- [ ] Tests added/updated
- [ ] All tests pass locally
- [ ] No linting or type errors
- [ ] Commit messages follow Conventional Commits
- [ ] No unrelated changes included
- [ ] No hardcoded secrets or credentials

## Code Review Process

All pull requests will be reviewed for:

- **Correctness**: Does the code work as intended?
- **Quality**: Is the code well-written and maintainable?
- **Style**: Does it follow project conventions?
- **Testing**: Are there adequate tests?
- **Documentation**: Is it properly documented?
- **Security**: Are there any security concerns?

## Types of Contributions

### Bug Reports

Found a bug? Please [open an issue](https://github.com/HYP3R00T/scripthub/issues/new?template=bug_report.yml) with:

- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Environment details
- Any relevant logs or screenshots

### Feature Requests

Have an idea? [Open a feature request](https://github.com/HYP3R00T/scripthub/issues/new?template=feature_request.yml) with:

- Problem statement or motivation
- Proposed solution
- Alternative approaches considered
- Use cases and benefits

### Documentation Contributions

Help improve documentation by:

- Fixing typos or unclear explanations
- Adding examples or clarifications
- Improving setup instructions
- Adding troubleshooting sections

### Code Improvements

Contribute code by:

- Fixing reported bugs
- Implementing approved feature requests
- Refactoring for clarity or performance
- Adding or improving tests
- Improving error handling and logging

## Getting Help

- **Questions?** Open an issue or pull request with context
- **Stuck?** Ask in issues or discussions - we're here to help
- **Documentation unclear?** Let us know so we can improve it

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project. See [LICENSE](LICENSE) for details.

---

**Thank you for contributing!** Your help makes this project better for everyone. 🙏
