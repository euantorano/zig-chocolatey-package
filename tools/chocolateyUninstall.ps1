$ErrorActionPreference = 'Stop';

Get-ToolsLocation
$tools = $env:ChocolateyToolsLocation

$zigRoot = Join-Path "$tools" 'zig'

# The below function was borrowed from the `php` package
if (!(Test-Path function:\Uninstall-ChocolateyPath)) {
    function Uninstall-ChocolateyPath {
        param(
            [string]$pathToRemove,
            [System.EnvironmentVariableTarget] $pathType = [System.EnvironmentVariableTarget]::User
        )

        Write-Debug "Running 'Uninstall-ChocolateyPath' with pathToRemove: `'$pathToRemove`'"

        # get the PATH variable
        Update-SessionEnvironment
        $envPath = $env:PATH
        if ($envPath.ToLower().Contains($pathToRemove.ToLower())) {
            Write-Host "The PATH environment variable already contains the directory '$pathToRemove'. Removing..."
            $actualPath = Get-EnvironmentVariable -Name 'Path' -Scope $pathType -PreserveVariables

            $newPath = $actualPath -replace [regex]::Escape($pathToRemove + ';'), '' -replace ';;', ';'

            if (($pathType -eq [System.EnvironmentVariableTarget]::Machine) -and !(Test-ProcessAdminRights)) {
                Write-Warning "Removing path from machine environment variable is not supported when not running as an elevated user!"
            }
            else {
                Set-EnvironmentVariable -Name 'Path' -Value $newPath -Scope $pathType
            }

            $env:PATH = $newPath
        }
    }
}

Uninstall-ChocolateyPath "$zigRoot" 'Machine'

if (Test-Path "$zigRoot") {
    Remove-Item "$zigRoot" -Recurse
}