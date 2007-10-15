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
using System.Collections;

using OGen.lib.collections;<%
for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
using <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>;<%
}%>

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%> {
	public class <%=XS0__%>RootMetadata : iClaSSe_metadata {
		public <%=XS0__%>RootMetadata(<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
			string[] <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.SchemaCollection.Count - 1) ? "" : ", " %><%
		}%>
		) {<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%><%=""%>
			<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_ = new <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Collection(
				<%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>.Load_fromFile(
					(<%=XS__%>RootMetadata)this, 
					<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in
				)
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
		#region public static <%=XS__%>RootMetadata Load_fromFile(...);
		public static <%=XS__%>RootMetadata Load_fromFile(<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
			string[] <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in, <%
		}%>
			bool useMetacache_in
		) {
			#region string _key = ...;
			string _key = null;
			if (useMetacache_in) {<%
			for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
				for (int i = 0; i < <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in.Length; i++) {
					_key += string.Format(
						"{0}{1}", 
						(_key == null) ? "" : "|", 
						<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in[i]
					);
				}<%
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
				return (<%=XS__%>RootMetadata)<%=XS__%>RootMetadata.Metacache[_key];
			} else {
				<%=XS__%>RootMetadata _rootmetadata = new <%=XS__%>RootMetadata(<%
				for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%><%=""%>
					<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Filepath_in<%=(s == _aux_rootmetadata.SchemaCollection.Count - 1) ? "" : ", "%><%
				}%>
				);
				if (useMetacache_in) {
					<%=XS__%>RootMetadata.Metacache.Add(
						_key, 
						_rootmetadata
					);
				}
				return _rootmetadata;
			}
		}
		#endregion

<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
		#region public <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Collection <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.SchemaCollection[s].XS_Element.Name)%>Collection { get; }
		private <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Collection <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_;

		public <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>Collection <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.SchemaCollection[s].XS_Element.Name)%>Collection {
			get { return <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_; }
		}
		#endregion<%
		}%>

<%
		for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
		private const string ROOT_<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToUpper()%> = <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>.ROOT + "." + <%=XS__%><%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name%>.<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToUpper()%> + "[";<%
		}%>

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			string _begin;
			string _indexstring;
			string _end;

			<%for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {
			%><%=(s == 0) ? "" : " else "%>if (OGen.lib.generator.utils.rootExpression_TryParse(
				what_in, 
				ROOT_<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToUpper()%>, 
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				for (int i = 0; i < <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_.Count; i++) {
					if (
						what_in.Substring(0, <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_[i].Root_<%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.SchemaCollection[s].XS_Element.Name)%>.Length)
							== <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_[i].Root_<%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_rootmetadata.SchemaCollection[s].XS_Element.Name)%>
					) {
						return <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_[i].Read_fromRoot(string.Format(
							"{0}{1}{2}",
							_begin,
							i,
							_end
						));
					}
				}
			}<%
			}%>
			throw new Exception(string.Format(
				"\n---\n{0}.{1}.Read_fromRoot(string what_in): can't handle: {2}\n---",
				typeof(<%=XS0__%>RootMetadata).Namespace,
				typeof(<%=XS0__%>RootMetadata).Name,
				what_in
			));
		}
		#endregion
		#region public void IterateThrough_fromRoot(...);
		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			bool _didit = false;
			string _begin;
			string _indexstring;
			string _end;<%
			for (int s = 0; s < _aux_rootmetadata.SchemaCollection.Count; s++) {%>
			if (OGen.lib.generator.utils.rootExpression_TryParse(
				iteration_in,
				ROOT_<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToUpper()%>,
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				if (_indexstring == "n") {
					for (int i = 0; i < <%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_.Count; i++) {
						<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_[i].IterateThrough_fromRoot(
							string.Format(
								"{0}{1}{2}",
								_begin, 
								i,
								_end
							), 
							iteration_found_in
						);
					}
					_didit = true;
				} else {
					int _indexint = int.Parse(_indexstring);
					<%=_aux_rootmetadata.SchemaCollection[s].XS_Element.Name.ToLower()%>collection_[
						_indexint
					].IterateThrough_fromRoot(
						string.Format(
							"{0}{1}{2}",
							_begin,
							_indexint,
							_end
						),
						iteration_found_in
					);
					_didit = true;
				}
			}<%
			}%>
			if (!_didit) {
				throw new Exception(string.Format(
					"\n---\n{0}.{1}.IterateThrough_fromRoot(...): can't handle: {2}\n---",
					typeof(<%=XS0__%>RootMetadata).Namespace,
					typeof(<%=XS0__%>RootMetadata).Name,
					iteration_in
				));
			}
		}
		#endregion

	}
}<%
//-----------------------------------------------------------------------------------------
%>
