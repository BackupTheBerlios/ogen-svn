@ECHO OFF
IF "%~d0%~p0..\bin" == "" GOTO error1
IF NOT EXIST "%~d0%~p0..\bin\OGen.NTier.presentationlayer.console-1.1.exe" GOTO error2
IF NOT EXIST "%~d0%~p0OGen-metadatas\MD_OGen-NTier_UTs.OGen-metadata.xml" GOTO error3


"%~d0%~p0..\bin\OGen.NTier.presentationlayer.console-1.1.exe" "%~d0%~p0OGen-metadatas\MD_OGen-NTier_UTs.OGen-metadata.xml"
PAUSE
GOTO eof


:error1
	ECHO Can't find OGen (badly generated config file)
	PAUSE
GOTO eof
:error2
	ECHO Can't find: "%~d0%~p0..\bin\OGen.NTier.presentationlayer.console-1.1.exe", 
	ECHO %~n0%~x0 needs some tweaking
	PAUSE
GOTO eof
:error3
	ECHO Can't find: "%~d0%~p0OGen-metadatas\MD_OGen-NTier_UTs.OGen-metadata.xml"
	ECHO %~n0%~x0 needs some tweaking
	PAUSE
GOTO eof


:eof
