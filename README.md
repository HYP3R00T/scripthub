# ScriptHub

> [!WARNING]
> ScriptHub does not audit or verify scripts.
> Run only code you understand and trust.
> You are responsible for what you execute.

ScriptHub is a lightweight script manager to organize, run, and add your personal scripts, all from a single entry point.

## 💡 Features

* Run scripts interactively or list them.
* Add new scripts to your collection easily.
* Auto-bootstrap from GitHub.
* Automatically adds itself to your PATH.
* Works in bash and zsh.

## 🚀 Installation

Run this command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/HYP3R00T/scripthub/main/scripts/install.sh | bash
````

This will:

1. Download and run the ScriptHub installer.
2. Install [`mise`](https://mise.jdx.dev) automatically if not already present.
3. Clone the ScriptHub repository to `~/.local/share/scripthub` if not already present.
4. Add `~/.local/share/scripthub` to your PATH in `.bashrc` and `.zshrc` if needed.
5. Make the current session aware of the new PATH, so you can run `scripthub` immediately.

## 📚 Usage

Once installed, you can run ScriptHub from **any terminal session**:

```bash
scripthub run       # Interactive script launcher
scripthub list      # List all scripts in your collection
scripthub add FILE  # Add a new script
scripthub help      # Show help page
```

### Examples

```bash
# Run the interactive script launcher
scripthub run

# List all scripts
scripthub list

# Add a new script to your collection
scripthub add ~/Downloads/myscript.sh

# Add a script to a specific folder in the collection
scripthub add ~/Downloads/myscript.sh utilities

# Show the help page
scripthub help
```

## 🛣️ Roadmap

Small, focused next steps we plan to add:

* **Update** - `scripthub update`
  Pull the latest changes from your GitHub fork (keep local scripts up-to-date).

* **Publish** - `scripthub publish` (name can change)
  Push local changes (new/edited scripts) back to your GitHub fork. Clear, single-command upload from local → remote.

* **Script templates & scaffolding** - `scripthub new <name>`
  Quickly create new scripts with a standard header, metadata fields, and executable permission.

* **Share & import** - `scripthub import <url|gist>`
  Import scripts from trusted GitHub repos or gists (with a clear warning prompt before executing any fetched code).

* **Self-diagnosis** - `scripthub doctor`
  Optional: detect broken PATH entries, missing dependencies, and common misconfigurations.

(We intentionally will not add duplicate fuzzy-search or category systems - `gum` and folder-based organization already cover those needs. GitHub provides history/versioning.)

## 🛠️ Fork & Customize

If you want to use ScriptHub for your own scripts, here’s how:

1. **Fork this repository** into your own GitHub account.
2. **Update the installation script** (`install.sh`) to point to your fork instead of this repo:

    ```bash
    curl -fsSL https://raw.githubusercontent.com/<your-username>/<your-repo>/main/scripts/install.sh | bash
    ```

3. **Replace repo references**
   Anywhere this repo uses `HYP3R00T/scripthub`, change it to your GitHub username/repo:

   * `install.sh`
   * Any documentation or helper scripts

4. **Verify installation**
   Run your updated install command and confirm that:

   * ScriptHub installs correctly.
   * PATH is updated.
   * Your scripts run as expected.

### Branding & Support

By default, ScriptHub ships with the original branding. You're free to keep it or rebrand the fork.

If you find ScriptHub useful, please consider:

* 🌟 **Starring this repo** on GitHub
* 💖 **Sponsoring me** (linkable once enabled)

Your support helps keep me building in public.

## 🌍 About the Author

Hi, I’m **Rajesh Das**, a completely independent developer, full-time open source contributor, and someone who codes and learns in public.

I don’t have a traditional source of revenue; everything I build is fueled by curiosity and the hope that others find it useful. If you’d like to support me:

* Visit my **personal site & blog**: [rajeshdas.dev](https://rajeshdas.dev)
* Explore my **full project collection**: [hyperroot.dev](https://hyperroot.dev)
* Consider **sponsoring me** (or simply giving this repo a ⭐) to help me keep building in the open.

Your encouragement means a lot and directly supports more tools like ScriptHub.

## 🤝 License

[MIT](LICENSE); Fork freely, customize endlessly!
