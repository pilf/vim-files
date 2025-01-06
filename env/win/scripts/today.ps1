# today.ps1
# Get the home directory
$homeDir = [Environment]::GetFolderPath("UserProfile")

# Get today's date
$todayDate = Get-Date

# Construct the path
$year = $todayDate.ToString("yyyy")
$month = $todayDate.ToString("MM")
$day = $todayDate.ToString("dd")
$todayDir = Join-Path $homeDir "today\$year\$month\$day"

# Create the directory if it doesn't exist
if (!(Test-Path -Path $todayDir)) {
    New-Item -ItemType Directory -Force -Path $todayDir | Out-Null
}

# Output the path to stdout
Write-Output $todayDir