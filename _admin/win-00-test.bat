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
IF NOT '%1' == '' GOTO test


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


SET errorFound=
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
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


:test
	SET paramError=
	IF '%1' == '' SET paramError=%1#%paramError%
	IF '%2' == '' SET paramError=%2#%paramError%
	IF '%3' == '' SET paramError=%3#%paramError%
	IF NOT '%4' == 't' IF NOT '%4' == 'f' SET paramError=%4#%paramError%
	IF NOT '%5' == 't' IF NOT '%5' == 'f' SET paramError=%5#%paramError%
	IF NOT '%6' == 't' IF NOT '%6' == 'f' SET paramError=%6#%paramError%
	IF NOT '%7' == 'GNU_GPL' IF NOT '%7' == 'GNU_LGPL' IF NOT '%7' == 'GNU_FDL' SET paramError=%7#%paramError%
	IF NOT '%8' == 't' IF NOT '%8' == 'f' SET paramError=%8#%paramError%
	IF NOT EXIST "..\%1" SET paramError="solution does not exist"#%paramError%
	IF NOT EXIST "..\%1\%2" SET paramError="project does not exist"#%paramError%

	IF NOT '%paramError%' == '' ECHO %1, %2, %3, %4, %5, %6, %7, %8
	IF NOT '%paramError%' == '' ECHO %paramError%
	IF NOT '%paramError%' == '' SET errorFound=1

	SET error=
:eof
