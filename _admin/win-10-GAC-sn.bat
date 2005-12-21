@ECHO OFF
:: is a doc project, hence:
IF '%8' == 't' GOTO eof
:: not to install on GAC, hence:
::IF '%4' == 'f' GOTO eof
IF NOT '%1' == '' GOTO copysharedkey


CALL "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"

:makekey
	IF EXIST OGen.no-svn.snk GOTO eof_makekey
	sn -k OGen.no-svn.snk
	ATTRIB +r OGen.no-svn.snk
:eof_makekey

:makepublickey
	::IF EXIST OGen-public.no-svn.snk GOTO eof_makepublickey
	IF EXIST OGen-public.no-svn.snk DEL /q /f OGen-public.no-svn.snk
	sn -p OGen.no-svn.snk OGen-public.no-svn.snk
	ATTRIB +r OGen-public.no-svn.snk
:eof_makepublickey

:makesharedkey
	IF EXIST OGen-shared.snk GOTO eof_makesharedkey
	sn -k OGen-shared.snk
	ATTRIB +r OGen-shared.snk
:eof_makesharedkey

FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
PAUSE
GOTO eof


:copysharedkey
	IF NOT EXIST ..\%1\OGen-shared.snk GOTO copysharedkey_copy
		ATTRIB -r -h -s ..\%1\OGen-shared.snk
		DEL /F /Q ..\%1\OGen-shared.snk
	:copysharedkey_copy
	COPY OGen-shared.snk ..\%1\OGen-shared.snk
	ATTRIB +r ..\%1\OGen-shared.snk
:eof_copysharedkey


:eof
