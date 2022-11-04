$ErrorActionPreference = 'Stop'

. ./tools/vars.ps1

Write-Host "Checking for versions newer than $packageVersion"

$packageversionNumber = [Version] $packageVersion

$releases = Invoke-WebRequest -Uri "https://ziglang.org/download/index.json"
$releases = ConvertFrom-Json $releases

$releases.PSObject.Properties | ForEach-Object {
    $versionName = $_.Name

    If ("master" -eq "$versionName") {
        Return
    }

    $versionNumber = [Version] $versionName

    If ($versionNumber -le $packageversionNumber) {
        Return
    }

    Write-Host "Found newer version: $versionName"

    $windowsX64Checksum = $_.Value.'x86_64-windows'.shasum
    $windowsX86Checksum = $_.Value.'i386-windows'.shasum
    $windowsAarch64Checksum = $_.Value.'aarch64-windows'.shasum

    $varsContent = @"
`$packageName = 'zig'
`$packageVersion = '$versionName'
`$packageZipFileName = "zig-windows-x86_64-$versionName"
`$packageDownloadUrl = "https://ziglang.org/download/$versionName/`$packageZipFileName.zip"
`$packageChecksum = '$windowsX64Checksum'
`$packageZipFileName32Bit = "zig-windows-i386-$versionName"
`$packageDownloadUrl32Bit = "https://ziglang.org/download/$versionName/`$packageZipFileName32Bit.zip"
`$packageChecksum32Bit = '$windowsX86Checksum'
`$packageZipFileNameAarch64 = "zig-windows-aarch64-$versionName"
`$packageDownloadUrlAarch64 = "https://ziglang.org/download/$versionName/`$packageZipFileNameAarch64.zip"
`$packageChecksumAarch64 = '$windowsAarch64Checksum'
`$packageChecksumType = 'sha256'
"@

    Set-Content -Path './tools/vars.ps1' -Value "$varsContent" -Encoding 'utf8NoBOM'

    Exit 0
}

Write-Host "No newer versions found"

Exit 1