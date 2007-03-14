<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
cDBMetadata _aux_metadata;
if (cDBMetadata.Metacache.Contains(_arg_MetadataFilepath)) {
	_aux_metadata = (cDBMetadata)cDBMetadata.Metacache[_arg_MetadataFilepath];
} else {
	_aux_metadata = new cDBMetadata();
	_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
	cDBMetadata.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
}
cDBMetadata_Table _aux_table = _aux_metadata.Tables[_arg_TableName];

cDBMetadata_Table_Field _aux_field;
#endregion
//-----------------------------------------------------------------------------------------
if ((_aux_metadata.CopyrightText != string.Empty) && (_aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%=_aux_metadata.CopyrightText%>
/*

<%=_aux_metadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;

using <%=_aux_metadata.Namespace%>.lib.datalayer;

namespace <%=_aux_metadata.Namespace%>.lib.businesslayer {
	/// <summary>
	/// <%=_aux_table.Name%> BusinessObject which provides access to <see cref="<%=_aux_metadata.Namespace%>.lib.datalayer.DO_<%=_aux_table.Name%>">DO_<%=_aux_table.Name%></see> for the Business Layer.
	/// </summary>
	public sealed 
#if NET20
		partial 
#endif
		class BO_<%=_aux_table.Name%> 
#if !NET20
			: BO0_<%=_aux_table.Name%> 
#endif
	{
		#region public BO_<%=_aux_table.Name%>(...);
		///
		public BO_<%=_aux_table.Name%>() {
		}
		#endregion

		#region private Properties...
		#endregion
		#region public Properties...
		#endregion

		#region private Methods...
		#endregion
		#region public Methods...
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>