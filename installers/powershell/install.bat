@echo off
echo Make sure this is running as admin!

mkdir %USERPROFILE%"\Documents\WindowsPowerShell"
mklink %USERPROFILE%"\Documents\WindowsPowerShell\profile.ps1" %USERPROFILE%"\.dotfiles\installers\powershell\profile.ps1

pause