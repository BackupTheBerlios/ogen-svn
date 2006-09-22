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
:: is not a Release, hence:
IF '%9' == 'f' GOTO eof
IF NOT '%1' == '' GOTO install


SET SetEnvironmentPath=
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat" SET SetEnvironmentPath="c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" SET SetEnvironmentPath="C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" x86
IF '%SetEnvironmentPath%' == '' GOTO error1
CALL %SetEnvironmentPath%


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h %%i
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


:install
	IF '%5' == 'f' SET binDir=bin\Release
	IF '%5' == 't' SET binDir=bin
	IF NOT EXIST ..\_release.no-svn MKDIR ..\_release.no-svn

	:: if file has not been compiled, i'll try to install it if available from _release.no-svn dir...
	::IF NOT EXIST ..\%1\%2\%binDir%\%3.dll GOTO tryinstall

	IF EXIST ..\%1\%2\%binDir%\%3.dll COPY ..\%1\%2\%binDir%\%3.dll ..\_release.no-svn
	::IF EXIST ..\%1\%2\%binDir%\%3.xml COPY ..\%1\%2\%binDir%\%3.xml ..\_release.no-svn

	IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3.exe COPY ..\%1\%2\%binDir%\%3.exe ..\_release.no-svn
	IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3.exe.config IF NOT EXIST ..\_release.no-svn\%3.exe.config COPY ..\%1\%2\%binDir%\%3.exe.config ..\_release.no-svn


:tryinstall
	IF '%4' == 'f' GOTO eof
	IF NOT EXIST ..\_release.no-svn\%3.dll GOTO eof
	gacutil /u %3
	gacutil /i ..\_release.no-svn\%3.dll


:eof
SET binDir=
SET SetEnvironmentPath=
