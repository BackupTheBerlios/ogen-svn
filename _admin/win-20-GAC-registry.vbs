Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")

WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\AssemblyFolders\OGen", "o:\_release.no-svn"