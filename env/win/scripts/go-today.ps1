# go-today.ps1

# Call "today.ps1" to get today's directory
$todayDir = & today.ps1

# Change directory to the path
Set-Location -Path $todayDir
