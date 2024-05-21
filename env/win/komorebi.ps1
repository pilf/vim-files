$job = Start-Job -ScriptBlock {
    Write-Output "Starting komorebi..."
    komorebi.exe
}

Start-Sleep -Seconds 2
#
# Ensure there are 10 workspaces on each monitor
komorebic.exe ensure-workspaces 0 10
komorebic.exe ensure-workspaces 1 10

# Enable hot reloading of changes to this file
komorebic.exe watch-configuration enable
# Configure the invisible border dimensions
#Run, komorebic.exe invisible-borders 7 0 14 7, , Hide
komorebic.exe invisible-borders 0 0 0 0
komorebic.exe invisible-borders 0 1 0 0
komorebic.exe invisible-borders 0 2 0 0
komorebic.exe invisible-borders 0 3 0 0
komorebic.exe invisible-borders 0 4 0 0
komorebic.exe invisible-borders 0 5 0 0
komorebic.exe invisible-borders 0 6 0 0
komorebic.exe invisible-borders 0 7 0 0
komorebic.exe invisible-borders 0 8 0 0
komorebic.exe invisible-borders 0 9 0 0
komorebic.exe invisible-borders 1 0 0 0
komorebic.exe invisible-borders 1 1 0 0
komorebic.exe invisible-borders 1 2 0 0
komorebic.exe invisible-borders 1 3 0 0
komorebic.exe invisible-borders 1 4 0 0
komorebic.exe invisible-borders 1 5 0 0
komorebic.exe invisible-borders 1 6 0 0
komorebic.exe invisible-borders 1 7 0 0
komorebic.exe invisible-borders 1 8 0 0
komorebic.exe invisible-borders 1 9 0 0

komorebic.exe container-padding 0 0 0
komorebic.exe container-padding 0 1 0
komorebic.exe container-padding 0 2 0
komorebic.exe container-padding 0 3 0
komorebic.exe container-padding 0 4 0
komorebic.exe container-padding 0 5 0
komorebic.exe container-padding 0 6 0
komorebic.exe container-padding 0 7 0
komorebic.exe container-padding 0 8 0
komorebic.exe container-padding 0 9 0
komorebic.exe container-padding 1 0 0
komorebic.exe container-padding 1 1 0
komorebic.exe container-padding 1 2 0
komorebic.exe container-padding 1 3 0
komorebic.exe container-padding 1 4 0
komorebic.exe container-padding 1 5 0
komorebic.exe container-padding 1 6 0
komorebic.exe container-padding 1 7 0
komorebic.exe container-padding 1 8 0
komorebic.exe container-padding 1 9 0

# Enable focus follows mouse
komorebic.exe focus-follows-mouse enable


# Give the workspaces some optional names
#Run, komorebic.exe workspace-name 0 0 bsp, , Hide
#Run, komorebic.exe workspace-name 0 1 columns, , Hide
#Run, komorebic.exe workspace-name 0 2 thicc, , Hide
#Run, komorebic.exe workspace-name 0 3 matrix, , Hide
#Run, komorebic.exe workspace-name 0 4 floaty, , Hide

# Set the padding of the different workspaces
komorebic.exe workspace-padding 0 0 10
komorebic.exe workspace-padding 0 0 5
komorebic.exe workspace-padding 0 2 0
komorebic.exe workspace-padding 0 3 0
komorebic.exe workspace-padding 0 4 0
komorebic.exe workspace-padding 0 5 10
komorebic.exe workspace-padding 0 5 5
komorebic.exe workspace-padding 0 7 0
komorebic.exe workspace-padding 0 8 0
komorebic.exe workspace-padding 0 9 0
komorebic.exe workspace-padding 1 0 10
komorebic.exe workspace-padding 1 1 0
komorebic.exe workspace-padding 1 2 0
komorebic.exe workspace-padding 1 3 0
komorebic.exe workspace-padding 1 4 0
komorebic.exe workspace-padding 1 5 10
komorebic.exe workspace-padding 1 6 0
komorebic.exe workspace-padding 1 7 0
komorebic.exe workspace-padding 1 8 0
komorebic.exe workspace-padding 1 9 0

# Set the layouts of different workspaces
komorebic.exe workspace-layout 0 1 columns

# Set the floaty layout to not tile any windows
komorebic.exe workspace-tiling 0 4 disable

# Always show chat apps on the second workspace
komorebic.exe workspace-rule exe slack.exe 0 1
komorebic.exe workspace-rule exe Discord.exe 0 1

# Always float IntelliJ popups, matching on class
komorebic.exe float-rule class SunAwtDialog
# Always float Control Panel, matching on title
komorebic.exe float-rule title "Control Panel"
# Always float Task Manager, matching on class
komorebic.exe float-rule class TaskManagerWindow
# Always float Wally, matching on executable name
komorebic.exe float-rule exe Wally.exe
komorebic.exe float-rule exe wincompose.exe
# Always float Calculator app, matching on window title
komorebic.exe float-rule title Calculator
komorebic.exe float-rule exe 1Password.exe

# Always manage forcibly these applications that don't automatically get picked up by komorebi
komorebic.exe manage-rule exe TIM.exe

# Identify applications that close to the tray
komorebic.exe identify-tray-application exe Discord.exe

# Identify applications that have overflowing borders
komorebic.exe identify-border-overflow exe Discord.exe


# App specific overrides

# Google Chrome
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "chrome.exe"

# Targets JetBrains IDE popups and floating windows
komorebic.exe float-rule class "SunAwtDialog"

# Microsoft Outlook
komorebic.exe identify-border-overflow-application exe "OUTLOOK.EXE"
komorebic.exe identify-layered-application exe "OUTLOOK.EXE"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "OUTLOOK.EXE"

# Microsoft Teams
# Target Teams pop-up notification windows
komorebic.exe float-rule title "Microsoft Teams Notification"

# Mozilla Firefox
komorebic.exe identify-object-name-change-application exe "firefox.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "firefox.exe"

# Spotify
komorebic.exe identify-border-overflow-application exe "Spotify.exe"
# If you have disabled minimize/close to tray for this application, you can delete/comment out the next line
komorebic.exe identify-tray-application exe "Spotify.exe"

# Windows Explorer
# Targets copy/move operation windows
komorebic.exe float-rule class "OperationStatusWindow"
komorebic.exe float-rule title "Control Panel"

# Zoom
komorebic.exe float-rule exe "Zoom.exe"

Write-Output "Returning to komorebi..."
Receive-Job -Wait -Job $job
#Wait-Job -Job $job

