$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.9.1'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = '443da53387d6ae8ba6bac4b3b90e9fef4ecbe545e1c5fa3a89485c36f5c0e3a2'
$packageZipFileName32Bit = "zig-windows-i386-$packageVersion"
$packageDownloadUrl32Bit = "https://ziglang.org/download/$packageVersion/$packageZipFileName32Bit.zip"
$packageChecksum32Bit = '443da53387d6ae8ba6bac4b3b90e9fef4ecbe545e1c5fa3a89485c36f5c0e3a2'
$packageChecksumType = 'sha256'

$zigRoot = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage -PackageName "$packageName" `
    -Url "$packageDownloadUrl32Bit" `
    -Url64bit "$packageDownloadUrl" `
    -Checksum "$packageChecksum32Bit" `
    -ChecksumType "$packageChecksumType" `
    -Checksum64 "$packageChecksum" `
    -ChecksumType64 "$packageChecksumType" `
    -UnzipLocation "$zigRoot"