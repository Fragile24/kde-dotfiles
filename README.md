# KDE Plasma 6 Dotfiles & Themes

Full backup of my **KDE Plasma 6 (Wayland)** configuration, **Windows 7 Aero (`AeroThemePlasma`)** layout and theme switcher, additional desktop themes, plasmoids, cursor themes, terminal/shell configs, and smooth font rendering settings on **CachyOS**.

## What's Backed Up

### Configs (`config/` & `home/`)
- **Windows 7 Aero & Theme Switching**:
  - `theme-profiles/win7/` & `theme-profiles/previous/` snapshots
  - `systemd/user/plasma-plasmashell.service.d/aerothemeplasma.conf` (`PLASMA_DEFAULT_SHELL=io.gitgud.wackyideas.desktop`)
  - `systemd/user/plasma-wake-brightness-fix.service` (resets stuck KWin 30% dimming and restarts PowerDevil after S3 resume)
- **KDE Plasma & KWin**: `kdeglobals`, `kwinrc` (`SMOD` decorations, `ButtonsOnLeft=M`, `ButtonsOnRight=H_IAX`, `BorderSize=Normal`, Aero KWin effects), `plasmarc` (`Seven-Black`), `plasmashellrc`, `plasma-io.gitgud.wackyideas.desktop-appletsrc` (Windows 7 bottom taskbar + pinned launchers), `plasma-org.kde.plasma.desktop-appletsrc`, `kglobalshortcutsrc`, `kcminputrc` (`aero-drop`), `kcmfonts`, `kxkbrc`, `kdedefaults/`, `Kvantum/kvantum.kvconfig` (`Windows7Aero`), `dolphinrc`, `konsolerc`, `katerc`, `katevirc`, `harunarc`, `arkrc`, `libinput-gestures.conf`, `mimeapps.list`
- **Smooth Font Rendering & GTK/X11**: `fontconfig/fonts.conf` (`hintnone`, `rgba=rgb`, `lcddefault`, `embeddedbitmap=false`), `environment.d/90-freetype-smoothing.conf`, `gtk-3.0/`, `gtk-4.0/`, `xsettingsd/xsettingsd.conf`, `.Xresources`, `.gtkrc-2.0` (paired with `gsettings` portal `rgba` + `hinting=none` + `manual`)
- **Terminal, Input & Shell**: `kitty/`, `alacritty/`, `fastfetch/`, `fcitx5/`, `fish/`, `.zshrc`, `.bashrc`, `.bash_profile`

### Themes, Widgets, Scripts & Cursors (`local/` & `icons/`)
- **Scripts (`local/bin/` → `~/.local/bin/`)**:
  - `switch-theme` (`win7`, `save-win7`, `previous`, `apply <theme-id>`, `list`)
  - `plasma-wake-brightness-fix`
- **Global Look-and-Feel Themes (`local/share/plasma/look-and-feel/`)**: `Windows7-Aero-Custom` (custom Windows 7 theme with bottom taskbar layout & pinned launchers), `com.github.vinceliuice.Layan`, `Monochrome`, `Nordic`, `Nordic-bluish`, `Sweet`, `Sweet-Ambar-Blue`, `Sweet-Mars`
- **App Launchers (`local/share/applications/`)**: `switch-to-win7-theme.desktop`, `switch-to-previous-theme.desktop`
- **Plasma Desktop Themes (`local/share/plasma/desktoptheme/`)**: `CalmGlass`, `Layan`, `Monochrome`, `Nordic`, `Nordic-Solid`, `Nordic-bluish`, `Nordic-bluish-solid`, `Nordic-darker`, `Nordic-darker-solid`, `Sweet`, `Sweet-Ambar-Blue`, `Sweet-mars`
- **Plasmoids (`local/share/plasma/plasmoids/`)**: `AndromedaLauncher`, `KdeControlStation`
- **Color Schemes (`local/share/color-schemes/`)**: `Layan`, `LayanLight`, `Monochrome`, `Nordic`, `NordicDarker`, `nordicbluish`, `Sweet`, `Sweet-Mars`, `SweetAmbarBlue`
- **Aurorae Window Decorations (`local/share/aurorae/`)**
- **Cursor Themes (`icons/` → `~/.icons/`)**: `Layan-border-cursors`, `Layan-white-cursors`, `Nordic-cursors`, `Sweet-cursors`

### Large / System-Installed Packages (Install Separately)
To keep the repo lightweight and free of private/proprietary binaries, the following are not committed directly:
- System-installed **AeroThemePlasma** packages (`aerothemeplasma-desktop-git`, `aeroshell-smod-git`, `aeroshell-kwin-components-git`, `aeroshell-workspace-git`, `aeroshell-libplasma-git`, `aerothemeplasma-icons-git`, `aerothemeplasma-sounds-git`)
- Upstream icon packs in `~/.local/share/icons/`: `Papirus` / `Papirus-Dark` / `Papirus-Light`, `Tela` / `Tela-dark` / `Tela-light`, `candy-icons`, `Nordic-*`
- Proprietary Windows `.ttf` fonts (`~/.local/share/fonts/windows/`) and wallpapers (`~/.local/share/wallpapers/`)
- Private/machine-specific files (`kdeconnect`, SSH configs, `kwinoutputconfig.json`, `kwallet`)

## Restore / Install

```bash
git clone https://github.com/Fragile24/kde-dotfiles.git ~/kde-dotfiles
cd ~/kde-dotfiles
./install.sh
```
