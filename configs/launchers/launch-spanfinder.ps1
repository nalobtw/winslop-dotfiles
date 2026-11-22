# Set this to the actual Span Finder executable after installing it.
$SpanFinderExe = Join-Path $env:LOCALAPPDATA 'Programs\SpanFinder\SpanFinder.exe'
if (-not (Test-Path -LiteralPath $SpanFinderExe)) {
    Write-Error "Span Finder executable not found at '$SpanFinderExe'. Edit configs/launchers/launch-spanfinder.ps1 (installed at %USERPROFILE%\.config\winslop\launch-spanfinder.ps1) and set `$SpanFinderExe to the actual path."
    exit 1
}
Start-Process -FilePath $SpanFinderExe
