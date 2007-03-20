::
:: OGen
:: Copyright (c) 2002 Francisco Monteiro
:: 
:: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
:: 
:: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
:: 
:: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
:: 
@ECHO OFF
SET fw=
IF '%1' == '/1_1' SET fw=1.1
IF '%1' == '/2_0' SET fw=2.0
IF '%fw%' == '' GOTO error6

IF '%2' == '/install' GOTO install
IF '%2' == '/check' GOTO check
IF NOT '%2' == '' GOTO error5


SET SetEnvironmentPath=
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" SET SetEnvironmentPath="C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat"
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat" SET SetEnvironmentPath="c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
IF '%SetEnvironmentPath%' == '' GOTO error1
CALL %SetEnvironmentPath% x86


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


SET hasErrors=
FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (OGen-projects.txt) DO (
	CALL %0 %1 /check %%a %%b %%c %%d %%e %%f %%g %%h %%i
)
IF NOT "%hasErrors%" == "" GOTO error4


FOR /F "tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (OGen-projects.txt) DO (
	CALL %0 %1 /install %%a %%b %%c %%d %%e %%f %%g %%h %%i
)
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
:error4
	ECHO.
	ECHO.
	ECHO Can't find files:
	ECHO %hasErrors%
	SET hasErrors=
	PAUSE
GOTO eof
:error5
	ECHO.
	ECHO.
	ECHO invalid arguments: %2
	PAUSE
GOTO eof
:error6
	ECHO.
	ECHO.
	ECHO must specify framework version
	PAUSE
GOTO eof


:check
	SHIFT
	SHIFT

	:: is not a Release, hence:
	IF '%9' == 'f' GOTO eof

	IF '%5' == 'f' SET binDir=bin\Release
	IF '%5' == 't' SET binDir=bin

	IF '%6' == 'f' IF NOT EXIST ..\%1\%2\%binDir%\%3-%fw%.dll SET hasErrors=%3-%fw%.dll;%hasErrors%
	IF '%6' == 't' IF NOT EXIST ..\%1\%2\%binDir%\%3-%fw%.exe SET hasErrors=%3-%fw%.exe;%hasErrors%
GOTO eof


:install
	SHIFT
	SHIFT

	:: is not a Release, hence:
	IF '%9' == 'f' GOTO eof

	IF '%5' == 'f' SET binDir=bin\Release
	IF '%5' == 't' SET binDir=bin
	IF NOT EXIST ..\_release.no-svn MKDIR ..\_release.no-svn

	:: if file has not been compiled, i'll try to install it if available from _release.no-svn dir...
	::IF NOT EXIST ..\%1\%2\%binDir%\%3-%fw%.dll GOTO tryinstall

	IF '%6' == 'f' IF EXIST ..\%1\%2\%binDir%\%3-%fw%.dll COPY ..\%1\%2\%binDir%\%3-%fw%.dll ..\_release.no-svn
	::IF EXIST ..\%1\%2\%binDir%\%3.xml COPY ..\%1\%2\%binDir%\%3-%fw%.xml ..\_release.no-svn

	IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3-%fw%.exe COPY ..\%1\%2\%binDir%\%3-%fw%.exe ..\_release.no-svn
	::IF '%6' == 't' IF EXIST ..\%1\%2\%binDir%\%3-%fw%.exe.config IF NOT EXIST ..\_release.no-svn\%3-%fw%.exe.config COPY ..\%1\%2\%binDir%\%3-%fw%.exe.config ..\_release.no-svn

:tryinstall
	IF '%4' == 'f' GOTO eof
	IF NOT EXIST ..\_release.no-svn\%3-%fw%.dll GOTO eof
	::gacutil /u %3
	gacutil /i ..\_release.no-svn\%3-%fw%.dll
GOTO eof


:eof
SET binDir=
SET SetEnvironmentPath=
::SET hasErrors=