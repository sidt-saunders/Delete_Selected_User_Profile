# Prompt for device name
$deviceName = Read-Host -Prompt "Enter the name of the device on the network"

# Ping device to check if it's online
$pingResult = Test-Connection -ComputerName $deviceName -Count 1 -Quiet

if ($pingResult) {
Write-Host "Device is online."

# Prompt for username
$username = Read-Host -Prompt "Enter the username"

# Check if user folder exists
$folderPath = "\\$deviceName\c$\Users\$username"
if (Test-Path $folderPath) {
Write-Host "User folder exists. Folder size is being calculated. Please Wait..."

# Show folder size
$folderSize = Get-ChildItem -Path $folderPath -Recurse | Measure-Object -Property Length -Sum
$sizeInMB = [math]::Round($folderSize.Sum / 1MB, 2)
Write-Host "Size of folder: $sizeInMB MB"

# Prompt to erase folder recursively
$erasePrompt = Read-Host -Prompt "Do you want to recursively erase the folder? (Y/N)"
if ($erasePrompt -eq "Y") {
Remove-Item -Path $folderPath -Recurse -Force
Write-Host "Folder has been erased."
}
else {
Write-Host "Folder will not be erased."
}
}
else {
Write-Host "User folder does not exist."
}
}
else {
Write-Host "Device is offline."
}