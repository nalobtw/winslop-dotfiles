# Winslop Dotfiles — managed interactive PowerShell profile section
Import-Module PSReadLine -ErrorAction SilentlyContinue
if (Get-Module PSReadLine) {
    Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
    Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction SilentlyContinue
    Set-PSReadLineOption -EditMode Windows -ErrorAction SilentlyContinue
}

$WinslopOmp = Join-Path $HOME '.config\oh-my-posh\winslop.omp.json'
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config $WinslopOmp | Invoke-Expression
}

if ($Host.Name -eq 'ConsoleHost' -and (Get-Command fastfetch -ErrorAction SilentlyContinue)) {
    fastfetch --config (Join-Path $HOME '.config\fastfetch\config.jsonc')
}
