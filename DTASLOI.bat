@echo off
set "PROCESS=Gorilla Tag.exe"
set "FOLDER=C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag\BepInEx\plugins"
set "COMPANY=DamnThatsAShitLoadOfInfo"

:check
tasklist /FI "IMAGENAME eq %PROCESS%" | find /I "%PROCESS%" >nul
if %errorlevel%==0 (
    timeout /t 2 >nul
    goto check
)

powershell -NoProfile -WindowStyle Hidden -Command ^
  "Get-ChildItem -Path '%FOLDER%' -File -Recurse | ForEach-Object { try { $info = (Get-Item $_.FullName).VersionInfo; if($info.CompanyName -eq '%COMPANY%'){ Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue } } catch {} }"
