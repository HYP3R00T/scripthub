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

		# Persist for future shells
		if [[ -f "$HOME/.bashrc" ]] && ! grep -q "mise activate bash" "$HOME/.bashrc"; then
			echo "export PATH=\"$HOME/.local/bin:\$PATH\"" >>"$HOME/.bashrc"
			echo "eval \"$HOME/.local/bin/mise activate bash\"" >>"$HOME/.bashrc"
			echo "✅ Added mise path and activation to ~/.bashrc"
		fi

		if [[ -f "$HOME/.zshrc" ]] && ! grep -q "mise activate zsh" "$HOME/.zshrc"; then
			echo "export PATH=\"$HOME/.local/bin:\$PATH\"" >>"$HOME/.zshrc"
			echo "eval \"$HOME/.local/bin/mise activate zsh\"" >>"$HOME/.zshrc"
			echo "✅ Added mise path and activation to ~/.zshrc"
		fi

		echo "✅ 'mise' installed!"
		echo "💡 Please run 'source ~/.bashrc' or open a new terminal before using scripthub."
	else
		echo "✅ 'mise' already installed!"
	fi
}

trust_mise_config() {
	# Trust scripthub config if not already trusted
	CONFIG_FILE="$INSTALL_DIR/mise.toml"
	if [[ -f "$CONFIG_FILE" ]]; then
		echo "🔐 Trusting scripthub mise config..."
		mise trust "$CONFIG_FILE" &>/dev/null || true
		echo "✅ Config trusted"
	fi
}

install_gum() {
	if ! command -v gum &>/dev/null; then
		echo "⚠️  'gum' not found! Installing via mise..."
		mise use -g gum@latest
		echo "✅ 'gum' installed!"
	else
		echo "✅ 'gum' already available"
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

install_scripthub() {
	if [[ ! -d "$INSTALL_DIR" ]]; then
		echo "📦 Installing scripthub..."
		git clone "$REPO_URL" "$INSTALL_DIR"
		chmod +x "$INSTALL_DIR/scripthub"
		echo "✅ Scripthub installed at $INSTALL_DIR"
	else
		echo "✅ Scripthub already installed"
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
	trust_mise_config
	final_tips
}

main "$@"
