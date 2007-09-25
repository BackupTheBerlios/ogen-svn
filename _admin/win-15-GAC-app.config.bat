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
set currentdir=
set parentdir=


for /f "usebackq tokens=1* delims=^|" %%a in (`cd`) do (
	set currentdir=%%~fa
)
set parentdir=%currentdir%\..
for /f "usebackq tokens=1* delims=^|" %%a in (`echo %parentdir%`) do (
	set parentdir=%%~fa
)


IF "%currentdir%" == "" GOTO error1
IF "%parentdir%" == "" GOTO error2
IF NOT "%currentdir%\" == "%~d0%~p0" GOTO error4

if not exist ..\bin mkdir ..\bin


::---
set configfilename=OGen.Doc.presentationlayer.console
set configfile=%configfilename%-1.1.exe
type config-templates\%configfilename%.exe-1.config>..\bin\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-Doc\Doc_templates\templates.config.xml" /^>>>..\bin\%configfile%.config
type config-templates\%configfilename%.exe-2.config>>..\bin\%configfile%.config
COPY ..\bin\%configfile%.config ..\bin\%configfilename%-2.0.exe.config
COPY ..\bin\%configfile%.config ..\OGen-Doc\Doc-console\app.config
echo %configfile%.config
::---
set configfilename=OGen.NTier.presentationlayer.console
set configfile=%configfilename%-1.1.exe
type config-templates\%configfilename%.exe-1.config>..\bin\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\bin\%configfile%.config
echo     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>..\bin\%configfile%.config
type config-templates\%configfilename%.exe-2.config>>..\bin\%configfile%.config
COPY ..\bin\%configfile%.config ..\bin\%configfilename%-2.0.exe.config
COPY ..\bin\%configfile%.config ..\OGen-NTier\NTier-console\app.config
echo %configfile%.config
::---
set configfilename=OGen.NTier.presentationlayer.winforms
set configfile=%configfilename%-1.1.exe
type config-templates\%configfilename%.exe-1.config>..\bin\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\bin\%configfile%.config
echo     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>..\bin\%configfile%.config
type config-templates\%configfilename%.exe-2.config>>..\bin\%configfile%.config
COPY ..\bin\%configfile%.config ..\bin\%configfilename%-2.0.exe.config
COPY ..\bin\%configfile%.config ..\OGen-NTier\NTier\app.config
echo %configfile%.config
::---
goto eof


:error1
	ECHO.
	ECHO.
	ECHO ERROR 1: - can't determine current dir
::PAUSE
GOTO eof
:error2
	ECHO.
	ECHO.
	ECHO ERROR 2: - can't determine parent dir
::PAUSE
GOTO eof
:error3
	ECHO.
	ECHO.
	ECHO ERROR 3: - %~n0%~x0 must be called from it's own directory: %~f0
::PAUSE
GOTO eof
:error4
	ECHO.
	ECHO.
	ECHO ERROR 4: - %~n0%~x0 must be called from it's own directory: %~f0
::PAUSE
GOTO eof


:eof
set currentdir=
set parentdir=
set configfile=
pause
