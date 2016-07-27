@echo off
echo Make sure this is running as admin!
setlocal disableDelayedExpansion

set "files="
for %%F in (%USERPROFILE%\.dotfiles\conf\*) do call set files=%%files%%,%%~nF

for %%f in (%files%) do (
	IF EXIST %USERPROFILE%\.%%f del /F %USERPROFILE%\.%%f
	mklink %USERPROFILE%\.%%f %USERPROFILE%\.dotfiles\conf\%%f
)

pause
