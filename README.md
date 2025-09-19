# ScriptHub

A lightweight script manager to organize, run, and add your personal scripts, all from a single entry point.

## 💡 Features

* Run scripts interactively or list them.
* Add new scripts to your collection easily.
* Auto-bootstrap from GitHub.
* Automatically adds itself to your PATH.
* Works in bash and zsh.

## 🚀 Installation

Run this command in your terminal:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYP3R00T/scripthub/main/scripthub)
```

This will:

1. Clone the ScriptHub repository to `~/.local/share/scripthub` if not already present.
2. Make the launcher executable.
3. Add `~/.local/share/scripthub` to your PATH in `.bashrc` and `.zshrc` if needed.
4. Make the current session aware of the new PATH, so you can run `scripthub` immediately.

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

## ⚙️ Advanced

* Fully symlink-safe, works even if `scripthub` is called via a symbolic link.
* PATH setup works automatically for **bash** and **zsh**.
* All scripts are stored under:

```text
~/.local/share/scripthub/scripts
```

## 🤝 License

MIT; Fork freely, customize endlessly!
