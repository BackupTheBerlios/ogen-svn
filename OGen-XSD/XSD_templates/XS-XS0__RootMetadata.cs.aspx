<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%//@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.XSD.lib.metadata" %>
<%@ import namespace="OGen.lib.collections" %><%
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
using System.Collections;

using OGen.lib.collections;<%
for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%>
using <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>;<%
}%>

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%> {
	public class XS0__RootMetadata : iClaSSe_metadata {
		public XS0__RootMetadata(<%
		for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%>
			string <%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.Schemas.Count - 1) ? "" : ", " %><%
		}%>
		) {<%
		for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%><%=""%>
			<%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToLower()%>_ = XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>.Load_fromFile(
				<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>Filepath_in,
				(XS__RootMetadata)this
			);<%
		}%>
		}

		#region public static Hashtable Metacache { get; }
		private static Hashtable metacache__;

		public static Hashtable Metacache {
			get {
				if (metacache__ == null) {
					metacache__ = new Hashtable();
				}
				return metacache__;
			}
		}
		#endregion
		#region public static XS__RootMetadata Load_fromFile(...);
		public static XS__RootMetadata Load_fromFile(<%
		for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%>
			string <%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>Filepath_in, <%
		}%>
			bool useMetacache_in
		) {
			#region string _key = ...;
			string _key = null;
			if (useMetacache_in) {<%
			for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%>
				_key <%=(s == 0) ? "" : "+"%>= <%=(s == 0) ? "" : "\"|\" + "%><%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>Filepath_in;<%
			}%>
			}
			#endregion
			if (
				useMetacache_in
				&&
				(metacache__ != null)
				&&
				Metacache.Contains(_key)
			) {
				return (XS__RootMetadata)XS__RootMetadata.Metacache[_key];
			} else {
				XS__RootMetadata _rootmetadata = new XS__RootMetadata(<%
				for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%><%=""%>
					<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.Schemas.Count - 1) ? "" : ", "%><%
				}%>
				);
				if (useMetacache_in) {
					XS__RootMetadata.Metacache.Add(
						_key, 
						_rootmetadata
					);
				}
				return _rootmetadata;
			}
		}
		#endregion

<%
		for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%>
		#region public XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.Schemas[s].XS_Element.Name)%> { get; }
		private XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%> <%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToLower()%>_;

		public XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.Schemas[s].XS_Element.Name)%> {
			get { return <%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToLower()%>_; }
		}
		#endregion<%
		}%>

		#region private iClaSSe_metadata getMetadataFor(string forString_in);
		private iClaSSe_metadata getMetadataFor(string forString_in) {<%
			for (int s = 0; s < _aux_rootmetadata.Schemas.Count; s++) {%><%=""%>
			<%=(s == 0) ? "" : " else "%>if (
				forString_in.Substring(0, XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>.ROOT_<%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToUpper()%>.Length)
					== XS__<%=_aux_rootmetadata.Schemas[s].XS_Element.Name%>.ROOT_<%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToUpper()%>
			) {
				return <%=_aux_rootmetadata.Schemas[s].XS_Element.Name.ToLower()%>_;
			}<%
			}%> else {
				throw new Exception(string.Format(
					"can't handle: {0}",
					forString_in
				));
			}
		}
		#endregion

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			return getMetadataFor(what_in).Read_fromRoot(what_in);
		}
		#endregion
		#region public void IterateThrough_fromRoot(...);
		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			getMetadataFor(iteration_in).IterateThrough_fromRoot(
				iteration_in,
				iteration_found_in
			);
		}
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>