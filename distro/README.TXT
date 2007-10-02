
Read Me
=========

Scripts should be run in the order they are numbered, you should read the fallowing script description before you run them




Instalation Scripts Description
=================================

win-10-GAC-sn.bat
	- generates keys needed to compile assemblies with strong name so they can be added to GAC

win-15-GAC-app.config.bat
	- generates app.config with local path to OGen project

win-20-GAC-registry-tweak4visualstudio2003.js
	- makes GAC registered assemblies visivle in visual studio 2001 and 2003, by adding a key to the windows registry,
	if you don't use visual studio 2001 or 2003, then you don't need to run this script

win-35-OGen-buildAssembies-7.1.sln
	- visual studio 2003 solution, you should set build configuration to RELEASE and compile this solution

win-35-OGen-buildAssembies-8.sln
	- sharp development / visual studio 2005 solution, you should set build configuration to RELEASE and compile this solution

win-40-GAC-install-1.1.bat
	- copies (visual studio 2003) compiled assemblies to bin directory and adds them to the GAC

win-40-GAC-install-2.0.bat
	- copies (sharp development / visual studio 2005) compiled assemblies to bin directory and adds them to the GAC

win-60-OGen.Doc.Templates-install-1.1.bat
	- copies (visual studio 2003) compiled assembly for the OGen-Doc Templates to bin directory
	and generates web.config file

win-60-OGen.Doc.Templates-install-2.0.bat
	- copies (sharp development / visual studio 2005) compiled assembly for the OGen-Doc Templates to bin directory
	and generates web.config file

win-60-OGen.NTier.Templates-install-1.1.bat
	- copies (visual studio 2003) compiled assembly for the OGen-NTier Templates to bin directory
	and generates web.config file

win-60-OGen.NTier.Templates-install-2.0.bat
	- copies (sharp development / visual studio 2005) compiled assembly for the OGen-NTier Templates to bin directory
	and generates web.config file


De-Instalation Scripts Description
====================================

win-50-GAC-uninstall-1.1.bat
	- removes (visual studio 2003) compiled assemblies from the GAC and deletes them from the bin directory

win-50-GAC-uninstall-2.0.bat
	- removes (sharp development / visual studio 2005) compiled assemblies from the GAC and deletes them from the bin directory

win-50-GAC-uninstall.bat
	- auxiliar script for the previous two scripts

win-90-clear_bin.bat
	- deletes bin and obj folders from all OGen projects


OGen Auxiliar Scripts Description
===================================

win-00-test.bat
	- only usefull for OGen developers, you don't need to run this script

win-30-license-apply.bat
	- only usefull for OGen developers, you don't need to run this script

win-40-GAC-install.bat
	- auxiliar script for the previous two scripts

win-60-OGen.Templates-install.bat
	- auxiliar script for the previous four scripts
