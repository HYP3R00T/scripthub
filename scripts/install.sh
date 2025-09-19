#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------
# Scripthub Installer
# ------------------------------------------------------------------

REPO_URL="https://github.com/HYP3R00T/scripthub"
INSTALL_DIR="$HOME/.local/share/scripthub"

# ------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------

install_mise() {
	if ! command -v mise &>/dev/null; then
		echo "⚠️  'mise' not found! Installing..."
		curl -fsSL https://mise.run | sh

		# Immediately activate Mise in current session
		export PATH="$HOME/.local/bin:$PATH"
		eval "$("$HOME"/.local/bin/mise activate bash)"

		# Persist activation for future Bash shells
		if [[ -f "$HOME/.bashrc" ]] && ! grep -q "mise activate bash" "$HOME/.bashrc"; then
			echo "export PATH=""$HOME"/.local/bin:"$PATH""" >>"$HOME/.bashrc"
			echo "eval ""$HOME"/.local/bin/mise activate bash"" >>"$HOME/.bashrc"
			echo "✅ Added Mise activation to .bashrc"
		fi

		# Persist activation for future Zsh shells
		if [[ -f "$HOME/.zshrc" ]] && ! grep -q "mise activate zsh" "$HOME/.zshrc"; then
			echo "export PATH=""$HOME"/.local/bin:"$PATH""" >>"$HOME/.zshrc"
			echo "eval ""$HOME"/.local/bin/mise activate zsh"" >>"$HOME/.zshrc"
			echo "✅ Added Mise activation to .zshrc"
		fi

		echo "✅ 'mise' installed and activated!"
	else
		# Ensure it's active for this script
		eval "$("$HOME"/.local/bin/mise activate bash)"
		echo "✅ 'mise' already installed and activated in current shell"
	fi
}

install_gum() {
	if ! command -v gum &>/dev/null; then
		echo "⚠️  'gum' not found! Installing via Mise..."
		mise use -g gum@latest
		echo "✅ 'gum' installed!"
	else
		echo "✅ 'gum' already available"
	fi
}

install_scripthub() {
	if [[ ! -d "$INSTALL_DIR" ]]; then
		echo "📦 Installing Scripthub..."
		git clone "$REPO_URL" "$INSTALL_DIR"
		chmod +x "$INSTALL_DIR/scripthub"
		echo "✅ Scripthub installed at $INSTALL_DIR"
	else
		echo "✅ Scripthub already installed"
	fi
}

add_to_path_file() {
	local rc_file=$1
	if [[ -f "$rc_file" ]] && ! grep -q "$INSTALL_DIR" "$rc_file"; then
		echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >>"$rc_file"
		echo "✅ Added $INSTALL_DIR to $rc_file"
	fi
}

ensure_path() {
	if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
		export PATH="$INSTALL_DIR:$PATH"
		add_to_path_file "$HOME/.bashrc"
		add_to_path_file "$HOME/.zshrc"
		echo "✅ PATH updated for current session and future shells"
	fi
}

trust_scripthub_config() {
	local config_file="$INSTALL_DIR/mise.toml"
	if [[ -f "$config_file" ]]; then
		echo "🔐 Trusting Scripthub Mise config..."
		mise trust "$config_file" &>/dev/null || true
		echo "✅ Config trusted"
	fi
}

final_tips() {
	echo
	echo "🎉 Installation complete!"
	echo "💡 Tip: Reload your shell or run:"
	echo "      source ~/.bashrc  # for Bash"
	echo "      source ~/.zshrc   # for Zsh"
	echo "💡 You can now run: scripthub help"
	echo
}

# ------------------------------------------------------------------
# Main
# ------------------------------------------------------------------
main() {
	install_mise
	install_gum
	install_scripthub
	ensure_path
	trust_scripthub_config
	final_tips
}

main "$@"
