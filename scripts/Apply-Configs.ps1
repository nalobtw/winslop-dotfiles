param([switch]$NoAutostart)
$ErrorActionPreference = 'Stop'
$Repo = Split-Path -Parent $PSScriptRoot
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
function Copy-WithBackup([string]$Source, [string]$Destination) {
    $Parent = Split-Path -Parent $Destination
    New-Item -ItemType Directory -Force -Path $Parent | Out-Null
    if (Test-Path -LiteralPath $Destination) {
        Copy-Item -LiteralPath $Destination -Destination "$Destination.$Stamp.bak" -Force
    }
    Copy-Item -LiteralPath $Source -Destination $Destination -Force
    Write-Host "Installed: $Destination" -ForegroundColor Green
}

$YasbDir = Join-Path $HOME '.config\yasb'
Copy-WithBackup (Join-Path $Repo 'configs\yasb\config.yaml') (Join-Path $YasbDir 'config.yaml')
Copy-WithBackup (Join-Path $Repo 'configs\yasb\styles.css') (Join-Path $YasbDir 'styles.css')
Copy-WithBackup (Join-Path $Repo 'configs\komorebi\komorebi.json') (Join-Path $HOME 'komorebi.json')
$WhkdDir = Join-Path $HOME '.config'
Copy-WithBackup (Join-Path $Repo 'configs\whkd\whkdrc') (Join-Path $WhkdDir 'whkdrc')

$WinslopDir = Join-Path $HOME '.config\winslop'
New-Item -ItemType Directory -Force -Path $WinslopDir | Out-Null
Copy-WithBackup (Join-Path $Repo 'configs\launchers\launch-spanfinder.ps1') (Join-Path $WinslopDir 'launch-spanfinder.ps1')
$WallpaperDir = Join-Path $HOME 'Pictures\Wallpapers'
New-Item -ItemType Directory -Force -Path $WallpaperDir | Out-Null
Copy-Item (Join-Path $Repo 'assets\wallpaper\alley.PNG') (Join-Path $WallpaperDir 'alley.PNG') -Force
$YamlPath = Join-Path $YasbDir 'config.yaml'
$YamlText = Get-Content -LiteralPath $YamlPath -Raw
$YamlText = $YamlText.Replace('__WINSLOP_WALLPAPER_DIR__', $WallpaperDir)
Set-Content -LiteralPath $YamlPath -Value $YamlText -Encoding utf8

$FastfetchDir = Join-Path $HOME '.config\fastfetch'
New-Item -ItemType Directory -Force -Path $FastfetchDir | Out-Null
$FastfetchJson = Get-Content (Join-Path $Repo 'configs\fastfetch\config.jsonc') -Raw
$LogoPath = (Join-Path $FastfetchDir 'thinkpad.txt').Replace('\','\\')
$FastfetchJson = $FastfetchJson.Replace('__WINSLOP_FASTFETCH_LOGO__',$LogoPath)
Set-Content (Join-Path $FastfetchDir 'config.jsonc') $FastfetchJson -Encoding utf8
Copy-Item (Join-Path $Repo 'configs\fastfetch\thinkpad.txt') (Join-Path $FastfetchDir 'thinkpad.txt') -Force

$OmpDir = Join-Path $HOME '.config\oh-my-posh'
New-Item -ItemType Directory -Force -Path $OmpDir | Out-Null
Copy-Item (Join-Path $Repo 'configs\oh-my-posh\winslop.omp.json') (Join-Path $OmpDir 'winslop.omp.json') -Force

$ProfilePath = $PROFILE.CurrentUserAllHosts
New-Item -ItemType Directory -Force -Path (Split-Path -Parent $ProfilePath) | Out-Null
if (-not (Test-Path $ProfilePath)) { New-Item -ItemType File -Force -Path $ProfilePath | Out-Null }
$ProfileText = Get-Content $ProfilePath -Raw
$Start = '# >>> WINSLOP DOTFILES >>>'
$End = '# <<< WINSLOP DOTFILES <<<'
$Snippet = Get-Content (Join-Path $Repo 'configs\powershell\profile.snippet.ps1') -Raw
$Managed = "$Start`r`n$Snippet`r`n$End"
if ($ProfileText -match '(?s)# >>> WINSLOP DOTFILES >>>.*?# <<< WINSLOP DOTFILES <<<') {
    $ProfileText = [regex]::Replace($ProfileText,'(?s)# >>> WINSLOP DOTFILES >>>.*?# <<< WINSLOP DOTFILES <<<',[System.Text.RegularExpressions.MatchEvaluator]{ param($m) $Managed })
} else { $ProfileText += "`r`n`r`n$Managed`r`n" }
Set-Content -LiteralPath $ProfilePath -Value $ProfileText -Encoding utf8

# Flow Launcher theme is copied; choose it in Flow Settings > Theme.
$FlowThemeDir = Join-Path $env:APPDATA 'FlowLauncher\Themes'
New-Item -ItemType Directory -Force -Path $FlowThemeDir | Out-Null
Copy-WithBackup (Join-Path $Repo 'configs\flow\Winslop.xaml') (Join-Path $FlowThemeDir 'Winslop.xaml')

# Zed settings: only install automatically if no user settings exist.
$ZedSettings = Join-Path $env:APPDATA 'Zed\settings.json'
if (-not (Test-Path $ZedSettings)) { Copy-WithBackup (Join-Path $Repo 'configs\zed\settings.json') $ZedSettings }
else { Write-Warning "Existing Zed settings preserved. Merge configs\zed\settings.json manually: $ZedSettings" }

# Windows Terminal settings are a merge fragment and are never overwritten here.
Write-Warning 'Merge configs\terminal\settings.fragment.json into Windows Terminal settings.json manually.'
Write-Warning 'Set the Flow Launcher hotkey to Alt+Space in Flow settings. WHKD intentionally does not bind it.'
Write-Warning 'Set SpanFinder executable path in the installed launch-spanfinder.ps1 if the default path differs.'
if (-not $NoAutostart -and (Get-Command yasbc -ErrorAction SilentlyContinue)) {
    yasbc enable-autostart
    Write-Host 'YASB autostart enabled; Komorebi/WHKD/Masir start via YASB start_command.' -ForegroundColor Green
} elseif (-not $NoAutostart) { Write-Warning 'yasbc not found; enable YASB autostart after installing YASB.' }
Write-Host 'Apply phase complete. Log out/in or restart YASB before testing shortcuts.' -ForegroundColor Green
