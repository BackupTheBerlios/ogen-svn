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
type config-templates\OGen.Doc.presentationlayer.console.exe-1.config>..\_release.no-svn\OGen.Doc.presentationlayer.console.exe.config
echo     ^<add key="Templates" value="%parentdir%\OGen-Doc\Doc_templates\templates.config.xml" /^>>>..\_release.no-svn\OGen.Doc.presentationlayer.console.exe.config
type config-templates\OGen.Doc.presentationlayer.console.exe-2.config>>..\_release.no-svn\OGen.Doc.presentationlayer.console.exe.config
::---
type config-templates\OGen.NTier.presentationlayer.console.exe-1.config>..\_release.no-svn\OGen.NTier.presentationlayer.console.exe.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\_release.no-svn\OGen.NTier.presentationlayer.console.exe.config
echo     ^<add key="ogenPath" value="%parentdir%\_release.no-svn" /^>>>..\_release.no-svn\OGen.NTier.presentationlayer.console.exe.config
type config-templates\OGen.NTier.presentationlayer.console.exe-2.config>>..\_release.no-svn\OGen.NTier.presentationlayer.console.exe.config
::---
type config-templates\OGen.NTier.presentationlayer.winforms.exe-1.config>..\_release.no-svn\OGen.NTier.presentationlayer.winforms.exe.config
echo     ^<add key="Templates" value="%parentdir%\OGen-NTier\NTier_templates\templates.config.xml" /^>>>..\_release.no-svn\OGen.NTier.presentationlayer.winforms.exe.config
echo     ^<add key="ogenPath" value="%parentdir%\_release.no-svn" /^>>>..\_release.no-svn\OGen.NTier.presentationlayer.winforms.exe.config
type config-templates\OGen.NTier.presentationlayer.winforms.exe-2.config>>..\_release.no-svn\OGen.NTier.presentationlayer.winforms.exe.config
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
