$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.3.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = 'bb568c03950958f8bb3472139c3ab5ed74547c8c694ab50f404c202faf51baf4'
$packageChecksumType = 'sha256'

$zigRoot = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage -PackageName "$packageName" `
    -Url64bit "$packageDownloadUrl" `
    -Checksum64 "$packageChecksum" `
    -ChecksumType64 "$packageChecksumType" `
    -UnzipLocation "$zigRoot"