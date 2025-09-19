#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------
# Scripthub Installation Script (Functional)
# Installs Mise, Gum, sets up PATH, updates shell rc files, trusts config
# ------------------------------------------------------------------

INSTALL_DIR="$HOME/.local/share/scripthub"
MISERUN="$HOME/.local/bin/mise"

# ------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------

add_to_rc() {
	local line="$1"
	local rc_file="$2"
	if [[ -f "$rc_file" ]] && ! grep -Fxq "$line" "$rc_file"; then
		echo "$line" >>"$rc_file"
		echo "✅ Added to $rc_file"
	fi
}

install_mise() {
	if ! command -v mise &>/dev/null; then
		echo "⚠️  'mise' not found! Installing..."
		curl -fsSL https://mise.run | sh
		echo "✅ 'mise' installed!"
	else
		echo "✅ 'mise' already installed"
	fi

	# Ensure PATH and activation persist
	for rc_file in "$HOME/.bashrc" "$HOME/.zshrc"; do
		add_to_rc "export PATH=\"\$HOME/.local/bin:\$PATH\"" "$rc_file"
		shell=$(basename "$rc_file" | sed 's/rc//')
		add_to_rc "eval \"\$HOME/.local/bin/mise activate $shell\"" "$rc_file"
	done

	# Activate for current session
	export PATH="$HOME/.local/bin:$PATH"
	eval "$("$MISERUN" activate bash)"
}

install_gum() {
	if ! command -v gum &>/dev/null; then
		echo "⚠️  'gum' not found! Installing via Mise..."
		"$MISERUN" use -g gum@latest
		echo "✅ 'gum' activated!"
	else
		echo "✅ 'gum' already available"
	fi
}

trust_mise_config() {
	local config_file="$INSTALL_DIR/mise.toml"
	if [[ -f "$config_file" ]]; then
		"$MISERUN" trust "$config_file" &>/dev/null || true
		echo "✅ Trusted $config_file"
	fi
}

ensure_path() {
	if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
		export PATH="$INSTALL_DIR:$PATH"
		for rc_file in "$HOME/.bashrc" "$HOME/.zshrc"; do
			add_to_rc "export PATH=\"$INSTALL_DIR:\$PATH\"" "$rc_file"
		done
		echo "✅ Updated PATH for current session and rc files"
	fi
}

source_rc_files() {
	# shellcheck disable=SC1091
	[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
	# shellcheck disable=SC1091
	[[ -f "$HOME/.zshrc" ]] && source "$HOME/.zshrc"
}

# ------------------------------------------------------------------
# Main
# ------------------------------------------------------------------
main() {
	install_mise
	install_gum
	trust_mise_config
	ensure_path
	source_rc_files
	echo "🎉 Installation complete! Restart your terminal or run 'source ~/.bashrc' or 'source ~/.zshrc' to refresh."
}

main "$@"
