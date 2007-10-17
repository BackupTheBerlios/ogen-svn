<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%//@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.XSD.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_SchemaFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaFilepath"]);
string _arg_Schema2Filepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["Schema2Filepath"]);
#endregion

#region varaux...
RootMetadata _aux_rootmetadata = RootMetadata.Load_fromFile(
	_arg_MetadataFilepath,
	true,
	_arg_SchemaFilepath,
	_arg_Schema2Filepath
);

string XS0_ = _aux_rootmetadata.ExtendedMetadata.PrefixGenerated;
string XS_ = _aux_rootmetadata.ExtendedMetadata.Prefix;
string XS0__ = _aux_rootmetadata.ExtendedMetadata.PrefixBaseGenerated;
string XS__ = _aux_rootmetadata.ExtendedMetadata.PrefixBase;
#endregion
//-----------------------------------------------------------------------------------------
if ((_aux_rootmetadata.ExtendedMetadata.CopyrightText != string.Empty) && (_aux_rootmetadata.ExtendedMetadata.CopyrightTextLong != string.Empty)) {
%>#region <%=_aux_rootmetadata.ExtendedMetadata.CopyrightText%>
/*

<%=_aux_rootmetadata.ExtendedMetadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;
using System.Xml.Serialization;

using OGen.lib.collections;<%
for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
using <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_rootmetadata.SchemaCollection[s].Element.Name%>;<%
}%>

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%> {
	public class <%=XS__%>RootMetadata : <%=XS0__%>RootMetadata {
		public <%=XS__%>RootMetadata (<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
			string[] <%=_aux_rootmetadata.SchemaCollection[s].Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.SchemaCollection.Count - 1) ? "" : ", "%><%
		}%>
		) : base (<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%><%=""%>
			<%=_aux_rootmetadata.SchemaCollection[s].Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.SchemaCollection.Count - 1) ? "" : ", "%><%
		}%>
		) {
		}
	}
}<%
//-----------------------------------------------------------------------------------------
%>
