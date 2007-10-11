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
string _arg_ComplexTypeName = System.Web.HttpUtility.UrlDecode(Request.QueryString["ComplexTypeName"]);
#endregion

#region varaux...
XS_Schema _aux_metadata;
//if (XS_Schema.Metacache.Contains(_arg_MetadataFilepath)) {
//	_aux_metadata = (XS_Schema)XS_Schema.Metacache[_arg_MetadataFilepath];
//} else {
//	_aux_metadata = new XS_Schema();
//	_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
//	XS_Schema.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
_aux_metadata = XS_Schema.Load(_arg_MetadataFilepath);
//}

XS_ComplexType _aux_complextype = _aux_metadata.XS_ComplexType[_arg_ComplexTypeName];
#endregion
//-----------------------------------------------------------------------------------------
if (true) { // (_aux_metadata.CopyrightText != string.Empty) && (_aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%="_aux_metadata.CopyrightText"%>
/*

<%="_aux_metadata.CopyrightTextLong"%>

*/
#endregion
<%
}%>using System;
using System.Data;
using System.Xml.Serialization;


namespace <%="_aux_metadata.Namespace"%>.lib.datalayer {
	public class XS0_<%=_aux_complextype.Name%> {

	<%for (int a = 0; a < _aux_complextype.XS_Attribute.Count; a++) {
		%><%=_aux_complextype.XS_Attribute[a].Name%>
	<%
	}%>

	}
}


<%
//-----------------------------------------------------------------------------------------
%>
