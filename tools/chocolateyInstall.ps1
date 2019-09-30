$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.5.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = 'fbc3dd205e064c263063f69f600bedb18e3d0aa2efa747a63ef6cafb6d73f127'
$packageChecksumType = 'sha256'

$zigRoot = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage -PackageName "$packageName" `
    -Url64bit "$packageDownloadUrl" `
    -Checksum64 "$packageChecksum" `
    -ChecksumType64 "$packageChecksumType" `
    -UnzipLocation "$zigRoot"