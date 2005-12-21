@ECHO OFF
:: is a doc project, hence:
IF '%8' == 't' GOTO eof
IF NOT '%1' == '' GOTO install


CALL "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
PAUSE
GOTO eof


:install
	IF '%5' == 'f' SET binDir=bin\Release
	IF '%5' == 't' SET binDir=bin
	IF NOT EXIST ..\_release.no-svn MKDIR ..\_release.no-svn

	:: if file has not been compiled, i'll try to install it if available from _release.no-svn dir...
	::IF NOT EXIST ..\%1\%2\%binDir%\%3.dll GOTO tryinstall

	IF EXIST ..\%1\%2\%binDir%\%3.dll COPY ..\%1\%2\%binDir%\%3.dll ..\_release.no-svn
	IF EXIST ..\%1\%2\%binDir%\%3.xml COPY ..\%1\%2\%binDir%\%3.xml ..\_release.no-svn
	IF EXIST ..\%1\%2\%binDir%\%3.xml COPY ..\%1\%2\%binDir%\%3.xml ..\_release.no-svn

	IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3.exe COPY ..\%1\%2\%binDir%\%3.exe ..\_release.no-svn
	IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3.exe.config COPY ..\%1\%2\%binDir%\%3.exe.config ..\_release.no-svn


:tryinstall
	IF '%4' == 'f' GOTO eof
	IF NOT EXIST ..\_release.no-svn\%3.dll GOTO eof
	gacutil /u %3
	gacutil /i ..\_release.no-svn\%3.dll


:eof
SET binDir=