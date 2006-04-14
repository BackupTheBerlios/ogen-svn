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
%>Microsoft Visual Studio Solution File, Format Version 8.00
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_datalayer", "<%=aux_metadata.ApplicationName%>_datalayer\<%=aux_metadata.ApplicationName%>_datalayer-7.1.csproj", "{<%=aux_metadata.GUIDDatalayer%>}"
	ProjectSection(ProjectDependencies) = postProject
	EndProjectSection
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_datalayer_UTs", "<%=aux_metadata.ApplicationName%>_datalayer_UTs\<%=aux_metadata.ApplicationName%>_datalayer_UTs-7.1.csproj", "{<%=aux_metadata.GUIDDatalayer_UTs%>}"
	ProjectSection(ProjectDependencies) = postProject
	EndProjectSection
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_businesslayer", "<%=aux_metadata.ApplicationName%>_businesslayer\<%=aux_metadata.ApplicationName%>_businesslayer-7.1.csproj", "{<%=aux_metadata.GUIDBusinesslayer%>}"
	ProjectSection(ProjectDependencies) = postProject
	EndProjectSection
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_businesslayer_UTs", "<%=aux_metadata.ApplicationName%>_businesslayer_UTs\<%=aux_metadata.ApplicationName%>_businesslayer_UTs-7.1.csproj", "{<%=aux_metadata.GUIDBusinesslayer_UTs%>}"
	ProjectSection(ProjectDependencies) = postProject
	EndProjectSection
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=aux_metadata.ApplicationName%>_test", "<%=aux_metadata.ApplicationName%>_test\<%=aux_metadata.ApplicationName%>_test-7.1.csproj", "{<%=aux_metadata.GUIDTest%>}"
	ProjectSection(ProjectDependencies) = postProject
	EndProjectSection
EndProject
Global
	GlobalSection(SolutionConfiguration) = preSolution
		Debug = Debug
		Release = Release
	EndGlobalSection
	GlobalSection(ProjectConfiguration) = postSolution
		{<%=aux_metadata.GUIDDatalayer%>}.Debug.ActiveCfg = Debug|.NET
		{<%=aux_metadata.GUIDDatalayer%>}.Debug.Build.0 = Debug|.NET
		{<%=aux_metadata.GUIDDatalayer%>}.Release.ActiveCfg = Release|.NET
		{<%=aux_metadata.GUIDDatalayer%>}.Release.Build.0 = Release|.NET
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Debug.ActiveCfg = Debug|.NET
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Debug.Build.0 = Debug|.NET
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Release.ActiveCfg = Release|.NET
		{<%=aux_metadata.GUIDDatalayer_UTs%>}.Release.Build.0 = Release|.NET
		{<%=aux_metadata.GUIDBusinesslayer%>}.Debug.ActiveCfg = Debug|.NET
		{<%=aux_metadata.GUIDBusinesslayer%>}.Debug.Build.0 = Debug|.NET
		{<%=aux_metadata.GUIDBusinesslayer%>}.Release.ActiveCfg = Release|.NET
		{<%=aux_metadata.GUIDBusinesslayer%>}.Release.Build.0 = Release|.NET
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Debug.ActiveCfg = Debug|.NET
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Debug.Build.0 = Debug|.NET
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Release.ActiveCfg = Release|.NET
		{<%=aux_metadata.GUIDBusinesslayer_UTs%>}.Release.Build.0 = Release|.NET
		{<%=aux_metadata.GUIDTest%>}.Debug.ActiveCfg = Debug|.NET
		{<%=aux_metadata.GUIDTest%>}.Debug.Build.0 = Debug|.NET
		{<%=aux_metadata.GUIDTest%>}.Release.ActiveCfg = Release|.NET
		{<%=aux_metadata.GUIDTest%>}.Release.Build.0 = Release|.NET
	EndGlobalSection
	GlobalSection(ExtensibilityGlobals) = postSolution
	EndGlobalSection
	GlobalSection(ExtensibilityAddIns) = postSolution
	EndGlobalSection
EndGlobal
