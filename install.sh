#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/kde-dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "==> Backing up existing KDE/font configs to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for f in "$REPO_DIR"/config/*; do
    base="$(basename "$f")"
    if [ -e "$HOME/.config/$base" ]; then
        cp -a "$HOME/.config/$base" "$BACKUP_DIR/"
    fi
done
if [ -f "$HOME/.Xresources" ]; then
    cp -a "$HOME/.Xresources" "$BACKUP_DIR/.Xresources"
fi

echo "==> Stopping plasmashell (if running)"
systemctl --user stop plasma-plasmashell.service 2>/dev/null || kquitapp6 plasmashell 2>/dev/null || true
sleep 1

echo "==> Installing configs into ~/.config and ~/.local/share"
mkdir -p "$HOME/.config" "$HOME/.local/share/plasma/desktoptheme" "$HOME/.local/share/color-schemes"
cp -a "$REPO_DIR"/config/. "$HOME/.config/"
if [ -f "$REPO_DIR/home/.Xresources" ]; then
    cp -a "$REPO_DIR/home/.Xresources" "$HOME/.Xresources"
fi
if [ -d "$REPO_DIR/local/share/plasma/desktoptheme/CalmGlass" ]; then
    rm -rf "$HOME/.local/share/plasma/desktoptheme/CalmGlass"
    cp -a "$REPO_DIR/local/share/plasma/desktoptheme/CalmGlass" "$HOME/.local/share/plasma/desktoptheme/"
fi
if [ -f "$REPO_DIR/local/share/color-schemes/Layan.colors" ]; then
    cp -a "$REPO_DIR/local/share/color-schemes/Layan.colors" "$HOME/.local/share/color-schemes/"
fi

echo "==> Clearing Plasma SVG cache & rebuilding font cache"
rm -rf "$HOME"/.cache/plasma_theme_* "$HOME"/.cache/ksvg-elements* "$HOME"/.cache/plasma-svgelements*
fc-cache -f || true
xrdb -merge "$HOME/.Xresources" 2>/dev/null || true
pkill -HUP xsettingsd 2>/dev/null || true

echo "==> Restarting plasmashell"
systemctl --user start plasma-plasmashell.service 2>/dev/null || (nohup plasmashell --replace >/dev/null 2>&1 &)

echo "==> Done! Log out and back in once so environment.d FreeType stem darkening applies everywhere."
