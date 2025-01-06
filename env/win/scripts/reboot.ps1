# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch the script with elevated privileges
    $arguments = "-NoProfile -ExecutionPolicy Bypass -Command `"& { $($MyInvocation.MyCommand.Definition) }`""
    Start-Process powershell -ArgumentList $arguments -Verb RunAs
    exit
}

# Reboot the machine
Restart-Computer -Force
