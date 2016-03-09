@echo off

echo Make sure this is running as admin!
set files=bashrc,ansible.cfg,gitconfig,profile,inputrc,jshintrc,minttyrc

for %%f in (%files%) do (
	del %HOMEPATH%\.%%f
	mklink %HOMEPATH%\.%%f %HOMEPATH%\.dotfiles\conf\%%f
)

pause
