# KDE Plasma 6 Dotfiles

Personal **KDE Plasma 6 (Wayland)** desktop configuration on **CachyOS**.

## Highlights

- **Custom `CalmGlass` Plasma Style** (`local/share/plasma/desktoptheme/CalmGlass/`): deep dark frosted glass (`#12161c`), 1px glass hairline borders, 16px rounded corners, cutout shadows, and muted alpine-blue accents (`#7aafcc`).
- **Top Bar**: floating adaptive glass bar (`36px`) with application launcher on the left, dead-center `ddd, MMM d` clock in semi-bold `Segoe UI`, Fcitx5 indicator, and a tidy status-focused system tray on the right.
- **Bottom Dock**: centered Fit-Content floating glass dock (`56px`, single-row) in **Dodge Windows** mode.
- **Window Decorations**: native **Breeze** decorations (`BorderSize=NoSides`) with **Layan** color scheme, **Tela** icon theme, and **Layan-white-cursors**.
- **Smooth Font Rendering**: RGB subpixel antialiasing (`rgba=rgb`), `lcddefault` filter, `hintslight`, `embeddedbitmap=false`, and FreeType v40 + stem darkening (`environment.d/90-freetype-smoothing.conf`) synced across Fontconfig, GTK3, GTK4, XSettings, and Xresources.

## Structure

```text
.
├── config/                  # ~/.config KDE Plasma, KWin, Fontconfig, GTK, XSettings, environment.d
├── home/                    # ~/.Xresources
├── local/share/             # Custom CalmGlass Plasma theme & Layan color scheme
└── install.sh               # Safe restore script (creates a timestamped backup first)
```

## Restore / Install

```bash
git clone https://github.com/Fragile24/kde-dotfiles.git
cd kde-dotfiles
./install.sh
```

> **Note:** Private/machine-specific files (`kdeconnect` keys, SSH configs, monitor EDID configs, proprietary fonts, and large wallpaper binaries) are intentionally excluded.
