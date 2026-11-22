# Optional per-user package manager. Review https://scoop.sh before running.
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}
scoop bucket add extras
scoop bucket add nerd-fonts
