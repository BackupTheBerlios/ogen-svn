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
:: is a doc project, hence:
IF '%8' == 't' GOTO eof

SET fw=
IF '%1' == '/1_1' SET fw=1.1
IF '%1' == '/2_0' SET fw=2.0
IF '%fw%' == '' GOTO error4

IF NOT '%2' == '' GOTO install


SET SetEnvironmentPath=
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" SET SetEnvironmentPath="C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat"
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat" SET SetEnvironmentPath="c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
IF '%SetEnvironmentPath%' == '' GOTO error1
CALL %SetEnvironmentPath% x86


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %1 %%a %%b %%c %%d %%e %%f %%g %%h
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
	ECHO must specify framework version
	PAUSE
GOTO eof


:install
SHIFT
gacutil /u %3-%fw%


:eof
SET SetEnvironmentPath=
