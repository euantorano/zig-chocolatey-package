$ErrorActionPreference = 'Stop';

$packageName = 'zig'
$packageVersion = '0.6.0'
$packageZipFileName = "zig-windows-x86_64-$packageVersion"
$packageDownloadUrl = "https://ziglang.org/download/$packageVersion/$packageZipFileName.zip"
$packageChecksum = 'c3b897832523e1026e10b2d8d55d7f895185c0a27a63681f3a23219c3f1c38f4'
$packageZipFileName32Bit = "zig-windows-i386-$packageVersion"
$packageDownloadUrl32Bit = "https://ziglang.org/download/$packageVersion/$packageZipFileName32Bit.zip"
$packageChecksum32Bit = '3b0a02618743e92175990dc6d1a787bb95ff62c4cda016f1c14c7786f575f8ca'
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