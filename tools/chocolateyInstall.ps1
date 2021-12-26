$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.9.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = '084ea2646850aaf068234b0f1a92b914ed629be47075e835f8a67d55c21d880e'
$packageZipFileName32Bit = "zig-windows-i386-$packageVersion"
$packageDownloadUrl32Bit = "https://ziglang.org/download/$packageVersion/$packageZipFileName32Bit.zip"
$packageChecksum32Bit = 'bb839434afc75092015cf4c33319d31463c18512bc01dd719aedf5dcbc368466'
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