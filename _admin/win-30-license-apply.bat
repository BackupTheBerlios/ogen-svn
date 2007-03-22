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
IF NOT '%1' == '' GOTO install_step1


for /f "usebackq tokens=1* delims=^|" %%a in (`cd`) do (
	IF NOT "%%~fa\" == "%~d0%~p0" GOTO error4
)


IF NOT EXIST "OGen-solutions.txt" GOTO error2
IF NOT EXIST "OGen-projects.txt" GOTO error3


SET license_gpl=f
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_GPL' SET license_gpl=t
SET license_lgpl=f
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_LGPL' SET license_lgpl=t
SET license_fdl=f
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_FDL' SET license_fdl=t
SET license_mit=f
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'MIT' SET license_mit=t

::--- <LICENSE.txt>
ECHO.>licenses\LICENSE.no-svn.txt
ECHO OGen is licensed under various different licenses.>>licenses\LICENSE.no-svn.txt
ECHO.>>licenses\LICENSE.no-svn.txt
IF '%license_mit%' == 't' ECHO 	MIT: details available in the file LICENSE.MIT.txt>>licenses\LICENSE.no-svn.txt
IF '%license_gpl%' == 't' ECHO 	GNU GPL: details avaliable in the file LICENSE.GPL.txt>>licenses\LICENSE.no-svn.txt
IF '%license_lgpl%' == 't' ECHO 	GNU LGPL: details available in the file LICENSE.LGPL.txt>>licenses\LICENSE.no-svn.txt
IF '%license_fdl%' == 't' ECHO 	GNU FDL: details available in the file LICENSE.FDL.txt>>licenses\LICENSE.no-svn.txt
ECHO.>>licenses\LICENSE.no-svn.txt
::ECHO 	For your convenience copies of the MIT, GNU GPL, GNU LGPL and GNU FDL are located in the file COPYING.MIT COPYING, COPYING.LIB and COPYING.DOC
ECHO 	For your convenience copies of the MIT and GNU FDL are located in the file COPYING.MIT and COPYING.DOC>>licenses\LICENSE.no-svn.txt
ECHO.>>licenses\LICENSE.no-svn.txt
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'MIT' ECHO 	* %%c: MIT>>licenses\LICENSE.no-svn.txt
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_GPL' ECHO 	* %%c: GNU GPL>>licenses\LICENSE.no-svn.txt
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_LGPL' ECHO 	* %%c: GNU LGPL>>licenses\LICENSE.no-svn.txt
FOR /F "tokens=1,2,3,4,5,6,7 delims=, " %%a IN (OGen-projects.txt) DO IF '%%g' == 'GNU_FDL' ECHO 	* %%c: GNU FDL>>licenses\LICENSE.no-svn.txt
ECHO.>>licenses\LICENSE.no-svn.txt
::--- </LICENSE.txt>

SET license_gpl=
SET license_lgpl=
SET license_fdl=


FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.MIT DEL /q /f ..\%%a\COPYING.MIT
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.MIT.txt DEL /q /f ..\%%a\LICENSE.MIT.txt
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING DEL /q /f ..\%%a\COPYING
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.GPL.txt DEL /q /f ..\%%a\LICENSE.GPL.txt
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.LIB DEL /q /f ..\%%a\COPYING.LIB
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.LGPL.txt DEL /q /f ..\%%a\LICENSE.LGPL.txt
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.DOC DEL /q /f ..\%%a\COPYING.DOC
FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.FDL.txt DEL /q /f ..\%%a\LICENSE.FDL.txt
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
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
	IF NOT '%7' == 'MIT' GOTO skip_mit
		COPY licenses\COPYING.MIT ..\%1\%2\COPYING.MIT
		COPY licenses\LICENSE.MIT.txt ..\%1\%2\LICENSE.MIT.txt
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\COPYING.MIT ..\%%a\COPYING.MIT
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\LICENSE.MIT.txt ..\%%a\LICENSE.MIT.txt
	GOTO install_step2
	:skip_mit
		IF EXIST ..\%1\%2\COPYING.MIT				DEL /q /f ..\%1\%2\COPYING.MIT
		IF EXIST ..\%1\%2\LICENSE.MIT.txt		DEL /q /f ..\%1\%2\LICENSE.MIT.txt
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.MIT DEL /q /f ..\%%a\COPYING.MIT
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.MIT.txt DEL /q /f ..\%%a\LICENSE.MIT.txt

	IF NOT '%7' == 'GNU_GPL' GOTO skip_gpl
		COPY licenses\COPYING ..\%1\%2\COPYING
		COPY licenses\LICENSE.GPL.txt ..\%1\%2\LICENSE.GPL.txt
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\COPYING ..\%%a\COPYING
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\LICENSE.GPL.txt ..\%%a\LICENSE.GPL.txt
	GOTO install_step2
	:skip_gpl
		IF EXIST ..\%1\%2\COPYING						DEL /q /f ..\%1\%2\COPYING
		IF EXIST ..\%1\%2\LICENSE.GPL.txt		DEL /q /f ..\%1\%2\LICENSE.GPL.txt
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING DEL /q /f ..\%%a\COPYING
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.GPL.txt DEL /q /f ..\%%a\LICENSE.GPL.txt

	IF NOT '%7' == 'GNU_LGPL' GOTO skip_lgpl
		COPY licenses\COPYING.LIB ..\%1\%2\COPYING.LIB
		COPY licenses\LICENSE.LGPL.txt ..\%1\%2\LICENSE.LGPL.txt
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\COPYING.LIB ..\%%a\COPYING.LIB
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\LICENSE.LGPL.txt ..\%%a\LICENSE.LGPL.txt
	GOTO install_step2
	:skip_lgpl
		IF EXIST ..\%1\%2\COPYING.LIB				DEL /q /f ..\%1\%2\COPYING.LIB
		IF EXIST ..\%1\%2\LICENSE.LGPL.txt	DEL /q /f ..\%1\%2\LICENSE.LGPL.txt
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.LIB DEL /q /f ..\%%a\COPYING.LIB
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.LGPL.txt DEL /q /f ..\%%a\LICENSE.LGPL.txt

	IF NOT '%7' == 'GNU_FDL' GOTO skip_fdl
		COPY licenses\COPYING.DOC ..\%1\%2\COPYING.DOC
		COPY licenses\LICENSE.FDL.txt ..\%1\%2\LICENSE.FDL.txt
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\COPYING.DOC ..\%%a\COPYING.DOC
		FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\LICENSE.FDL.txt ..\%%a\LICENSE.FDL.txt
	GOTO install_step2
	:skip_fdl
		IF EXIST ..\%1\%2\COPYING.DOC				DEL /q /f ..\%1\%2\COPYING.DOC
		IF EXIST ..\%1\%2\LICENSE.FDL.txt		DEL /q /f ..\%1\%2\LICENSE.FDL.txt
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\COPYING.DOC DEL /q /f ..\%%a\COPYING.DOC
		::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO IF EXIST ..\%%a\LICENSE.FDL.txt DEL /q /f ..\%%a\LICENSE.FDL.txt

:install_step2
	::COPY /y licenses\README.txt ..\%1\%2\README.txt
	::FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\README.txt ..\%%a\README.txt

	COPY /y licenses\LICENSE.no-svn.txt ..\%1\%2\LICENSE.txt
	FOR /F "tokens=1,2 delims=, " %%a IN (OGen-solutions.txt) DO COPY /y licenses\LICENSE.no-svn.txt ..\%%a\LICENSE.txt


:eof
