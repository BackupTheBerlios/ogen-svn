@ECHO OFF
:: is a doc project, hence:
IF '%8' == 't' GOTO eof
IF NOT '%1' == '' GOTO install


CALL "c:\Program Files\Microsoft Visual Studio .NET 2003\Common7\Tools\vsvars32.bat"
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=, " %%a IN (OGen-projects.txt) DO CALL %0 %%a %%b %%c %%d %%e %%f %%g %%h
PAUSE
GOTO eof


:install
gacutil /u %3


:eof
