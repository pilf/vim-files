# nowfile.ps1
param(
    [string]$Prefix = "scratch"  # Default prefix is "scratch"
)

# Call "today.ps1" to get today's directory
$todayDir = & today.ps1

# Get the current timestamp in the desired format
$timestamp = (Get-Date).ToString("yyyyMMddHHmmss")

# Construct the filename
$fileName = "$Prefix-$timestamp"
$filePath = Join-Path $todayDir $fileName

# Create (or touch) the file
if (!(Test-Path -Path $filePath)) {
    New-Item -ItemType File -Path $filePath | Out-Null
}

# Output the created file path to stdout
Write-Output $filePath
