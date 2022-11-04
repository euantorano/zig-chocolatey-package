$ErrorActionPreference = 'Stop';

$varsPath = Join-Path -Path $(Split-Path -parent $MyInvocation.MyCommand.Definition) -ChildPath 'vars.ps1'

. "$varsPath"

$zigRoot = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-ChocolateyZipPackage -PackageName "$packageName" `
    -Url64bit "$packageDownloadUrl" `
    -Checksum64 "$packageChecksum" `
    -ChecksumType64 "$packageChecksumType" `
    -UnzipLocation "$zigRoot"