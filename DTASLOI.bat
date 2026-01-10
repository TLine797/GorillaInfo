@echo off
set "PROCESS=Gorilla Tag.exe"
set "POSSIBLELOC1=C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag\BepInEx\plugins"
set "POSSIBLELOC2=C:\Program Files\Oculus\Software\Software\another-axiom-gorilla-tag\BepInEx\plugins"
set "COMPANY=DangThatsAShitLoadOfInfo"

:check
tasklist /FI "IMAGENAME eq %PROCESS%" | find /I "%PROCESS%" >nul
if %errorlevel%==0 (
    timeout /t 2 >nul
    goto check
)

powershell -NoProfile -WindowStyle Hidden -Command ^
  "Get-ChildItem -Path '%POSSIBLELOC1%' -File -Recurse | ForEach-Object { try { $info = (Get-Item $_.FullName).VersionInfo; if($info.CompanyName -eq '%COMPANY%'){ Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue } } catch {} }"

powershell -NoProfile -WindowStyle Hidden -Command ^
  "Get-ChildItem -Path '%POSSIBLELOC2%' -File -Recurse | ForEach-Object { try { $info = (Get-Item $_.FullName).VersionInfo; if($info.CompanyName -eq '%COMPANY%'){ Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue } } catch {} }"
