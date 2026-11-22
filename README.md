# winslop-dotfiles

<p align="center">
  <strong>WINSLOP · MIDNIGHT ALLEY</strong><br>
  <sub>Windows 11 · tiling-first · square geometry · wallpaper-derived palette</sub>
</p>

<p align="center">
  <img src="assets/wallpaper/alley.PNG" alt="Midnight Alley default wallpaper" width="780">
</p>

<p align="center">
  <code>YASB</code> · <code>Komorebi</code> · <code>WHKD</code> · <code>Windhawk</code> · <code>Flow Launcher</code>
</p>

A carefully organised Windows 11 desktop configuration for a **Lenovo ThinkPad X1 Carbon Gen 7** (Core i7-8565U, Intel UHD Graphics 620, 1440p 16:9). The goal is a restrained, consistent environment inspired by Hyprland-style tiling desktops: square corners, clear spacing, a single wallpaper-derived colour system, responsive motion and minimal shell clutter.

> **Status:** Configuration baseline and install scaffolding. Some third-party apps and Windows shell mods need one-time manual setup, as noted below. The scripts never silently overwrite an existing Windows Terminal profile or an existing Zed settings file.

---

## Contents

- [Design goals](#design-goals)
- [Lineage and credits](#lineage-and-credits)
- [Wallpaper palette](#wallpaper-palette)
- [Desktop stack](#desktop-stack)
- [Window manager decision: Komorebi or Astur](#window-manager-decision-komorebi-or-astur)
- [Repository layout](#repository-layout)
- [Requirements and preparation](#requirements-and-preparation)
- [Installation](#installation)
- [After installation](#after-installation)
- [Keybindings](#keybindings)
- [Typography](#typography)
- [Windows shell and Windhawk](#windows-shell-and-windhawk)
- [Terminal and CLI tools](#terminal-and-cli-tools)
- [Known limitations and verification notes](#known-limitations-and-verification-notes)
- [Updating and rollback](#updating-and-rollback)
- [Publishing to Codeberg](#publishing-to-codeberg)

---

## Design goals

| Area | Decision |
|---|---|
| Geometry | Square corners everywhere the app or mod exposes a supported control |
| Desktop | Dark, wallpaper-matched indigo/violet-grey |
| Borders | Shared muted blue-grey `#777C90`; focused Komorebi windows only are visibly outlined |
| Spacing | 6px tiled-container gap; 3px Komorebi border width and 3px border offset |
| Motion | Short, ease-out animations, target 60 FPS, no bounce |
| Window focus | Focus follows pointer via Masir; pointer does not warp to keyboard-focused window |
| Inactive windows | No Komorebi dimming or alpha reduction |
| Transparency | Selected utility popups only; normal app windows remain opaque |
| Typeface | JetBrainsMono Nerd Font wherever the application supports custom fonts |
| Language | British English; UK keyboard layout |
| Region | Luxembourg; YASB weather location default is country-level |

## Lineage and credits

This setup is **based on and inspired by** [SleepyCatHey/Ultimate-Win11-Setup](https://github.com/SleepyCatHey/Ultimate-Win11-Setup). This repository is a separate configuration, with its own wallpaper-derived palette, YASB/Komorebi/WHKD configuration, install scripts and documentation. The upstream project is credited as inspiration; this does not imply that every file is copied from it.

Default wallpaper source: [whvn.cc/o5jv65](https://whvn.cc/o5jv65). The supplied wallpaper file is included at `assets/wallpaper/alley.PNG` for reproducible palette use. Retain the original wallpaper's licensing/creator attribution if republishing it; check the wallpaper page's licence before redistribution.

## Wallpaper palette

The palette is a custom set curated from the dark indigo, smoky violet-grey and muted cyan/mauve/pink highlights in the included image. It is Catppuccin-compatible, but **not** an official Catppuccin preset.

| Role | Hex | Usage |
|---|---:|---|
| Background | `#151320` | Desktop and invisible inactive border fallback |
| Mantle | `#1A1726` | Recessed panels |
| Bar | `#201D2C` | YASB bar |
| Surface | `#2B2839` | Bar modules and cards |
| Hover | `#3E3A4C` | Focused/hovered module states |
| Overlay | `#5B5366` | Subtle secondary contrast |
| Border | `#777C90` | Bar, popup and active window outline |
| Text | `#C5BEB1` | Main text |
| Secondary | `#A49AAE` | Lower emphasis text |
| Mauve | `#B9A2D0` | Selected accent |
| Cyan | `#9FC3CD` | Informational accent |
| Sapphire | `#8FB3C2` | Audio visualiser |
| Dusty blue | `#879DBD` | Secondary accent |
| Rose | `#CF879B` | Shutdown/destructive accent |
| Peach | `#D4A68F` | Restart/warning accent |

See [`palette/README.md`](palette/README.md) and [`palette/palette.json`](palette/palette.json) for the full palette. The intended surface tint is **85% opaque / 15% transparent**. This preserves the user's intended “85% transparency” direction while keeping text readable over the dark/light parts of the wallpaper.

## Desktop stack

### Shell and window management

- **YASB** — bottom 26px status bar; taskbar, workspaces, active layout menu, clock, weather, CPU, memory, CAVA, media, systray, wallpaper picker, notifications, control centre and power menu.
- **Komorebi v0.1.41** — pinned to match the checked-in schema; BSP default on ten configured workspaces; click the YASB active-layout module to choose from the supported layouts.
- **WHKD** — the explicit keybinding map in `configs/whkd/whkdrc`.
- **Masir** — focus-follows-mouse daemon, launched by Komorebi's `--masir` switch.
- **thide** — optional helper to hide the native Windows taskbar when using YASB; install from [official releases](https://github.com/amnweb/thide/releases) and test its show/restore method before enabling auto-hide.

### Windows shell styling

- **Windhawk** mods: Start Menu Styler, Notification Center Styler, Resource Redirect, Shell Flyout Positions, File Explorer Styler, Custom Window Corner Radius.
- **Windows native taskbar**: hide with thide after confirming YASB is stable; keep a recovery path to show the taskbar again.
- **Square geometry**: use app-level square settings plus the DWM window-corner mod. Some application-internal controls are not governed by DWM corner radius.

### Launcher and file navigation

- **Flow Launcher** — primary launcher; set its global hotkey to `Alt+Space`, install `configs/flow/Winslop.xaml`, and keep Astur's built-in launcher disabled/not used during any Astur trial.
- **SPAN Finder** — intended default file manager. The exact authoritative Windows package/source and executable path were not verifiable during preparation. Install from the publisher/source you trust, then edit `launch-spanfinder.ps1` with the real executable path. `Alt+E` calls this wrapper.

### Editor and creative tools

- **Zed** — main code editor; built-in Catppuccin Mocha theme, JetBrainsMono Nerd Font.
- **mpv** — video player; installed through the maintained `shinchiro.mpv` WinGet package; `configs/mpv/mpv.conf` is a lightweight UHD 620-friendly baseline.
- **qView** — image viewer; installed through the `jurplel.qView` WinGet package.
- **Zen Browser** — default browser; installed through the `Zen-Team.Zen-Browser` WinGet package.
- **ShareX** — screenshots and capture.
- **OBS Studio** — screen recording/streaming.

### Terminal and development

- **Windows Terminal** — default terminal; merge `configs/terminal/settings.fragment.json` into your existing `settings.json` rather than replacing it.
- **Fastfetch** — ThinkPad ASCII header + system info, started by the PowerShell profile snippet.
- **Oh My Posh** — minimal `user@hostname` + current path prompt.
- **JetBrainsMono Nerd Font** — configured in YASB, Flow, Zed, Windows Terminal and terminal prompt where supported.
- **Git, PowerShell 7, PSReadLine, curl, WinGet, Scoop, Chocolatey, ripgrep, fzf, Yazi, Rust, Go, CMake, yt-dlp** — toolchain baseline.

## Window manager decision: Komorebi or Astur

### Primary recommendation: keep Komorebi for this repo baseline; evaluate Astur Full in a separate trial

Astur Full is attractive for this particular taste: it has a native **Dwindle** layout, five layouts, animated behaviour, window movement/resizing with Alt-drag, ten default workspace shortcuts, and a settings GUI. It is worth testing. The current official docs also expose a built-in launcher/file search/calculator, system menu and navbar.

The migration is not yet a no-compromise fit for the exact design requested here:

1. Astur's documented YASB integration is workspace-focused; it does not provide a documented direct substitute for YASB's Komorebi active-layout widget and layout-selection menu.
2. Astur's default bindings overlap with your requested map (`Alt+Space`, `Alt+F`, `Alt+W`, arrows and workspace bindings). Astur supports rebinding many letter keys, but its current docs do not clearly specify a safe unbound value for every built-in action. We should not assume Flow can take `Alt+Space` until this is tested.
3. Keeping YASB as the only bar and Flow as the only launcher requires disabling Astur's redundant UI without breaking its WM core.

Komorebi remains the baseline because your current YASB widgets already provide the click-to-open layout menu, and its v0.1.41 schema supports the required borders, border offset, workspace setup and Masir integration. See [`docs/ASTUR-REVIEW.md`](docs/ASTUR-REVIEW.md) for an isolated test procedure. Do **not** run Astur and Komorebi concurrently.

## Repository layout

```text
winslop-dotfiles/
├── README.md
├── NOTICE.md
├── .gitignore
├── assets/
│   └── wallpaper/alley.PNG
├── palette/
│   ├── README.md
│   └── palette.json
├── configs/
│   ├── yasb/config.yaml, styles.css
│   ├── komorebi/komorebi.json
│   ├── whkd/whkdrc
│   ├── powershell/profile.snippet.ps1
│   ├── fastfetch/config.jsonc, thinkpad.txt
│   ├── oh-my-posh/winslop.omp.json
│   ├── terminal/settings.fragment.json
│   ├── zed/settings.json
│   ├── mpv/mpv.conf
│   ├── flow/Winslop.xaml
│   ├── windhawk/*
│   └── launchers/launch-spanfinder.ps1
├── scripts/
│   ├── Install-Winget-Apps.ps1
│   ├── Install-DevTools.ps1
│   ├── Install-Scoop.ps1
│   ├── Install-Chocolatey.ps1
│   └── Apply-Configs.ps1
└── docs/
    ├── ASTUR-REVIEW.md
    ├── KEYBINDINGS.md
    ├── CLI-TOOLS.md
    └── WINDHAWK.md
```

## Requirements and preparation

- Windows 11 x64. Komorebi and YASB are third-party components; check current project release notes before installing/upgrading.
- A standard non-admin PowerShell session is sufficient for most per-user installs. Some package managers and system-wide integrations may prompt for elevation.
- Internet access for WinGet and package installs.
- Create a restore point or at least a full backup before applying shell mods.
- Close Komorebi/WHKD/YASB before replacing their config files.
- The user's WeatherAPI key was present in the uploaded config. It has been **removed from this public config**. Create your own WeatherAPI key and put it in `configs/yasb/config.yaml` after installation. Rotate/revoke the previously exposed key.

## Installation

### 1. Clone or extract the repository

```powershell
git clone https://codeberg.org/nalobtw/winslop-dotfiles.git
cd winslop-dotfiles
```

For a ZIP download, extract it to a folder and open PowerShell in that folder.

### 2. Install the core applications

Run the package script in a normal PowerShell terminal:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
.\scripts\Install-Winget-Apps.ps1
```

The script checks each exact ID with `winget show` first and skips IDs not available from the configured WinGet source. Review warnings rather than forcing an unknown package. It installs the core shell, editor, terminal, utilities, fonts and developer toolchain where IDs are available.

Optional package managers:

```powershell
.\scripts\Install-Scoop.ps1
```

Chocolatey is optional and requires an elevated PowerShell session:

```powershell
# Open PowerShell as Administrator only for this optional step
.\scripts\Install-Chocolatey.ps1
```

If you prefer to keep package management simple, use WinGet only. You do not need WinGet, Scoop and Chocolatey all at once.

### 3. Install manual applications

Install these separately from their current official/publisher sources:

- **thide** — install the current MSI/portable build from [the official releases](https://github.com/amnweb/thide/releases). Verify its restore/show-taskbar method before hiding the native taskbar.
- **SPAN Finder** — install the publisher's current build; set the path in the launcher wrapper as described below.
- **mpv** — installed by the WinGet script from `shinchiro.mpv` when available.
- **qView** — installed by the WinGet script when the package is available; verify it is present after the script completes.
- **Catppuccin cursor pack** — use [RuinTD/catppuccin-cursors-windows](https://github.com/RuinTD/catppuccin-cursors-windows); install the chosen cursor scheme using Windows Mouse Properties.
- **Windhawk** — install the listed mods using the app's Explore catalogue and build-specific compatibility guidance.

### 4. Apply the dotfile configuration

```powershell
.\scripts\Apply-Configs.ps1
```

The script backs up existing YASB, Komorebi and WHKD configs before copying. It also installs the wallpaper, Fastfetch config/logo, Oh My Posh theme, Flow theme, Zed settings only if none exist, and merges a managed section into the current PowerShell profile. Existing Zed settings are preserved for manual merge; Windows Terminal settings are never overwritten.

### 5. Complete first-run settings

1. Launch Flow Launcher, select **Winslop Midnight Alley**, and set its hotkey to `Alt+Space`.
2. Merge `configs/terminal/settings.fragment.json` into Windows Terminal's existing settings file. Set the default profile to PowerShell 7 if you want `pwsh` by default.
3. Set your WeatherAPI key in `%USERPROFILE%\.config\yasb\config.yaml` (`YOUR_WEATHERAPI_KEY` is a placeholder, not a working key).
4. Install JetBrainsMono Nerd Font if the package script skipped it, then restart apps so they can enumerate the font.
5. Install/enable the Windhawk mods in [`docs/WINDHAWK.md`](docs/WINDHAWK.md).
6. Install thide, test restoring the native Windows taskbar, then hide it if YASB is working reliably.
7. Set Span Finder's real executable path in `%USERPROFILE%\.config\winslop\launch-spanfinder.ps1`.
8. In Flow, set the UI scale/size to taste. Flow supports theme colour/font styling, but arbitrary window sizing is adjusted in its own settings.
9. In Windows Settings, select the Catppuccin cursor scheme.

### 6. Start and enable autostart

Launch YASB once. Its configured `start_command` starts Komorebi, WHKD and Masir. Then enable YASB autostart:

```powershell
yasbc enable-autostart
```

Restart YASB or sign out/in and check that Komorebi, WHKD and Masir all start. If you prefer scheduled startup, use `yasbc enable-autostart --task` from an elevated session.

### 7. Verify operation before daily use

- Confirm `komorebic --version` reports `0.1.41`, matching the checked-in schema. Upgrade the binary and `$schema` URL together when moving to a newer release.
- Confirm Komorebi sees `komorebi.json` and ten workspaces.
- Confirm YASB's active-layout widget opens a selection menu on left click.
- Try two tiled windows: verify 6px gaps, 3px outline width and 3px border offset.
- Focus a window by moving the pointer over it; verify pointer does not warp when you use keyboard focus.
- Confirm unfocused windows stay fully opaque.
- Test every key listed in [`docs/KEYBINDINGS.md`](docs/KEYBINDINGS.md).
- Test all taskbar preview, close, minimize and restore actions.

## After installation

### YASB modules

The bar uses a subtle darker indigo backing, while individual modules use a slightly lighter square tile. The taskbar module has its own frame and distinct focused/running/minimised styles. The workspace module is a lighter tile without an outline. Other icon modules use a restrained one-pixel outline. The line separator uses the exact shared border tone.

Taskbar state styling:

- `foreground`: current focused window.
- `running`: running but not focused.
- `running.minimized`: all app windows minimized.
- `grouped`: more than one window represented by a button.

YASB documents these CSS classes. It does not expose a dedicated CSS class telling us that a window belongs to a different Komorebi workspace. `show_only_visible: false` is configured so non-visible windows can appear, but a unique “other workspace” badge is not claimed.

### Komorebi window appearance

- Border width: 3px.
- Border offset: 3px.
- Tiled container gap: 6px.
- Focused `single`, `stack`, `floating`, and `monocle` borders: same `#777C90`.
- `unfocused` and `unfocused_locked` border colour: wallpaper base `#151320`, visually suppressing the outline against the dark desktop. Komorebi v0.1.41 exposes colour values here, not an alpha/disabled value, so this is a visual approximation to “no inactive border”.
- `transparency: false` prevents dimming/opacity changes for unfocused windows.

The old Catppuccin `theme` object was removed from the Komorebi JSON. The v0.1.41 schema explicitly states that `theme` takes precedence over `border_colours`; removing it is necessary for the custom shared border hex to apply. The border renderer converts palette colours to opaque RGB, so a truly transparent/disabled inactive border is not available through these fields. The inactive border is therefore matched to the near-black desktop base (`#151320`) as a low-visibility fallback.

### Window title bars

A window manager does not have a safe universal switch that strips every application's own title bar while preserving all native behaviours. Some applications can be borderless/fullscreened through their own settings; other windows require application-specific rules/mods. Do not use a global binary patch or registry hack that could make dialogs inaccessible. Komorebi's management and window borders are separate from each app's title-bar implementation.

## Keybindings

See [`docs/KEYBINDINGS.md`](docs/KEYBINDINGS.md). The WHKD file contains only the requested bindings. `Alt+W` is defined by the YASB wallpaper widget, and `Alt+Space` is configured in Flow itself to avoid a duplicate global hook.

## Typography

JetBrainsMono Nerd Font is configured in:

- YASB stylesheet (`--font-main` and `--font-mono`).
- Windows Terminal fragment.
- Zed settings (plus terminal font).
- Flow Launcher theme.
- Oh My Posh / PowerShell terminal environment through the terminal font.

Windows does not have a reliable, low-risk universal “replace every system font” switch. This repository configures all supported apps, but Windows shell/dialogs and third-party controls may continue to use Segoe UI or app-specific fonts. Avoid replacing system font files or editing undocumented global font mappings.

## Windows shell and Windhawk

The intended Windhawk configuration is documented in [`docs/WINDHAWK.md`](docs/WINDHAWK.md). Use the mod catalogue and inspect compatibility on the installed Windows build. The supplied Start Menu template is a starter, not a universal import. Notification Center and Explorer require their own selectors. `Shell Flyout Positions` can align Start to the left. `Custom Window Corner Radius` can set DWM-managed window corner radii to zero, but not every control inside every application.

## Terminal and CLI tools

See [`docs/CLI-TOOLS.md`](docs/CLI-TOOLS.md). A few utilities are Linux-first and belong in WSL rather than being forced into Windows. The script installs core tools only; optional/ambiguous utilities are kept out of automatic installation. `csakura` could not be identified confidently and is left unresolved rather than guessing at a similarly named package.

## Known limitations and verification notes

- **SPAN Finder**: exact authoritative Windows download and install path not confirmed. `Alt+E` calls a wrapper that must be edited with the installed path.
- **thide**: install from its official release page manually; the repository deliberately does not guess at an unverified Winget package ID.
- **Other-workspace taskbar state**: YASB exposes running/minimized/focused/grouped classes, but not a documented class for Komorebi's inactive/cloaked workspace. It is not falsely styled as a separate state.
- **Fullscreen**: `Alt+F` uses Komorebi monocle mode, which fills the managed work area. It is not guaranteed identical to F11 in every application.
- **Floating directional movement**: the same Komorebi move command is bound for all windows; verify the behaviour of third-party floating windows on the installed release.
- **No universal titlebar removal**: titlebars are owned by application windows; use per-app borderless mode when supported.
- **System-wide font**: app-level support is configured; built-in Windows dialogs may continue to use Segoe.
- **YASB API key**: replace the placeholder with a personal key locally. Do not commit API keys.
- **Windhawk selectors**: Windows shell updates can invalidate selectors; check Safe Mode/disable recovery.
- **Astur**: documented in [`docs/ASTUR-REVIEW.md`](docs/ASTUR-REVIEW.md); no Astur config is installed alongside Komorebi.

## Updating and rollback

Before updating, back up:

```text
%USERPROFILE%\komorebi.json
%USERPROFILE%\.config\whkdrc
%USERPROFILE%\.config\yasb\config.yaml
%USERPROFILE%\.config\yasb\styles.css
%APPDATA%\FlowLauncher\Themes\Winslop.xaml
```

The apply script creates timestamped backups for replaced core configs. To revert, restore the relevant `.bak` file, disable the Windhawk mod(s) that caused the issue, and restart YASB/Komorebi. If windows are hidden after a Komorebi fault, use `komorebic restore-windows` before restarting.

## Publishing to Codeberg

Create an empty repository at `https://codeberg.org/nalobtw/winslop-dotfiles`, extract this archive, then run from the extracted folder:

```powershell
git init
git switch -c main
git add .
git status
git commit -m "Initial Winslop Windows dotfiles"
git remote add origin https://codeberg.org/nalobtw/winslop-dotfiles.git
git push -u origin main
```

Review `git status` before committing. Never commit a WeatherAPI key, personal path, tokens, secrets, or private application data.
