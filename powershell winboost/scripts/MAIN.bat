@echo off
echo Eseguo PowerShell con privilegi amministrativi...installaapp
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"D:\winclean+boost\scripts\Main.ps1\"' -Verb RunAs"