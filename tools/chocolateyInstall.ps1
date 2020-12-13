$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.7.1'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = '4818a8a65b4672bc52c0ae7f14d014e0eb8caf10f12c0745176820384cea296a'
$packageZipFileName32Bit = "zig-windows-i386-$packageVersion"
$packageDownloadUrl32Bit = "https://ziglang.org/download/$packageVersion/$packageZipFileName32Bit.zip"
$packageChecksum32Bit = 'a1b9a7421e13153e07fd2e2c93ff29aad64d83105b8fcdafa633dbe689caf1c0'
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