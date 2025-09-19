#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------
# Scripthub Installation Script
# ------------------------------------------------------------------

REPO_URL="https://github.com/HYP3R00T/scripthub"
INSTALL_DIR="$HOME/.local/share/scripthub"
RC_FILES=("$HOME/.bashrc" "$HOME/.zshrc")

# ------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------

# Install Mise if missing
install_mise() {
	if ! command -v mise &>/dev/null; then
		echo "⚠️  'mise' not found! Installing..."
		curl -fsSL https://mise.run | sh
		export PATH="$HOME/.local/bin:$PATH"
		echo "✅ 'mise' installed!"
	else
		echo "✅ 'mise' already installed."
	fi
}

# Activate Mise for current session and RC files
activate_mise() {
	local shell_type=$1
	eval "$("$HOME"/.local/bin/mise activate "$shell_type")"

	for rc_file in "${RC_FILES[@]}"; do
		[[ ! -f "$rc_file" ]] && continue
		if ! grep -q "mise activate $shell_type" "$rc_file"; then
			echo "eval \"\$HOME/.local/bin/mise activate $shell_type\"" >>"$rc_file"
			echo "✅ Added mise activation to $rc_file"
		fi
	done
}

# Install and trust required tools
install_tools() {
	local tools=("gum@latest")
	for tool in "${tools[@]}"; do
		echo "⚡ Installing $tool via mise..."
		mise use -g "$tool"
	done

	# Trust the local mise config to suppress warnings
	if [[ -f "$INSTALL_DIR/mise.toml" ]]; then
		mise trust "$INSTALL_DIR/mise.toml" &>/dev/null || true
		echo "✅ Trusted $INSTALL_DIR/mise.toml"
	fi
}

# Clone scripthub repo if missing
clone_repo() {
	if [[ ! -d "$INSTALL_DIR" ]]; then
		echo "📦 Cloning Scripthub to $INSTALL_DIR..."
		git clone "$REPO_URL" "$INSTALL_DIR"
		chmod +x "$INSTALL_DIR/scripthub"
		echo "✅ Scripthub cloned!"
	else
		echo "✅ Scripthub already exists."
	fi
}

# Add install dir to PATH
ensure_path() {
	for rc_file in "${RC_FILES[@]}"; do
		[[ ! -f "$rc_file" ]] && continue
		if ! grep -q "$INSTALL_DIR" "$rc_file"; then
			echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >>"$rc_file"
			echo "✅ Updated PATH in $rc_file"
		fi
	done
	export PATH="$INSTALL_DIR:$PATH"
}

# ------------------------------------------------------------------
# Main
# ------------------------------------------------------------------
main() {
	install_mise

	# Activate Mise for both bash and zsh
	activate_mise bash
	activate_mise zsh

	install_tools
	clone_repo
	ensure_path

	echo
	echo "🎉 Installation complete!"
	echo "👉 To refresh your current shell, run:"
	echo "   source ~/.bashrc   # or source ~/.zshrc"
	echo "Then you can run 'scripthub' from anywhere."
}

main
