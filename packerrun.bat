powershell -ExecutionPolicy Bypass .\Get-Packer.ps1
packer build -var-file=packer-variables.json -on-error=ask -force packer-vb-iso.json