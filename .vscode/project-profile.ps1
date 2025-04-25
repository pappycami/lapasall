function Invoke-LaravelDev {
    param(
        [string]$Command,
        [string]$Arg1,
        [string]$Arg2
    )
    & "$PSScriptRoot\..\laravel_dev.ps1" $Command $Arg1 $Arg2
}

Set-Alias ap Invoke-LaravelDev
Write-Host "✅ Alias 'ap' chargé pour ce projet." -ForegroundColor Green
