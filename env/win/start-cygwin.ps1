# Get the current directory in PowerShell
$currentDir = Get-Location

# Convert the PowerShell path to a Cygwin path
# Remove the colon and replace backslashes with forward slashes
$cygwinPath = $currentDir.Path -replace '^([a-zA-Z]):', '/cygdrive/$1' -replace '\\', '/'

# Launch Cygwin starting in the converted path
& cygwin -c "cd $cygwinPath; exec bash"

