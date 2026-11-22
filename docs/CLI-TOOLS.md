# Terminal and CLI toolbox

## Core Windows-native tools

- Git, PowerShell 7, curl.exe (included with current Windows 11), WinGet/App Installer
- Scoop (optional user-scoped package manager) and Chocolatey (optional elevated package manager)
- ripgrep (`rg`), fzf, Yazi, PSReadLine, Oh My Posh, Fastfetch
- Rust via rustup, Go, CMake

## Additional utilities

| Tool | Intended route | Notes |
|---|---|---|
| btop | WSL or supported Scoop build | Native Windows availability/build varies; WSL is the predictable route. |
| cava | WSL or a supported Windows build | YASB's CAVA widget needs its own compatible CAVA executable. |
| yt-dlp | Winget / Python / Scoop | Keep current; respect publisher and platform terms. |
| ani-cli | WSL | Bash-oriented; use only with services/content you are authorised to access. |
| moviebox-tui | Optional/manual | Third-party catalogue client. Availability/source and licensing vary; do not install or run automatically. Use only lawful sources and verify its current upstream. |
| peaclock | Cargo / source | Install from its maintained upstream when needed. |
| cbonsai | WSL/Linux | Shell utility; WSL is the safer route. |
| unimatrix | WSL/Linux | Terminal visual effect; not required for core setup. |
| hollywood | WSL/Linux | Terminal simulation tool; not required for core setup. |
| genact | Cargo / source | Check active upstream and package availability before building. |
| pipes-rs | Cargo / source | Check current crate/repo before install. |
| cowsay | WSL/Linux or package manager | Cosmetic. |
| ascii-splash | Manual/source verification | Name is ambiguous; no single authoritative Windows package was verified. |
| csakura | Needs clarification | Could not verify the exact project name/source; intentionally not auto-installed. |

The repository's install script deliberately installs only the core package list and verifies package IDs with `winget show` before attempting installation. It does not blindly install unverified CLI names.
