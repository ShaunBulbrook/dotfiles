@echo off

echo Make sure this is running as admin!
set files=config.cson,keymap.cson,snippets.cson,styles.less

for %%f in (%files%) do (
	del %HOMEPATH%\.atom\%%f
	mklink %HOMEPATH%\.atom\%%f %HOMEPATH%\.dotfiles\atom\%%f
)

pause
