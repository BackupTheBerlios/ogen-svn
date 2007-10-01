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
IF NOT '%1' == '' GOTO install_step1


::for /f "usebackq tokens=1* delims=^|" %%a in (`cd`) do (
::	IF NOT "%%~fa\" == "%~d0%~p0" GOTO error4
::)


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


SET license_gpl=f
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_GPL' SET license_gpl=t
SET license_lgpl=f
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_LGPL' SET license_lgpl=t
SET license_fdl=f
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_FDL' SET license_fdl=t
SET license_mit=f
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'MIT' SET license_mit=t

::--- <LICENSE.txt>
ECHO.>"%thisdir%licenses\LICENSE.no-svn.txt"
ECHO OGen is licensed under various different licenses.>>"%thisdir%licenses\LICENSE.no-svn.txt"
ECHO.>>"%thisdir%licenses\LICENSE.no-svn.txt"
IF '%license_mit%' == 't' ECHO 	MIT: details available in the file LICENSE.MIT.txt>>"%thisdir%licenses\LICENSE.no-svn.txt"
IF '%license_gpl%' == 't' ECHO 	GNU GPL: details avaliable in the file LICENSE.GPL.txt>>"%thisdir%licenses\LICENSE.no-svn.txt"
IF '%license_lgpl%' == 't' ECHO 	GNU LGPL: details available in the file LICENSE.LGPL.txt>>"%thisdir%licenses\LICENSE.no-svn.txt"
IF '%license_fdl%' == 't' ECHO 	GNU FDL: details available in the file LICENSE.FDL.txt>>"%thisdir%licenses\LICENSE.no-svn.txt"
ECHO.>>"%thisdir%licenses\LICENSE.no-svn.txt"
::ECHO 	For your convenience copies of the MIT, GNU GPL, GNU LGPL and GNU FDL are located in the file COPYING.MIT COPYING, COPYING.LIB and COPYING.DOC
ECHO 	For your convenience copies of the MIT and GNU FDL are located in the file COPYING.MIT and COPYING.DOC>>"%thisdir%licenses\LICENSE.no-svn.txt"
ECHO.>>"%thisdir%licenses\LICENSE.no-svn.txt"
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'MIT' ECHO 	* %%c: MIT>>"%thisdir%licenses\LICENSE.no-svn.txt"
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_GPL' ECHO 	* %%c: GNU GPL>>"%thisdir%licenses\LICENSE.no-svn.txt"
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_LGPL' ECHO 	* %%c: GNU LGPL>>"%thisdir%licenses\LICENSE.no-svn.txt"
FOR /F "usebackq tokens=1,2,3,4,5,6,7 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO IF '%%g' == 'GNU_FDL' ECHO 	* %%c: GNU FDL>>"%thisdir%licenses\LICENSE.no-svn.txt"
ECHO.>>"%thisdir%licenses\LICENSE.no-svn.txt"
::--- </LICENSE.txt>

SET license_gpl=
SET license_lgpl=
SET license_fdl=


FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.MIT" DEL /q /f "%thisdir%..\%%a\COPYING.MIT"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.MIT.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.MIT.txt"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING" DEL /q /f "%thisdir%..\%%a\COPYING"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.GPL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.GPL.txt"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.LIB" DEL /q /f "%thisdir%..\%%a\COPYING.LIB"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.LGPL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.LGPL.txt"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.DOC" DEL /q /f "%thisdir%..\%%a\COPYING.DOC"
FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.FDL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.FDL.txt"
FOR /F "usebackq tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (`TYPE "%thisdir%OGen-projects.txt"`) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
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


:install_step1
	ECHO %1\%2

	IF '%7' == 'MIT' (
		COPY "%thisdir%licenses\COPYING.MIT" "%thisdir%..\%1\%2\COPYING.MIT"
		COPY "%thisdir%licenses\LICENSE.MIT.txt" "%thisdir%..\%1\%2\LICENSE.MIT.txt"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\COPYING.MIT" "%thisdir%..\%%a\COPYING.MIT"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\LICENSE.MIT.txt" "%thisdir%..\%%a\LICENSE.MIT.txt"
		GOTO install_step2
	)
	IF EXIST "%thisdir%..\%1\%2\COPYING.MIT"				DEL /q /f "%thisdir%..\%1\%2\COPYING.MIT"
	IF EXIST "%thisdir%..\%1\%2\LICENSE.MIT.txt"		DEL /q /f "%thisdir%..\%1\%2\LICENSE.MIT.txt"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.MIT" DEL /q /f "%thisdir%..\%%a\COPYING.MIT"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.MIT.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.MIT.txt"

	IF '%7' == 'GNU_GPL' (
		COPY "%thisdir%licenses\COPYING" "%thisdir%..\%1\%2\COPYING"
		COPY "%thisdir%licenses\LICENSE.GPL.txt" "%thisdir%..\%1\%2\LICENSE.GPL.txt"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\COPYING" "%thisdir%..\%%a\COPYING"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\LICENSE.GPL.txt" "%thisdir%..\%%a\LICENSE.GPL.txt"
		GOTO install_step2
	)
	IF EXIST "%thisdir%..\%1\%2\COPYING"						DEL /q /f "%thisdir%..\%1\%2\COPYING"
	IF EXIST "%thisdir%..\%1\%2\LICENSE.GPL.txt"		DEL /q /f "%thisdir%..\%1\%2\LICENSE.GPL.txt"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING" DEL /q /f "%thisdir%..\%%a\COPYING"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.GPL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.GPL.txt"

	IF '%7' == 'GNU_LGPL' (
		COPY "%thisdir%licenses\COPYING.LIB" "%thisdir%..\%1\%2\COPYING.LIB"
		COPY "%thisdir%licenses\LICENSE.LGPL.txt" "%thisdir%..\%1\%2\LICENSE.LGPL.txt"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\COPYING.LIB" "%thisdir%..\%%a\COPYING.LIB"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\LICENSE.LGPL.txt" "%thisdir%..\%%a\LICENSE.LGPL.txt"
		GOTO install_step2
	)
	IF EXIST "%thisdir%..\%1\%2\COPYING.LIB"				DEL /q /f "%thisdir%..\%1\%2\COPYING.LIB"
	IF EXIST "%thisdir%..\%1\%2\LICENSE.LGPL.txt"	DEL /q /f "%thisdir%..\%1\%2\LICENSE.LGPL.txt"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.LIB" DEL /q /f "%thisdir%..\%%a\COPYING.LIB"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.LGPL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.LGPL.txt"

	IF '%7' == 'GNU_FDL' (
		COPY "%thisdir%licenses\COPYING.DOC" "%thisdir%..\%1\%2\COPYING.DOC"
		COPY "%thisdir%licenses\LICENSE.FDL.txt" "%thisdir%..\%1\%2\LICENSE.FDL.txt"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\COPYING.DOC" "%thisdir%..\%%a\COPYING.DOC"
		FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\LICENSE.FDL.txt" "%thisdir%..\%%a\LICENSE.FDL.txt"
		GOTO install_step2
	)
	IF EXIST "%thisdir%..\%1\%2\COPYING.DOC"				DEL /q /f "%thisdir%..\%1\%2\COPYING.DOC"
	IF EXIST "%thisdir%..\%1\%2\LICENSE.FDL.txt"		DEL /q /f "%thisdir%..\%1\%2\LICENSE.FDL.txt"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\COPYING.DOC" DEL /q /f "%thisdir%..\%%a\COPYING.DOC"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO IF EXIST "%thisdir%..\%%a\LICENSE.FDL.txt" DEL /q /f "%thisdir%..\%%a\LICENSE.FDL.txt"

:install_step2
	::COPY /y "%thisdir%licenses\README.txt" "%thisdir%..\%1\%2\README.txt"
	::FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\README.txt" "%thisdir%..\%%a\README.txt"
	COPY /y "%thisdir%licenses\LICENSE.no-svn.txt" "%thisdir%..\%1\%2\LICENSE.txt"
	FOR /F "usebackq tokens=1,2 delims=, " %%a IN (`TYPE "%thisdir%OGen-solutions.txt"`) DO COPY /y "%thisdir%licenses\LICENSE.no-svn.txt" "%thisdir%..\%%a\LICENSE.txt"


:eof
::SET thisdir=
