Get-Process | Where-Object { $_.Description -match 'IIS Worker Process' } | Stop-Process -Force
