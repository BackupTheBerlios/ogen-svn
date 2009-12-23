<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataExtended" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataDB" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataBusiness" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
bool _arg_gac = bool.Parse(System.Web.HttpUtility.UrlDecode(Request.QueryString["GAC"]));
string _arg_ogenpath = System.Web.HttpUtility.UrlDecode(Request.QueryString["OGenPath"]);
#endregion

#region varaux...
XS__RootMetadata _aux_root_metadata = XS__RootMetadata.Load_fromFile(
	_arg_MetadataFilepath, 
	true
);
XS__metadataDB _aux_db_metadata = _aux_root_metadata.MetadataDBCollection[0];
XS__metadataExtended _aux_ex_metadata = _aux_root_metadata.MetadataExtendedCollection[0];
XS__metadataBusiness _aux_business_metadata = _aux_root_metadata.MetadataBusinessCollection[0];

string _aux_path = _arg_ogenpath + @"\..\..";
string _aux_no_gac = (_arg_gac) ? "" : "-no-gac";
#endregion
//-----------------------------------------------------------------------------------------
%>Microsoft Visual Studio Solution File, Format Version 10.00
# Visual Studio 2008<%
if (!_arg_gac) {%>
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "OGen_datalayer__base-9", "<%=_aux_path%>\OGen\OGen_datalayer__base\OGen_datalayer__base-9.csproj", "{D66D0E69-852C-4695-9D63-C9AB1A959E0B}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "NTier_datalayer-9", "<%=_aux_path%>\OGen-NTier\NTier_datalayer\NTier_datalayer-9.csproj", "{38BEF535-92F1-4C55-9CEA-8F8D3E82CAFD}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "OGen_datalayer_PostgreSQL-9", "<%=_aux_path%>\OGen\OGen_datalayer_PostgreSQL\OGen_datalayer_PostgreSQL-9.csproj", "{07D7D1E0-A4F9-45C3-8100-FC60AC3BF8FA}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "NTier_datalayer_proxy-9", "<%=_aux_path%>\OGen-NTier\NTier_datalayer_proxy\NTier_datalayer_proxy-9.csproj", "{F17F7FA0-920E-4AE1-908F-2798D0124996}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "NTier_businesslayer-9", "<%=_aux_path%>\OGen-NTier\NTier_businesslayer\NTier_businesslayer-9.csproj", "{8AEBEA64-6FC4-430C-922C-B88D105AE91C}"
EndProject<%
}%><%--
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>--test", "<%=_aux_ex_metadata.ApplicationName%>-test\<%=_aux_ex_metadata.ApplicationName%>-test-9.csproj", "{A547D030-955C-46F2-8573-7B1C8EBAD3A9}"
EndProject
--%>
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-datalayer", "<%=_aux_ex_metadata.ApplicationName%>-datalayer\<%=_aux_ex_metadata.ApplicationName%>-datalayer-9<%=_aux_no_gac%>.csproj", "{<%=_aux_ex_metadata.GUID_datalayer%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-businesslayer", "<%=_aux_ex_metadata.ApplicationName%>-businesslayer\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-9<%=_aux_no_gac%>.csproj", "{<%=_aux_ex_metadata.GUID_businesslayer%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-shared", "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-shared\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-shared-9<%=_aux_no_gac%>.csproj", "{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures", "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures-9<%=_aux_no_gac%>.csproj", "{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-datalayer-structures", "<%=_aux_ex_metadata.ApplicationName%>-datalayer-structures\<%=_aux_ex_metadata.ApplicationName%>-datalayer-structures-9<%=_aux_no_gac%>.csproj", "{<%=_aux_ex_metadata.GUID_datalayer_structures%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-remoting-client", "<%=_aux_ex_metadata.ApplicationName%>-remoting-client\<%=_aux_ex_metadata.ApplicationName%>-remoting-client-9.csproj", "{<%=_aux_ex_metadata.GUID_remoting_client%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-instances", "<%=_aux_ex_metadata.ApplicationName%>-businesslayer-instances\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-instances-9.csproj", "{<%=_aux_ex_metadata.GUID_businesslayer_instances%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-webservices-server", "<%=_aux_ex_metadata.ApplicationName%>-webservices-server\<%=_aux_ex_metadata.ApplicationName%>-webservices-server-9.csproj", "{<%=_aux_ex_metadata.GUID_webservices_server%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-webservices-client", "<%=_aux_ex_metadata.ApplicationName%>-webservices-client\<%=_aux_ex_metadata.ApplicationName%>-webservices-client-9.csproj", "{<%=_aux_ex_metadata.GUID_webservices_client%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-remoting-server", "<%=_aux_ex_metadata.ApplicationName%>-remoting-server\<%=_aux_ex_metadata.ApplicationName%>-remoting-server-9.csproj", "{<%=_aux_ex_metadata.GUID_remoting_server%>}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "<%=_aux_ex_metadata.ApplicationName%>-remoting-simpleserver", "<%=_aux_ex_metadata.ApplicationName%>-remoting-simpleserver\<%=_aux_ex_metadata.ApplicationName%>-remoting-simpleserver-9.csproj", "{<%=_aux_ex_metadata.GUID_remoting_simpleserver%>}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution<%
if (!_arg_gac) {%>
		{D66D0E69-852C-4695-9D63-C9AB1A959E0B}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{D66D0E69-852C-4695-9D63-C9AB1A959E0B}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{D66D0E69-852C-4695-9D63-C9AB1A959E0B}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{D66D0E69-852C-4695-9D63-C9AB1A959E0B}.Release|Any CPU.Build.0 = Release|Any CPU
		{38BEF535-92F1-4C55-9CEA-8F8D3E82CAFD}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{38BEF535-92F1-4C55-9CEA-8F8D3E82CAFD}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{38BEF535-92F1-4C55-9CEA-8F8D3E82CAFD}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{38BEF535-92F1-4C55-9CEA-8F8D3E82CAFD}.Release|Any CPU.Build.0 = Release|Any CPU
		{07D7D1E0-A4F9-45C3-8100-FC60AC3BF8FA}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{07D7D1E0-A4F9-45C3-8100-FC60AC3BF8FA}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{07D7D1E0-A4F9-45C3-8100-FC60AC3BF8FA}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{07D7D1E0-A4F9-45C3-8100-FC60AC3BF8FA}.Release|Any CPU.Build.0 = Release|Any CPU
		{F17F7FA0-920E-4AE1-908F-2798D0124996}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{F17F7FA0-920E-4AE1-908F-2798D0124996}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{F17F7FA0-920E-4AE1-908F-2798D0124996}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{F17F7FA0-920E-4AE1-908F-2798D0124996}.Release|Any CPU.Build.0 = Release|Any CPU
		{8AEBEA64-6FC4-430C-922C-B88D105AE91C}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8AEBEA64-6FC4-430C-922C-B88D105AE91C}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8AEBEA64-6FC4-430C-922C-B88D105AE91C}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8AEBEA64-6FC4-430C-922C-B88D105AE91C}.Release|Any CPU.Build.0 = Release|Any CPU<%
}%><%--
		{A547D030-955C-46F2-8573-7B1C8EBAD3A9}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{A547D030-955C-46F2-8573-7B1C8EBAD3A9}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{A547D030-955C-46F2-8573-7B1C8EBAD3A9}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{A547D030-955C-46F2-8573-7B1C8EBAD3A9}.Release|Any CPU.Build.0 = Release|Any CPU
--%>
		{<%=_aux_ex_metadata.GUID_datalayer%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer_structures%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer_structures%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer_structures%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_datalayer_structures%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_client%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_client%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_client%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_client%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_instances%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_instances%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_instances%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_businesslayer_instances%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_server%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_server%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_server%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_server%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_client%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_client%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_client%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_webservices_client%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_server%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_server%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_server%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_server%>}.Release|Any CPU.Build.0 = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_simpleserver%>}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_simpleserver%>}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_simpleserver%>}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{<%=_aux_ex_metadata.GUID_remoting_simpleserver%>}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
EndGlobal