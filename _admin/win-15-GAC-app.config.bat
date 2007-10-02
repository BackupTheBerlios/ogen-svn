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
SET parentdir=%~d0%~p0..
FOR /f "usebackq tokens=1* delims=^|" %%a IN (`ECHO %parentdir%`) DO (
	SET parentdir=%%~fa
)
IF "%parentdir%" == "" GOTO error1

IF NOT EXIST "%parentdir%\bin" MKDIR "%parentdir%\bin"


::--- <OGen.Doc.presentationlayer.console>
SET configtemplate=OGen.Doc.presentationlayer.console

SET configdir=%parentdir%\OGen-Doc\Doc-console
SET configfilename=app
SET configfile=%configdir%\%configfilename%.config
SET templatefile=%parentdir%\OGen-Doc\Doc_templates\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-1.1.exe.config
SET templatefile=%parentdir%\bin\OGen.Doc.templates-1.1\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-2.0.exe.config
SET templatefile=%parentdir%\bin\OGen.Doc.templates-2.0\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%
::--- </OGen.Doc.presentationlayer.console>

::--- <OGen.NTier.presentationlayer.console>
SET configtemplate=OGen.NTier.presentationlayer.console

SET configdir=%parentdir%\OGen-NTier\NTier-console
SET configfilename=app
SET configfile=%configdir%\%configfilename%.config
SET templatefile=%parentdir%\OGen-NTier\NTier_templates\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-1.1.exe.config
SET templatefile=%parentdir%\bin\OGen.NTier.templates-1.1\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-2.0.exe.config
SET templatefile=%parentdir%\bin\OGen.NTier.templates-2.0\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%
::--- </OGen.NTier.presentationlayer.console>

::--- <OGen.NTier.presentationlayer.winforms>
SET configtemplate=OGen.NTier.presentationlayer.winforms

SET configdir=%parentdir%\OGen-NTier\NTier
SET configfilename=app
SET configfile=%configdir%\%configfilename%.config
SET templatefile=%parentdir%\OGen-NTier\NTier_templates\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-1.1.exe.config
SET templatefile=%parentdir%\bin\OGen.NTier.templates-1.1\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%

SET configdir=%parentdir%\bin
SET configfilename=%configtemplate%
SET configfile=%configdir%\%configfilename%-2.0.exe.config
SET templatefile=%parentdir%\bin\OGen.NTier.templates-2.0\templates.config.xml
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-1.config">"%configfile%"
ECHO     ^<add key="Templates" value="%templatefile%" /^>>>"%configfile%"
ECHO     ^<add key="ogenPath" value="%parentdir%\bin" /^>>>"%configfile%"
TYPE "%parentdir%\_admin\distro-templates\%configtemplate%.exe-2.config">>"%configfile%"
ECHO %configfile%
::--- </OGen.NTier.presentationlayer.winforms>


GOTO eof


:error1
	ECHO.
	ECHO.
	ECHO ERROR 1: - can't determine parent dir
::PAUSE
GOTO eof


:eof
SET currentdir=
SET parentdir=
SET configfile=
PAUSE
