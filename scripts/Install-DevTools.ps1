# Optional terminal toolchain. Run from a normal PowerShell session.
$ErrorActionPreference = 'Continue'
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { throw 'winget is required.' }
$Packages = @('Git.Git','Microsoft.PowerShell','Rustlang.Rustup','GoLang.Go','Kitware.CMake','BurntSushi.ripgrep.MSVC','junegunn.fzf','sxyazi.yazi')
foreach ($Id in $Packages) {
    winget show --id $Id --exact --source winget --accept-source-agreements *> $null
    if ($LASTEXITCODE -eq 0) { winget install --id $Id --exact --source winget --accept-package-agreements --accept-source-agreements }
    else { Write-Warning "Skipping package not found in current source: $Id" }
}
if (Get-Command pwsh -ErrorAction SilentlyContinue) {
    pwsh -NoProfile -Command "Install-Module PSReadLine -Scope CurrentUser -Force -AllowClobber"
}
