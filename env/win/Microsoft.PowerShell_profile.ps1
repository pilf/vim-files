# https://stackoverflow.com/questions/1275090/what-exactly-is-exit-in-powershell 
function __ex{exit}

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineKeyHandler -Chord 'v' -ViMode Command -ScriptBlock {
    # Retrieve current command from PSReadLine buffer
    $currentCommand = ""
    $cursorPos = 0
    $null = [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$currentCommand, [ref]$cursorPos)

    $tempFile = [System.IO.Path]::GetTempFileName()

    # Save current command to the temp file for editing
    Set-Content -Path $tempFile -Value $currentCommand

    # Open Vim in a visible interactive console and capture exit code
    $vimProcess = Start-Process -NoNewWindow -Wait -PassThru -FilePath "cmd.exe" -ArgumentList "/c start /wait nvim $tempFile"

    # Only proceed if Vim exited successfully
    if ($vimProcess.ExitCode -eq 0 -and (Test-Path $tempFile)) {
        $newCommand = Get-Content -Path $tempFile -Raw
        if ($newCommand -match '\S') {  # Ensure it's not empty
            Add-Type -AssemblyName System.Windows.Forms
            [System.Windows.Forms.Clipboard]::SetText($newCommand.TrimEnd())
            # Simulate Vi mode: Clear current line, enter insert mode, and paste
            Start-Sleep -Milliseconds 100 
            [System.Windows.Forms.SendKeys]::SendWait("cc")  # Delete the line and enter insert mode
            Start-Sleep -Milliseconds 100
            [System.Windows.Forms.SendKeys]::SendWait("^v")
            [System.Windows.Forms.SendKeys]::SendWait("{END}")
            [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
        }
    }

    # Clean up temp file
    Remove-Item $tempFile -ErrorAction Ignore
}

$env:Path += ";$HOME\scripts;$HOME\scripts\vf"
Set-Alias vim nvim
Set-Alias :q __ex
Set-Alias c g.ps1
Set-Alias ct go-today.ps1
#Set-Alias -Name gc -Value "g.ps1 -c"
