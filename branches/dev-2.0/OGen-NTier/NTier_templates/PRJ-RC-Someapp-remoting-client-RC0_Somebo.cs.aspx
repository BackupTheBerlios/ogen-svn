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
string _arg_ClassName = System.Web.HttpUtility.UrlDecode(Request.QueryString["ClassName"]);
#endregion

#region varaux...
XS__RootMetadata _aux_root_metadata = XS__RootMetadata.Load_fromFile(
	_arg_MetadataFilepath, 
	true
);
XS__metadataDB _aux_db_metadata = _aux_root_metadata.MetadataDBCollection[0];
XS__metadataExtended _aux_ex_metadata = _aux_root_metadata.MetadataExtendedCollection[0];
XS__metadataBusiness _aux_business_metadata = _aux_root_metadata.MetadataBusinessCollection[0];

OGen.NTier.lib.metadata.metadataBusiness.XS_classType _aux_class
	= _aux_business_metadata.Classes.ClassCollection[
		_arg_ClassName
	];

XS_methodType _aux_method;
XS_parameterType _aux_parameter;
#endregion
//-----------------------------------------------------------------------------------------
if (_aux_ex_metadata.CopyrightText != string.Empty) {
	if (_aux_ex_metadata.CopyrightTextLong == string.Empty) {
%>#region <%=_aux_ex_metadata.CopyrightText%>
#endregion
<%
	} else {
%>#region <%=_aux_ex_metadata.CopyrightText%>
/*

<%=_aux_ex_metadata.CopyrightTextLong%>

*/
#endregion
<%
	}
}%>using System;
using System.Runtime.Remoting;

using <%=_aux_ex_metadata.ApplicationNamespace%>.lib.datalayer.shared.structures;
using <%=_aux_ex_metadata.ApplicationNamespace%>.lib.businesslayer;
using <%=_aux_ex_metadata.ApplicationNamespace%>.lib.businesslayer.shared;
using <%=_aux_ex_metadata.ApplicationNamespace%>.lib.businesslayer.shared.structures;

namespace <%=_aux_ex_metadata.ApplicationNamespace%>.lib.distributedlayer.remoting.client {
	/// <summary>
	/// <%=_aux_class.Name%> remoting client.
	/// </summary>
	public class RC_<%=_aux_class.Name%> : 
		IBO_<%=_aux_class.Name%> 
	{
		static RC_<%=_aux_class.Name%>() {
			ReConfig();
		}

		#region private Fields...
		private static IBO_<%=_aux_class.Name%> bo_;
		#endregion
		#region public static void ReConfig();
		public static void ReConfig() {
			bo_ = (IBO_<%=_aux_class.Name%>)RemotingServices.Connect(
				typeof(IBO_<%=_aux_class.Name%>),
				string.Format(
					"{0}:{1}/<%=_aux_ex_metadata.ApplicationNamespace%>.distributedlayer.remoting.server.RS_<%=_aux_class.Name%>.remoting",
					#if NET_1_1
					System.Configuration.ConfigurationSettings.AppSettings["RemotingServer_ServerURI"], 
					System.Configuration.ConfigurationSettings.AppSettings["RemotingServer_ServerPort"]
					#else
					System.Configuration.ConfigurationManager.AppSettings["RemotingServer_ServerURI"], 
					System.Configuration.ConfigurationManager.AppSettings["RemotingServer_ServerPort"]
					#endif
				)
			);
		}
		#endregion
<%
		for (int m = 0; m < _aux_class.Methods.MethodCollection.Count; m++) {
			_aux_method = _aux_class.Methods.MethodCollection[m];%>
		#region public <%=_aux_method.OutputType%> <%=_aux_method.Name%>(...);
		public <%=_aux_method.OutputType%> <%=_aux_method.Name%>(<%
			for (int p = 0; p < _aux_method.Parameters.ParameterCollection.Count; p++) {
				_aux_parameter = _aux_method.Parameters.ParameterCollection[p];%><%=""%>
			<%=_aux_parameter.isOut ? "out " : ""%><%=_aux_parameter.isRef ? "ref " : ""%><%=_aux_parameter.isParams ? "params " : ""%><%=_aux_parameter.Type%><%=_aux_parameter.isParams ? "[]" : ""%> <%=_aux_parameter.Name%><%=(p == _aux_method.Parameters.ParameterCollection.Count - 1) ? "" : ", "%><%
			}%>
		) {
			<%=(_aux_method.OutputType == "void") ? "" : "return "%>bo_.<%=_aux_method.Name%>(<%
				for (int p = 0; p < _aux_method.Parameters.ParameterCollection.Count; p++) {
					_aux_parameter = _aux_method.Parameters.ParameterCollection[p];%><%=""%>
				<%=_aux_parameter.isOut ? "out " : ""%><%=_aux_parameter.isRef ? "ref " : ""%><%=_aux_parameter.isParams ? "params " : ""%><%=_aux_parameter.Name%><%=(p == _aux_method.Parameters.ParameterCollection.Count - 1) ? "" : ", "%><%
				}%>
			);
		}
		#endregion<%
		}%>
	}
}<%
//-----------------------------------------------------------------------------------------
%>