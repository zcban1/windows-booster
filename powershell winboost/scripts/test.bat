@echo off
echo Eseguo PowerShell con privilegi amministrativi...
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"C:\Users\io\Desktop\New folder\big\opEthernet.ps1\"' -Verb RunAs"