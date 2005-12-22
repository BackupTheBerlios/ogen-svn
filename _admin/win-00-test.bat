@ECHO OFF
IF NOT '%1' == '' GOTO test


::CALL "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
SET errorFound=
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
IF '%errorFound%' == '' ECHO no errors!
SET errorFound=
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
