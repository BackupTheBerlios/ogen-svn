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
