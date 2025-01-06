# The script-level param block MUST appear as the first line in the script
param (
    [switch]$c,        # Shortcut creation flag with optional path
    [switch]$l,               # List directories sorted by shortname, no argument required
    [switch]$lp,              # List directories sorted by path, no argument required
    [string]$ShortName = $null # The shortname to use for navigation
)

# Path to the .g.places file
$PlacesFile = "$HOME\.g.places"
$SplitChar = '#'

function Show-Help {
    @"
Usage:
    g shortname        - Navigate to the directory associated with 'shortname'
    g -c shortname     - Create a new shortcut for the current directory
    TODO: g -c path shortname - Create a new shortcut with a specific path
    g -l               - List all known locations sorted by shortname
    g -lp              - List all known locations sorted by path
    g -?               - Display this help message
"@
}

function Display-KnownLocations {
    param (
        [bool]$ByPath = $false
    )

    if (-Not (Test-Path $PlacesFile)) {
        Write-Host "No locations have been added yet." -ForegroundColor Yellow
        return
    }

    $Places = Get-Content $PlacesFile | Sort-Object { if ($ByPath) { ($_ -split "$SplitChar")[1] } else { ($_ -split "$SplitChar")[0] } }
    foreach ($Place in $Places) {
        $SplitPlace = $Place -split "$SplitChar"
        $ShortName, $Path = $SplitPlace[0], $SplitPlace[1]
        Write-Host ("{0,-15} {1}" -f $ShortName, $Path)
    }
}

function Add-Shortcut {
    param (
        [string]$Path,
        [string]$ShortName
    )

    if (-Not (Test-Path $PlacesFile)) {
        Write-Host "Places file (${PlacesFile}) not found, creating new one..."
        New-Item -Path $PlacesFile -ItemType File | Out-Null
    }

    # Remove any existing entry for the shortcut
    (Get-Content $PlacesFile) | Where-Object { $_ -notmatch "^${ShortName}${SplitChar}.*$" } | Set-Content $PlacesFile

    # Add the new entry
    Add-Content $PlacesFile "${ShortName}${SplitChar}${Path}"
    Write-Host "Added shortcut '${ShortName}' for path '${Path}'"

}

function Get-ShortcutPath {
    param (
        [string]$ShortName
    )

    if (-Not (Test-Path $PlacesFile)) {
        Write-Host "Error: No locations found. Please create a shortcut first." -ForegroundColor Red
        return $null
    }

    $Entry = Get-Content $PlacesFile | Where-Object { $_ -match "^.*${ShortName}.*${SplitChar}.*$" }

    if ($Entry.Count -eq 1) {
        return ($Entry -split "${SplitChar}")[1]
    } elseif ($Entry.Count -gt 1) {
        $ExactMatch = $Entry | Where-Object { $_ -match "^${ShortName}${SplitChar}.*$" }
        if ($ExactMatch.Count -eq 1) {
            return ($ExactMatch -split "${SplitChar}")[1]
        }
        Write-Host "Multiple matches found for '${ShortName}':" -ForegroundColor Yellow
        foreach ($Match in $Entry) {
            $Parts = ($Match -split "${SplitChar}")
            $ShortName, $Path = $Parts[0], $Parts[1]

            Write-Host ("{0,-15} {1}" -f $ShortName, $Path)
        }
        return $null
    } else {
        Write-Host "Error: Shortcut '${ShortName}' not found." -ForegroundColor Red
        return $null
    }
}

# Main script logic (executed after function definitions)
if ($c) {
    # Handle shortcut creation mode
    if (-not $ShortName) {
        Write-Host "Error: ShortName required" -ForegroundColor Red
        return $null
    }

    $Path = (Get-Location).Path

    Add-Shortcut -Path $Path -ShortName $ShortName
    return
}

if ($l) {
    # Display shortcuts sorted by shortname
    Display-KnownLocations -ByPath:$false
    return
}

if ($lp) {
    # Display shortcuts sorted by path
    Display-KnownLocations -ByPath:$true
    return
}

if ($ShortName) {
    # Navigate to the directory associated with the shortname
    $Path = Get-ShortcutPath -ShortName $ShortName
    if ($Path) {
        Set-Location $Path
    }
    return
}

# If no arguments are given or unrecognized input, show help
Show-Help
