# KDE Plasma 6 Dotfiles & Themes

Full backup of my **KDE Plasma 6 (Wayland)** configuration, desktop themes, plasmoids, cursor themes, terminal/shell configs, and smooth font rendering settings on **CachyOS**.

## What's Backed Up

### Configs (`config/` & `home/`)
- **KDE Plasma & KWin**: `kdeglobals`, `kwinrc`, `plasmarc`, `plasmashellrc`, `plasma-org.kde.plasma.desktop-appletsrc`, `plasma-io.gitgud.wackyideas.desktop-appletsrc`, `kglobalshortcutsrc`, `kcminputrc`, `kcmfonts`, `kxkbrc`, `kdedefaults/`, `Kvantum/`, `dolphinrc`, `konsolerc`, `katerc`, `katevirc`, `harunarc`, `arkrc`, `libinput-gestures.conf`, `mimeapps.list`
- **Smooth Font Rendering & GTK/X11**: `fontconfig/fonts.conf` (`hintnone`, `rgba=rgb`, `lcddefault`, `embeddedbitmap=false`), `environment.d/90-freetype-smoothing.conf`, `gtk-3.0/`, `gtk-4.0/`, `xsettingsd/xsettingsd.conf`, `.Xresources`, `.gtkrc-2.0`
- **Terminal, Input & Shell**: `kitty/`, `alacritty/`, `fastfetch/`, `fcitx5/`, `fish/config.fish`, `.zshrc`, `.bashrc`, `.bash_profile`

### Themes, Widgets & Cursors (`local/share/` & `icons/`)
- **Plasma Desktop Themes** (`local/share/plasma/desktoptheme/`): `CalmGlass`, `Layan`, `Monochrome`, `Nordic`, `Nordic-Solid`, `Nordic-bluish`, `Nordic-bluish-solid`, `Nordic-darker`, `Nordic-darker-solid`, `Sweet`, `Sweet-Ambar-Blue`, `Sweet-mars`
- **Global Look-and-Feel Themes** (`local/share/plasma/look-and-feel/`): `com.github.vinceliuice.Layan`, `Monochrome`, `Nordic`, `Nordic-bluish`, `Sweet`, `Sweet-Ambar-Blue`, `Sweet-Mars`
- **Plasmoids** (`local/share/plasma/plasmoids/`): `AndromedaLauncher`, `KdeControlStation`
- **Color Schemes** (`local/share/color-schemes/`): `Layan`, `LayanLight`, `Nordic`, `NordicDarker`, `nordicbluish`, `Sweet`, `Sweet-Mars`, `SweetAmbarBlue`
- **Aurorae Window Decorations** (`local/share/aurorae/`)
- **Cursor Themes** (`icons/` -> `~/.icons/`): `Layan-border-cursors`, `Layan-white-cursors`, `Nordic-cursors`, `Sweet-cursors`

### Large / System-Installed Packages (Install Separately)
To keep the repo lightweight and free of private/proprietary binaries, the following are not committed directly:
- System-installed **AeroThemePlasma** (`Seven-Black` Plasma theme, `Windows7Aero` Kvantum theme, `Windows 7 Aero` icons, `aero-drop` cursors)
- Upstream icon packs in `~/.local/share/icons/`: `Papirus` / `Papirus-Dark` / `Papirus-Light`, `Tela` / `Tela-dark` / `Tela-light`, `candy-icons`, `Nordic-*`
- Proprietary Windows `.ttf` fonts (`~/.local/share/fonts/windows/`) and wallpapers (`~/.local/share/wallpapers/`)
- Private/machine-specific files (`kdeconnect`, SSH configs, `kwinoutputconfig.json`, `kwallet`)

## Restore / Install

```bash
git clone https://github.com/Fragile24/kde-dotfiles.git ~/kde-dotfiles
cd ~/kde-dotfiles
./install.sh
```
