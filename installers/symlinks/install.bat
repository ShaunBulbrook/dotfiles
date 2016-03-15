@echo off

echo Make sure this is running as admin!
set files=ansible.cfg,bashrc,gitconfig,hgrc,inputrc,jshintrc,minttyrc,profile

for %%f in (%files%) do (
	del %HOMEPATH%\.%%f
	mklink %HOMEPATH%\.%%f %HOMEPATH%\.dotfiles\conf\%%f
)

pause
