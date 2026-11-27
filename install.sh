#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/kde-dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "==> Backing up existing configs to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for f in "$REPO_DIR"/config/*; do
    base="$(basename "$f")"
    if [ -e "$HOME/.config/$base" ]; then
        cp -a "$HOME/.config/$base" "$BACKUP_DIR/"
    fi
done
for f in "$REPO_DIR"/home/.*; do
    base="$(basename "$f")"
    [[ "$base" == "." || "$base" == ".." ]] && continue
    if [ -e "$HOME/$base" ]; then
        cp -a "$HOME/$base" "$BACKUP_DIR/$base"
    fi
done

echo "==> Stopping plasmashell (if running)"
systemctl --user stop plasma-plasmashell.service 2>/dev/null || kquitapp6 plasmashell 2>/dev/null || true
sleep 1

echo "==> Installing ~/.config, home dotfiles, themes, plasmoids, scripts, and cursors"
mkdir -p "$HOME/.config" "$HOME/.local/share" "$HOME/.local/bin" "$HOME/.icons"
cp -a "$REPO_DIR"/config/. "$HOME/.config/"
cp -a "$REPO_DIR"/home/. "$HOME/"
cp -a "$REPO_DIR"/local/share/. "$HOME/.local/share/"
if [ -d "$REPO_DIR/local/bin" ]; then
    cp -a "$REPO_DIR"/local/bin/. "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/switch-theme" "$HOME/.local/bin/plasma-wake-brightness-fix" 2>/dev/null || true
fi
if [ -d "$REPO_DIR/icons" ]; then
    cp -a "$REPO_DIR"/icons/. "$HOME/.icons/"
fi

echo "==> Applying GTK/Portal smooth font settings & systemd user services"
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' 2>/dev/null || true
    gsettings set org.gnome.desktop.interface font-hinting 'none' 2>/dev/null || true
    gsettings set org.gnome.desktop.interface font-rendering 'manual' 2>/dev/null || true
    gsettings set org.gnome.desktop.interface font-rgba-order 'rgb' 2>/dev/null || true
fi
systemctl --user daemon-reload 2>/dev/null || true
systemctl --user enable --now plasma-wake-brightness-fix.service 2>/dev/null || true

echo "==> Clearing Plasma SVG cache & rebuilding font/application caches"
rm -rf "$HOME"/.cache/plasma_theme_* "$HOME"/.cache/ksvg-elements* "$HOME"/.cache/plasma-svgelements*
fc-cache -f || true
xrdb -merge "$HOME/.Xresources" 2>/dev/null || true
pkill -HUP xsettingsd 2>/dev/null || true
kbuildsycoca6 2>/dev/null || true
qdbus6 org.kde.KWin /KWin reconfigure 2>/dev/null || true

echo "==> Restarting plasmashell"
systemctl --user start plasma-plasmashell.service 2>/dev/null || (nohup plasmashell --replace >/dev/null 2>&1 &)

echo "==> Done! Log out and back in once so environment.d settings apply to all apps."
