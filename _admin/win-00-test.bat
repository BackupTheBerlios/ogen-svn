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
IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


SET errorFound=
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO (
	SET paramError=
	IF '%%a' == '' SET paramError=%%a#%paramError%
	IF '%%b' == '' SET paramError=%%b#%paramError%
	IF '%%c' == '' SET paramError=%%c#%paramError%
	IF NOT '%%d' == 't' IF NOT '%%d' == 'f' SET paramError=%%d#%paramError%
	IF NOT '%%e' == 't' IF NOT '%%e' == 'f' SET paramError=%%e#%paramError%
	IF NOT '%%f' == 't' IF NOT '%%f' == 'f' SET paramError=%%f#%paramError%
	IF NOT '%%g' == 'GNU_GPL' IF NOT '%%g' == 'GNU_LGPL' IF NOT '%%g' == 'GNU_FDL' SET paramError=%%g#%paramError%
	IF NOT '%%h' == 't' IF NOT '%%h' == 'f' SET paramError=%%h#%paramError%
	IF NOT EXIST "..\%%a" SET paramError="solution does not exist"#%paramError%
	IF NOT EXIST "..\%%a\%%b" SET paramError="project does not exist"#%paramError%

	IF NOT '%paramError%' == '' ECHO %%a, %%b, %%c, %%d, %%e, %%f, %%g, %%h
	IF NOT '%paramError%' == '' ECHO %paramError%
	IF NOT '%paramError%' == '' SET errorFound=1

	SET error=
)
IF '%errorFound%' == '' ECHO no errors!
SET errorFound=
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


:eof
