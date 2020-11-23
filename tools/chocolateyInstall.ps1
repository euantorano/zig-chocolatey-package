$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.7.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = '965f56c0a36f9cda2125e3a348bc654f7f155e2804c3667d231775ec228f8553'
$packageZipFileName32Bit = "zig-windows-i386-$packageVersion"
$packageDownloadUrl32Bit = "https://ziglang.org/download/$packageVersion/$packageZipFileName32Bit.zip"
$packageChecksum32Bit = 'b1e520aacbfbd645ff3521b3eb4d44166d9a0288b8725e4b001f8b50a425eb2e'
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