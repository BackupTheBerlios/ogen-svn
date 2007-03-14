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


if "%currentdir%" == "" goto error1
if "%parentdir%" == "" goto error2
if not exist ..\_release.no-svn mkdir ..\_release.no-svn


::---
set configfile=OGen.Doc.presentationlayer.console.exe
type config-templates\%configfile%-1.config>..\_release.no-svn\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-Doc\Doc_templates\templates.config.xml" /^>>>..\_release.no-svn\%configfile%.config
type config-templates\%configfile%-2.config>>..\_release.no-svn\%configfile%.config
echo %configfile%.config
::---
set configfile=OGen.NTier.presentationlayer.console.exe
type config-templates\%configfile%-1.config>..\_release.no-svn\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\_release.no-svn\%configfile%.config
echo     ^<add key="ogenPath" value="%parentdir%\_release.no-svn" /^>>>..\_release.no-svn\%configfile%.config
type config-templates\%configfile%-2.config>>..\_release.no-svn\%configfile%.config
echo %configfile%.config
::---
set configfile=OGen.NTier.presentationlayer.winforms.exe
type config-templates\%configfile%-1.config>..\_release.no-svn\%configfile%.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\_release.no-svn\%configfile%.config
echo     ^<add key="ogenPath" value="%parentdir%\_release.no-svn" /^>>>..\_release.no-svn\%configfile%.config
type config-templates\%configfile%-2.config>>..\_release.no-svn\%configfile%.config
echo %configfile%.config
::---
goto eof


:error1
	echo can't determine current dir
	pause
goto eof
:error2
	echo can't determine parent dir
	pause
goto eof


:eof
set currentdir=
set parentdir=
set configfile=
pause
