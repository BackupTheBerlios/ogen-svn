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
string _arg_where = System.Web.HttpUtility.UrlDecode(Request.QueryString["where"]);
string _aux_outputPath = System.Web.HttpUtility.UrlDecode(Request.QueryString["outputPath"]);
#endregion

#region varaux...
XS__RootMetadata _aux_root_metadata = XS__RootMetadata.Load_fromFile(
	_arg_MetadataFilepath, 
	true
);
XS__metadataDB _aux_db_metadata = _aux_root_metadata.MetadataDBCollection[0];
XS__metadataExtended _aux_ex_metadata = _aux_root_metadata.MetadataExtendedCollection[0];
XS__metadataBusiness _aux_business_metadata = _aux_root_metadata.MetadataBusinessCollection[0];

string[] _aux_configmodes = _aux_ex_metadata.DBs.ConfigModes();

OGen.NTier.lib.metadata.metadataBusiness.XS_classType _aux_class;
#endregion
//-----------------------------------------------------------------------------------------
%><?xml version="1.0" encoding="utf-8" ?><%
if (_aux_ex_metadata.CopyrightTextLong != string.Empty) {%>
<!--

<%=_aux_ex_metadata.CopyrightTextLong%>

--><%
} else if (_aux_ex_metadata.CopyrightText != string.Empty) {%>
<!--

<%=_aux_ex_metadata.CopyrightText%>

--><%
}%>
<configuration>
	<appSettings><%--
		<add key="RemotingServer_ServerURI" value="<%=_aux_ex_metadata.RemotingServer_ServerURI%>" />
		<add key="RemotingServer_ServerPort" value="<%=_aux_ex_metadata.RemotingServer_ServerPort%>" />--%>

		<add key="Webservices_ServerURI" value="<%=_aux_ex_metadata.Webservices_ServerURI%>" />
		<add key="Webservices_ServerPort" value="<%=_aux_ex_metadata.Webservices_ServerPort%>" />
		<add key="Webservices_ResetClientIP" value="True" />

		<add key="Remoting_ResetClientIP" value="True" /><%

if (_arg_where != "test") {%>

		<add key="applications" value="<%=_aux_ex_metadata.ApplicationName%>" />

		<add key="<%=_aux_ex_metadata.ApplicationName%>:ConfigModes" value="<%
		for (int _cm = 0; _cm < _aux_configmodes.Length; _cm++) {
			%><%=_aux_configmodes[_cm]%><%=(_cm == _aux_configmodes.Length - 1) ? "" : ":"%><%
		}%>" />
		<add key="<%=_aux_ex_metadata.ApplicationName%>:DBServerTypes" value="<%
		for (int d = 0; d < _aux_ex_metadata.DBs.DBCollection.Count; d++) {
			%><%=_aux_ex_metadata.DBs.DBCollection[d].DBServerType.ToString()%><%=(d == _aux_ex_metadata.DBs.DBCollection.Count - 1) ? "" : ":"%><%
		}%>" />

		<!-- IsDefault::GeneratedSQL::IsIndexed_andReadOnly::Connectionstring --><%
		//<add key="OGen-NTier_UTs:DBServerType_default" value="< %=_aux_ex_metadata.DBs.DBCollection.FirstDefaultAvailable_DBServerType().ToString()% >" />
		for (int d = 0; d < _aux_ex_metadata.DBs.DBCollection.Count; d++) {
			for (int c = 0; c < _aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection.Count; c++) {%>
		<add key="<%=_aux_ex_metadata.ApplicationName%>:DBConnection:<%=_aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].ConfigMode%>:<%=_aux_ex_metadata.DBs.DBCollection[d].DBServerType.ToString()%>" value="<%=_aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].isDefault%>::<%=_aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].generateSQL%>::<%=_aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].isIndexed_andReadOnly%>::<%=_aux_ex_metadata.DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].Connectionstring%>"/><%
			}
		}
}%>

		<add key="Some_UT_config" value="tweak it here" />
	</appSettings>
	<system.runtime.remoting>
		<application><%
if (_arg_where == "test") {%>
			<channels>
				<channel ref="tcp">
					<clientProviders>
						<formatter 
							ref="binary" 
							typeFilterLevel="Full"/>
						<provider 
							type="OGen.NTier.lib.distributedlayer.remoting.client.CompressionClientSinkProvider, OGen.NTier.lib.distributedlayer.remoting.client-2.0" />
						<provider 
							type="OGen.NTier.lib.distributedlayer.remoting.client.EncryptionClientSinkProvider, OGen.NTier.lib.distributedlayer.remoting.client-2.0"
							keysPath="<%=System.IO.Path.Combine(_aux_outputPath, "keys-client")%>"
							clientID=" YOU MUST SET CLIENT KEY FILE HERE! "/>
					</clientProviders>
				</channel>
			</channels>
			<client><%
				for (int c = 0; c < _aux_business_metadata.Classes.ClassCollection.Count; c++) {
					_aux_class = _aux_business_metadata.Classes.ClassCollection[c];%>
				<wellknown 
					type="<%=_aux_ex_metadata.ApplicationNamespace%>.lib.distributedlayer.remoting.server.RS_<%=_aux_class.Name%>, <%=_aux_ex_metadata.ApplicationNamespace%>.lib.distributedlayer.remoting.client-2.0"
					url="<%=_aux_ex_metadata.RemotingServer_ServerURI%>:<%=_aux_ex_metadata.RemotingServer_ServerPort%>/<%=_aux_class.Name%>.remoting" /><%
				}%>
			</client><%
} else if (_arg_where == "remoting-simpleserver") {%>
			<channels>
				<channel ref="tcp" port="<%=_aux_ex_metadata.RemotingServer_ServerPort%>">
					<serverProviders>
						<provider 
							type="OGen.NTier.lib.distributedlayer.remoting.server.EncryptionServerSinkProvider, OGen.NTier.lib.distributedlayer.remoting.server-2.0"
							keysPath="<%=System.IO.Path.Combine(_aux_outputPath, "keys-server")%>"
							mustDo="False" />
						<provider 
							type="OGen.NTier.lib.distributedlayer.remoting.server.CompressionServerSinkProvider, OGen.NTier.lib.distributedlayer.remoting.server-2.0"
							mustDo="False" />
						<provider
							type="OGen.NTier.lib.distributedlayer.remoting.server.ClientIPAddressServerSinkProvider, OGen.NTier.lib.distributedlayer.remoting.server-2.0" />
						<formatter 
							ref="binary" 
							typeFilterLevel="Full"/>
					</serverProviders>
				</channel>
			</channels>
			<service><%
				for (int c = 0; c < _aux_business_metadata.Classes.ClassCollection.Count; c++) {
					_aux_class = _aux_business_metadata.Classes.ClassCollection[c];%>
				<wellknown 
					mode="Singleton"
					type="<%=_aux_ex_metadata.ApplicationNamespace%>.lib.distributedlayer.remoting.server.RS_<%=_aux_class.Name%>, <%=_aux_ex_metadata.ApplicationNamespace%>.lib.distributedlayer.remoting.server-2.0"
					objectUri="<%=_aux_class.Name%>.remoting" /><%
				}%>
			</service><%
}%>
		</application>
	</system.runtime.remoting><%

if (_arg_where == "webservices-server") {%>
	<connectionStrings/>
	<system.web>
		<!-- 
			Set compilation debug="true" to insert debugging 
			symbols into the compiled page. Because this 
			affects performance, set this value to true only 
			during development.
		-->
		<compilation debug="false">

		</compilation>
		<!--
			The <authentication> section enables configuration 
			of the security authentication mode used by 
			ASP.NET to identify an incoming user. 
		-->
		<authentication mode="Windows" />
		<!--
			The <customErrors> section enables configuration 
			of what to do if/when an unhandled error occurs 
			during the execution of a request. Specifically, 
			it enables developers to configure html error pages 
			to be displayed in place of a error stack trace.

		<customErrors mode="RemoteOnly" defaultRedirect="GenericErrorPage.htm">
			<error statusCode="403" redirect="NoAccess.htm" />
			<error statusCode="404" redirect="FileNotFound.htm" />
		</customErrors>
		-->
	</system.web><%
}%>
</configuration><%
//-----------------------------------------------------------------------------------------
%>