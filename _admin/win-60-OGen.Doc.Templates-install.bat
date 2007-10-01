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
IF NOT '%2' == '' GOTO install


IF NOT EXIST "%thisdir%OGen-solutions.txt" GOTO error4
IF NOT EXIST "%thisdir%OGen-projects.txt" GOTO error5


SET thisdir=%~d0%~p0


SET fw=
IF '%1' == '/1_1' SET fw=1.1
IF '%1' == '/2_0' SET fw=2.0
IF '%fw%' == '' GOTO error3


SET SetEnvironmentPath=
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat" SET SetEnvironmentPath="C:\Program Files\Microsoft Visual Studio 8\VC\vcvarsall.bat"
IF '%SetEnvironmentPath%' == '' IF EXIST "C:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat" SET SetEnvironmentPath="c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
IF '%SetEnvironmentPath%' == '' GOTO error1
::CALL %SetEnvironmentPath% x86
  CALL %SetEnvironmentPath% %PROCESSOR_ARCHITECTURE%


SET token=
FOR /F "usebackq tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (`sn -t "%thisdir%OGen-public.snk"^|find "Public key token is "`) DO (
	SET token=%%e
)
IF '%token%' == '' GOTO error2


IF NOT EXIST "%thisdir%..\bin" MKDIR "%thisdir%..\bin"
IF NOT EXIST "%thisdir%..\bin\OGen.Doc.Templates-%fw%" MKDIR "%thisdir%..\bin\OGen.Doc.Templates-%fw%"
IF NOT EXIST "%thisdir%..\bin\OGen.Doc.Templates-%fw%\bin" MKDIR "%thisdir%..\bin\OGen.Doc.Templates-%fw%\bin"

TYPE "%thisdir%config-templates\OGen.Doc.templates-1.Web.config">"%thisdir%..\bin\OGen.Doc.Templates-%fw%\Web.config"
FOR /F "usebackq tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO (
	CALL %0 %1 %%a %%b %%c %%d %%e %%f %%g %%h %%i
)
TYPE "%thisdir%config-templates\OGen.Doc.templates-2.Web.config">>"%thisdir%..\bin\OGen.Doc.Templates-%fw%\Web.config"
FOR /F "usebackq tokens=1,2,3,4,5,6,7,8,9 delims=, " %%a IN (`dir /a-d /one /b "%thisdir%..\OGen-Doc\Doc_templates\*.*"`) DO (
	IF NOT '%%a' == 'AssemblyInfo.cs' IF NOT '%%a' == 'Doc_templates-7.1.csproj' IF NOT '%%a' == 'Doc_templates-7.1.csproj.user' IF NOT '%%a' == 'Doc_templates-8.csproj' IF NOT '%%a' == 'Doc_templates-8.csproj.user' IF NOT '%%a' == 'Web.config' (
		COPY "%thisdir%..\OGen-Doc\Doc_templates\%%a" "%thisdir%..\bin\OGen.Doc.Templates-%fw%"
	)
)
PAUSE


GOTO eof


:error1
	ECHO.
	ECHO.
	ECHO ERROR 1: - Can't set environment for Microsoft Visual Studio .NET tools
	PAUSE
GOTO eof
:error2
	ECHO.
	ECHO.
	ECHO ERROR 2: - Can't determine token
	PAUSE
GOTO eof
:error3
	ECHO.
	ECHO.
	ECHO ERROR 3: - must specify framework version
	PAUSE
GOTO eof
:error4
	ECHO.
	ECHO.
	ECHO ERROR 4: - Can't find file 'OGen-solutions.txt'
	PAUSE
GOTO eof
:error5
	ECHO.
	ECHO.
	ECHO ERROR 5: - Can't find file 'OGen-projects.txt'
	PAUSE
GOTO eof


:install
	SHIFT

	IF NOT '%1' == 'OGen' IF NOT '%1' == 'OGen-Doc' GOTO eof

	IF '%5' == 'f' SET binDir=bin\Release
	IF '%5' == 't' SET binDir=bin

	:: is web app
	IF '%5' == 't' (
		COPY "%thisdir%..\%1\%2\%binDir%\%3-%fw%.dll" "%thisdir%..\bin\OGen.Doc.Templates-%fw%\bin"
	) ELSE (
		:: is not a Release, hence:
		IF '%9' == 'f' GOTO eof

		:: not on GAC, hence:
		IF '%4' == 'f' GOTO eof

		ECHO 				^<add assembly="%3-%fw%, Version=0.1.1000.20000, Culture=neutral, PublicKeyToken=%token%" /^>>>"%thisdir%..\bin\OGen.Doc.Templates-%fw%\Web.config"
	)
GOTO eof


:eof
::SET thisdir=
::SET SetEnvironmentPath=
::SET token=
::SET fw=