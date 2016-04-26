@echo off
echo Make sure this is running as admin!
setlocal disableDelayedExpansion

set "files="
for %%F in (%HOMEPATH%\.dotfiles\conf\*) do call set files=%%files%%,%%~nF

for %%f in (%files%) do (
	IF EXIST %HOMEPATH%\.%%f del /F %HOMEPATH%\.%%f
	mklink %HOMEPATH%\.%%f %HOMEPATH%\.dotfiles\conf\%%f
)

pause
