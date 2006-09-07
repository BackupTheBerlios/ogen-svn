::
:: OGen
:: Copyright (C) 2002 Francisco Monteiro
::
:: This file is part of OGen.
::
:: OGen is free software; you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation; either version 2 of the License, or
:: (at your option) any later version.
::
:: OGen is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with OGen; if not, write to the
::
:: 	Free Software Foundation, Inc.,
:: 	59 Temple Place, Suite 330,
:: 	Boston, MA 02111-1307 USA 
::
:: 							- or -
::
:: 	http://www.fsf.org/licensing/licenses/gpl.txt
:: 
@ECHO OFF
:: is a doc project, hence:
IF '%8' == 't' GOTO eof
:: not to install on GAC, hence:
::IF '%4' == 'f' GOTO eof
IF NOT '%1' == '' GOTO copysharedkey


SET SetEnvironmentPath=
IF EXIST "C:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat" SET SetEnvironmentPath="c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
IF EXIST "C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" SET SetEnvironmentPath="C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" x86
IF '%SetEnvironmentPath%' == '' GOTO error1
CALL %SetEnvironmentPath%


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


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


:error1
	ECHO.
	ECHO.
	ECHO Can't set environment for Microsoft Visual Studio .NET tools
	PAUSE
GOTO eof
:error2
	ECHO.
	ECHO.
	ECHO Can't find file 'OGen-solutions.txt'
	PAUSE
GOTO eof
:error3
	ECHO.
	ECHO.
	ECHO Can't find file 'OGen-projects.txt'
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
SET SetEnvironmentPath=
