$idle = New-Object -ComObject WScript.Shell
Write-Host ''
Write-Host '  Keeping PC from going to sleep.'
Write-host '  Close this window to cancel the effect.'
while (1) {
  $idle.SendKeys('+{F15}')
  Start-Sleep -seconds 30
}