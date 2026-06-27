#!/usr/bin/env bash
# install.sh — Fresh NixOS install script for mattwilliams-account/nix-dots
# Targets: nixosConfigurations.nixy, user: loki
# Usage: Run as your normal user after booting into a fresh NixOS install.

set -euo pipefail

# ────────────────────────────────────────────────
# Config
# ────────────────────────────────────────────────
REPO_URL="https://github.com/mattwilliams-account/nix-dots"
DOTS_DIR="$HOME/nix-dots"
FLAKE_TARGET="nixy"

# ────────────────────────────────────────────────
# Helpers
# ────────────────────────────────────────────────
info() { echo -e "\e[1;34m[INFO]\e[0m  $*"; }
ok() { echo -e "\e[1;32m[OK]\e[0m    $*"; }
warn() { echo -e "\e[1;33m[WARN]\e[0m  $*"; }
die() {
  echo -e "\e[1;31m[ERROR]\e[0m $*" >&2
  exit 1
}

# ────────────────────────────────────────────────
# Pre-flight checks
# ────────────────────────────────────────────────
info "Running pre-flight checks..."

[[ -f /etc/nixos/hardware-configuration.nix ]] ||
  die "/etc/nixos/hardware-configuration.nix not found. Run 'sudo nixos-generate-config' first."

command -v git >/dev/null 2>&1 ||
  die "git is not available. Run: nix-shell -p git"

if [[ $EUID -eq 0 ]]; then
  die "Do not run this script as root. Run it as your normal user; sudo will be used where needed."
fi

ok "Pre-flight checks passed."

# ────────────────────────────────────────────────
# Enable flakes for this session
# ────────────────────────────────────────────────
info "Enabling flakes for this session..."
export NIX_CONFIG="experimental-features = nix-command flakes"

# ────────────────────────────────────────────────
# Clone or update repo
# ────────────────────────────────────────────────
if [[ -d "$DOTS_DIR/.git" ]]; then
  info "Repo already exists at $DOTS_DIR — pulling latest..."
  git -C "$DOTS_DIR" pull
else
  info "Cloning $REPO_URL into $DOTS_DIR..."
  git clone "$REPO_URL" "$DOTS_DIR"
fi

ok "Repo ready at $DOTS_DIR."

# ────────────────────────────────────────────────
# Copy hardware-configuration.nix
# ────────────────────────────────────────────────
info "Copying hardware-configuration.nix into dotfiles directory..."

[[ -f "$DOTS_DIR/hardware-configuration.nix" ]] &&
  warn "Overwriting existing hardware-configuration.nix in $DOTS_DIR."

cp /etc/nixos/hardware-configuration.nix "$DOTS_DIR/hardware-configuration.nix"
ok "hardware-configuration.nix copied."

# ────────────────────────────────────────────────
# SDDM theme check
# ────────────────────────────────────────────────
# configuration.nix expects the theme at: /home/loki/nixos-dots/sddm/pixel-rainyroom
# This path is outside the cloned repo — warn if missing so SDDM doesn't silently fail.
SDDM_THEME_PATH="$DOTS_DIR/sddm/pixel-rainyroom"
if [[ ! -d "$SDDM_THEME_PATH" ]]; then
  warn "SDDM theme not found at $SDDM_THEME_PATH"
  warn "SDDM may fail to start. Place the theme there manually, or update"
  warn "services.displayManager.sddm.theme in configuration.nix before rebooting."
fi

# ────────────────────────────────────────────────
# Run nixos-rebuild
# ────────────────────────────────────────────────
info "Running nixos-rebuild switch..."
info "  Flake: $DOTS_DIR#$FLAKE_TARGET"
echo ""

sudo nixos-rebuild switch --flake "$DOTS_DIR#$FLAKE_TARGET"

echo ""
ok "nixos-rebuild completed successfully!"
echo ""
echo "  Next steps:"
echo "  • Reboot to load SDDM and Hyprland cleanly."
echo "  • If the SDDM theme is missing, place it at:"
echo "      $SDDM_THEME_PATH"
echo "  • Home Manager for user 'loki' was applied via the NixOS module."
