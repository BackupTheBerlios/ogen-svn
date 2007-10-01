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
SET thisdir=%~d0%~p0
IF NOT '%1' == '' GOTO test


for /f "usebackq tokens=1* delims=^|" %%a in (`cd`) do (
	IF NOT "%%~fa\" == "%~d0%~p0" GOTO error4
)


IF NOT EXIST "%thisdir%OGen-solutions.txt" GOTO error2
IF NOT EXIST "%thisdir%OGen-projects.txt" GOTO error3


ECHO about to delete binaries and objects for present solution
ECHO are you sure?
PAUSE


FOR /F "usebackq tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.txt" DEL /q "%thisdir%..\%%a\LICENSE.txt"
::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO FOR %%b IN (COPYING, COPYING.DOC, COPYING.LIB, LICENSE.FDL.txt, LICENSE.GPL.txt, LICENSE.LGPL.txt) DO IF EXIST "%thisdir%..\%%a\%%b" DEL /q "%thisdir%..\%%a\%%b"


::---\ ToDos: here!
::	CD "%thisdir%..\OGen-NTier-CaseStudy"
::	CALL "%thisdir%..\OGen-NTier-CaseStudy\CLEAN_bin.bat" /silent
::	CALL "%thisdir%..\OGen-NTier-CaseStudy\CLEAN_bin.bat" /silent
::
::	CD "%thisdir%..\OGen-NTier-Tutorial"
::	CALL "%thisdir%..\OGen-NTier-Tutorial\CLEAN_bin.bat" /silent
::	CALL "%thisdir%..\OGen-NTier-Tutorial\CLEAN_bin.bat" /silent
::---/ ToDos: here!

PAUSE
GOTO eof


:error2
	ECHO.
	ECHO.
	ECHO ERROR 2: - Can't find file 'OGen-solutions.txt'
	PAUSE
GOTO eof
:error3
	ECHO.
	ECHO.
	ECHO ERROR 3: - Can't find file 'OGen-projects.txt'
	PAUSE
GOTO eof
:error4
	ECHO.
	ECHO.
	ECHO ERROR 4: - %~n0%~x0 must be called from it's own directory: %~f0
	PAUSE
GOTO eof


:test
	IF EXIST "%thisdir%..\%1\%2\bin" RMDIR /S /Q "%thisdir%..\%1\%2\bin"
	IF EXIST "%thisdir%..\%1\%2\obj" RMDIR /S /Q "%thisdir%..\%1\%2\obj"
	::FOR %%a IN (COPYING LICENSE.GPL.txt COPYING.DOC LICENSE.FDL.txt COPYING.LIB LICENSE.LGPL.txt LICENSE.txt) DO IF EXIST "%thisdir%..\%1\%2\%%a" DEL /q "%thisdir%..\%1\%2\%%a"

	IF '%8' == 't' (
		REM IF EXIST "%thisdir%..\%1\%2\NDoc"        RMDIR /S /Q "%thisdir%..\%1\%2\NDoc"
		REM IF EXIST "%thisdir%..\%1\%2\_include"    RMDIR /S /Q "%thisdir%..\%1\%2\_include"
		REM IF EXIST "%thisdir%..\%1\%2\FAQ-*.html"  DEL /F /Q "%thisdir%..\%1\%2\FAQ-*.html"
		REM IF EXIST "%thisdir%..\%1\%2\Help-*.html" DEL /F /Q "%thisdir%..\%1\%2\Help-*.html"
		REM IF EXIST "%thisdir%..\%1\%2\index.html"  DEL /F /Q "%thisdir%..\%1\%2\index.html"
	)


:eof
SET thisdir=
