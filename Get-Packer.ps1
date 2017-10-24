Add-Type -AssemblyName System.IO.Compression.FileSystem

$rootpath = "https://releases.hashicorp.com"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$versions = Invoke-WebRequest -Method GET $rootpath/packer
$latestversion = New-Object Version ($versions.Links[1].innerText -replace "packer_","")
$installedversion = New-Object Version ((.\packer version) -replace "Packer v","")
if ($installedversion -ge $latestversion) {return}
$oses = Invoke-WebRequest -Method GET ($rootpath + $versions.Links[1].href)
Invoke-WebRequest ($rootpath + ($oses.Links | Where-Object {$_.href -match "windows_$env:PROCESSOR_ARCHITECTURE"}).href) -OutFile .\packer.zip
$zip = (Get-Item -Path ".\packer.zip").FullName
Remove-Item .\packer.exe -Force
[System.IO.Compression.ZipFile]::ExtractToDirectory($zip, (Split-Path $zip))
Remove-Item $zip -Force