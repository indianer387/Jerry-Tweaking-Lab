winget uninstall "windows web experience pack
REM Disable Widgets button
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarDa /T REG_DWORD /D 0 /F

powershell -Command "Get-AppxPackage -AllUsers *WebExperience* | Remove-AppxPackage -AllUsers"

powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like '*WebExperience*' | Remove-AppxProvisionedPackage -Online"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarDa /t REG_DWORD /d 0 /f

echo Cleaning up any remaining files...

takeown /f "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /r /d y >nul
icacls "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy" /grant administrators:F /t >nul
rd /s /q "%SystemRoot%\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy"

echo successfully uninstalled widgets
pause
