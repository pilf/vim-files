# go-today.ps1

# Call "today.ps1" to get today's directory
$todayDir = & .\today.ps1

# Change directory to the path
Set-Location -Path $todayDir

# Output the directory path for confirmation
Write-Output "Changed directory to: $todayDir"