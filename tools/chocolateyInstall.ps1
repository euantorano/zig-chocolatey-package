$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.10.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = 'a66e2ff555c6e48781de1bcb0662ef28ee4b88af3af2a577f7b1950e430897ee'
$packageChecksumType = 'sha256'

$zigRoot = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage -PackageName "$packageName" `
    -Url64bit "$packageDownloadUrl" `
    -Checksum64 "$packageChecksum" `
    -ChecksumType64 "$packageChecksumType" `
    -UnzipLocation "$zigRoot"