@ECHO OFF
IF NOT '%1' == '' GOTO test


ECHO about to delete binaries and objects for present solution
ECHO are you sure?
PAUSE


::CALL "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.txt DEL /q ..\%%a\LICENSE.txt
::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO FOR %%b IN (COPYING, COPYING.DOC, COPYING.LIB, LICENSE.FDL.txt, LICENSE.GPL.txt, LICENSE.LGPL.txt) DO IF EXIST ..\%%a\%%b DEL /q ..\%%a\%%b


::---\ ToDos: here!
::	CD "..\OGen-NTier-CaseStudy"
::	CALL ..\OGen-NTier-CaseStudy\CLEAN_bin.bat /silent
::	CALL ..\OGen-NTier-CaseStudy\CLEAN_bin.bat /silent
::
::	CD "..\OGen-NTier-Tutorial"
::	CALL ..\OGen-NTier-Tutorial\CLEAN_bin.bat /silent
::	CALL ..\OGen-NTier-Tutorial\CLEAN_bin.bat /silent
::---/ ToDos: here!

PAUSE
GOTO eof


:test
	IF EXIST ..\%1\%2\bin RMDIR /S /Q ..\%1\%2\bin
	IF EXIST ..\%1\%2\obj RMDIR /S /Q ..\%1\%2\obj
	::FOR %%a IN (COPYING LICENSE.GPL.txt COPYING.DOC LICENSE.FDL.txt COPYING.LIB LICENSE.LGPL.txt LICENSE.txt) DO IF EXIST ..\%1\%2\%%a DEL /q ..\%1\%2\%%a

	IF NOT '%8' == 't' GOTO skip_doc
		IF EXIST ..\%1\%2\NDoc RMDIR /S /Q ..\%1\%2\NDoc
		IF EXIST ..\%1\%2\_include RMDIR /S /Q ..\%1\%2\_include
		IF EXIST ..\%1\%2\FAQ-*.html DEL /F /Q ..\%1\%2\FAQ-*.html
		IF EXIST ..\%1\%2\Help-*.html DEL /F /Q ..\%1\%2\Help-*.html
		IF EXIST ..\%1\%2\index.html DEL /F /Q ..\%1\%2\index.html
	:skip_doc


:eof
