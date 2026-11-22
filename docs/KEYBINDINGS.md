# Keybindings

These are the only WHKD global bindings defined by this repository. Flow Launcher owns `Alt+Space` in its own settings; YASB owns `Alt+W` in its wallpaper widget. They are intentionally not duplicated in WHKD.

| Shortcut | Action |
|---|---|
| `Alt+F` | Komorebi monocle toggle (fullscreen-style work-area view) |
| `Alt+Shift+F` | Toggle floating |
| `Alt+Q` | Close |
| `Alt+M` | Minimise |
| `Alt+Shift+M` | Toggle maximise |
| `Alt+E` | Launch Span Finder wrapper |
| `Alt+B` | Launch Zen (`zen.exe`) |
| `Alt+T` | Launch Windows Terminal (`wt.exe`) |
| `Alt+R` | Retile |
| `Alt+1`…`Alt+7` | Switch workspace 1…7 |
| `Alt+Shift+1`…`Alt+Shift+7` | Move focused window to workspace 1…7 |
| `Alt+Arrow` | Focus window in that direction |
| `Alt+Shift+Arrow` | Move focused window in that direction |
| `Alt+OEM Plus/Minus` | Resize horizontally |
| `Alt+Shift+OEM Plus/Minus` | Resize vertically |
| `Alt+W` | YASB wallpaper picker |
| `Alt+Space` | Flow Launcher (configure in Flow settings) |

## Important behaviour notes

- Komorebi's `toggle-monocle` fills the managed work area. It is the closest native WM fullscreen-style action, but it is not identical to an application's own F11 mode.
- Workspace numbers are zero-indexed internally by Komorebi; the WHKD mapping translates 1→0 through 7→6. Workspaces 8–10 remain visible/clickable in YASB but have no keyboard bindings in this requested keymap.
- `komorebic move <direction>` is used for tiled/floating directional movement; verify floating-window behaviour on the user's build. A robust universal WM move contract for every unmanaged/third-party floating window cannot be guaranteed.
- Span Finder's official Windows executable/package path could not be confirmed from an authoritative release source; the wrapper contains an editable default path and will report a clear error until set correctly.
