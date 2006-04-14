<%/*

OGen
Copyright (C) 2002 Francisco Monteiro

This file is part of OGen.

OGen is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 2 of the License, or 
(at your option) any later version.

OGen is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details.

You should have received a copy of the GNU General Public License 
along with OGen; if not, write to the

	Free Software Foundation, Inc., 
	59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA 

							- or -

	http://www.fsf.org/licensing/licenses/gpl.txt

*/%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);

//cDBMetadata_Table aux_table;
//cDBMetadata_Table_Field aux_field;
//int aux_table_hasidentitykey;
//string[] aux_configmodes = aux_metadata.ConfigModes();
#endregion
//-----------------------------------------------------------------------------------------
%>Microsoft Visual Studio Solution File, Format Version 9.00
# Visual Studio 2005
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_datalayer-8", "<%=aux_metadata.ApplicationName%>_datalayer\<%=aux_metadata.ApplicationName%>_datalayer-8.csproj", "{<%=aux_metadata.GUIDDatalayer%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_datalayer_UTs-8", "<%=aux_metadata.ApplicationName%>_datalayer_UTs\<%=aux_metadata.ApplicationName%>_datalayer_UTs-8.csproj", "{<%=aux_metadata.GUIDDatalayer_UTs%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_businesslayer-8", "<%=aux_metadata.ApplicationName%>_businesslayer\<%=aux_metadata.ApplicationName%>_businesslayer-8.csproj", "{<%=aux_metadata.GUIDBusinesslayer%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_businesslayer_UTs-8", "<%=aux_metadata.ApplicationName%>_businesslayer_UTs\<%=aux_metadata.ApplicationName%>_businesslayer_UTs-8.csproj", "{<%=aux_metadata.GUIDBusinesslayer_UTs%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_test-8", "<%=aux_metadata.ApplicationName%>_test\<%=aux_metadata.ApplicationName%>_test-8.csproj", "{<%=aux_metadata.GUIDTest%>}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{<%=aux_metadata.GUIDDatalayer%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=aux_metadata.GUIDDatalayer%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=aux_metadata.GUIDDatalayer%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=aux_metadata.GUIDDatalayer%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=aux_metadata.GUIDTest%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=aux_metadata.GUIDTest%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=aux_metadata.GUIDTest%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=aux_metadata.GUIDTest%>}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
EndGlobal
