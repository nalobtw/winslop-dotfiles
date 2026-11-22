# Installs the verified core Winget package IDs only. Unavailable IDs are skipped safely.
$ErrorActionPreference = 'Continue'
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error 'winget is unavailable. Install/repair App Installer from Microsoft Store, then rerun.'
    exit 1
}
$Packages = @(
    'AmN.yasb',
    'LGUG2Z.komorebi',
    'LGUG2Z.whkd',
    'LGUG2Z.masir',
    'RamenSoftware.Windhawk',
    'Flow-Launcher.Flow-Launcher',
    'Microsoft.WindowsTerminal',
    'Fastfetch-cli.Fastfetch',
    'JanDeDobbeleer.OhMyPosh',
    'ZedIndustries.Zed',
    'Zen-Team.Zen-Browser',
    'shinchiro.mpv',
    'jurplel.qView',
    'yt-dlp.yt-dlp',
    'OBSProject.OBSStudio',
    'ShareX.ShareX',
    'Git.Git',
    'DEVCOM.JetBrainsMonoNerdFont',
    'Microsoft.PowerShell',
    'Rustlang.Rustup',
    'GoLang.Go',
    'Kitware.CMake',
    'BurntSushi.ripgrep.MSVC',
    'junegunn.fzf',
    'sxyazi.yazi'
)
foreach ($Id in $Packages) {
    Write-Host "`n==> Checking $Id" -ForegroundColor Cyan
    $ShowArgs = @('show', '--id', $Id, '--exact', '--source', 'winget', '--accept-source-agreements')
    $InstallArgs = @('install', '--id', $Id, '--exact', '--source', 'winget', '--silent', '--accept-package-agreements', '--accept-source-agreements')
    if ($Id -eq 'LGUG2Z.komorebi') {
        $ShowArgs += @('--version', '0.1.41')
        $InstallArgs += @('--version', '0.1.41')
    }
    & winget @ShowArgs *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Package ID/version not found in the current Winget source; skipped: $Id"
        continue
    }
    & winget @InstallArgs
    if ($LASTEXITCODE -ne 0) { Write-Warning "Install returned exit code $LASTEXITCODE for $Id" }
}
Write-Host 'Core Winget phase complete. Review skipped IDs and reboot if font installers request it.' -ForegroundColor Green
