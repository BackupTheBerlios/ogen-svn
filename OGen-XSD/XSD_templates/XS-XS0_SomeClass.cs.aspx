<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/plain" %>
<%//@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.XSD.lib.metadata" %>
<%@ import namespace="OGen.lib.collections" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_SchemaFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaFilepath"]);
string _arg_Schema2Filepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["Schema2Filepath"]);
string _arg_SchemaName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaName"]);
string _arg_ComplexTypeName = System.Web.HttpUtility.UrlDecode(Request.QueryString["ComplexTypeName"]);
#endregion

#region varaux...
RootMetadata _aux_rootmetadata = RootMetadata.Load_fromFile(
	_arg_MetadataFilepath,
	true,
	_arg_SchemaFilepath,
	_arg_Schema2Filepath
);
XS_Schema _aux_schema = _aux_rootmetadata.SchemaCollection[_arg_SchemaName];

XS_ComplexType _aux_complextype = _aux_schema.XS_ComplexType[_arg_ComplexTypeName];
OGenCollection<XS_Element> _aux_elements = _aux_complextype.XS_Sequence.XS_Element;

string _aux_complextype_collectionname = _aux_complextype.isCollection_nameIt(_arg_SchemaName);

string __isCollection_nameIt = string.Empty;
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

using OGen.lib.collections;

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_schema.XS_Element.Name%> {
	public class <%=_aux_rootmetadata.ExtendedMetadata.PrefixGenerated%><%=_aux_complextype.Name%> : OGenRootrefCollectionInterface<<%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata> <%=(_aux_complextype_collectionname != string.Empty) ? ", OGenCollectionInterface" : ""%> {
		public <%=_aux_rootmetadata.ExtendedMetadata.PrefixGenerated%><%=_aux_complextype.Name%> (
		) {<%
			for (int e = 0; e < _aux_elements.Count; e++) {
				if (_aux_elements[e].MaxOccurs == XS_Element.MaxOccursEnum.unbounded) {
					__isCollection_nameIt = _aux_elements[e].isCollection_nameIt();%>
			<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_ 
				= new <%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>, <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata>();<%
				}
			}%>
		}<%
		if (_aux_complextype_collectionname != string.Empty) { %>
		public <%=_aux_rootmetadata.ExtendedMetadata.PrefixGenerated%><%=_aux_complextype.Name%> (
			string <%=_aux_complextype_collectionname.ToLower()%>_in
		) : this (
		) {
			<%=_aux_complextype_collectionname.ToLower()%>_ = <%=_aux_complextype_collectionname.ToLower()%>_in;
		}
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_complextype_collectionname)%>;
			}
		}
		#endregion<%
		}%>

		#region public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata root_ref { get; }
		private <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata root_ref_;

		[XmlIgnore()]
		public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata root_ref {
			set {
				root_ref_ = value;<%

				for (int e = 0; e < _aux_elements.Count; e++) {
					if (_aux_elements[e].MaxOccurs == XS_Element.MaxOccursEnum.unbounded) {%>
				<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_.root_ref = value;<%

					} else {%>
				if (<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__ != null) <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__.root_ref = value;<%
					}
				}%>
			}
			get { return root_ref_; }
		}
		#endregion<%

		for (int a = 0; a < _aux_complextype.XS_Attribute.Count; a++) {%>
		#region public <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_complextype.XS_Attribute[a].Name)%> { get; set; }
		private <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_complextype.XS_Attribute[a].Name.ToLower()%>_;

		[XmlAttribute("<%=_aux_complextype.XS_Attribute[a].Name%>")]
		public <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_complextype.XS_Attribute[a].Name)%> {
			get {
				return <%=_aux_complextype.XS_Attribute[a].Name.ToLower()%>_;
			}
			set {
				<%=_aux_complextype.XS_Attribute[a].Name.ToLower()%>_ = value;
			}
		}
		#endregion<%
		}%>

<%
		for (int e = 0; e < _aux_elements.Count; e++) {
			if (_aux_elements[e].MaxOccurs == XS_Element.MaxOccursEnum.unbounded) {%>
		#region public <%=((__isCollection_nameIt = _aux_elements[e].isCollection_nameIt()) != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>, <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> { get; }
		private <%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>, <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata> <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_;
			//= new <%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>, <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata>();

		[XmlElement("<%=_aux_elements[e].Name%>")]
		public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>[] <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_.cols__; }
			set { <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_.cols__ = value; }
		}

		[XmlIgnore()]
		public <%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>, <%=_aux_rootmetadata.ExtendedMetadata.Prefix%>_RootMetadata> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> {
			get { return <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>_; }
		}
		#endregion<%

			} else {%>
		#region public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> { get; set; }
		private <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__;

		[XmlIgnore()]
		public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> {
			get {
				if (<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__ == null) {
					<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__ = new <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%>();
				}
				return <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__;
			}
			set {
				<%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__ = value;
			}
		}

		[XmlElement("<%=_aux_elements[e].Name.ToLower()%>")]
		public <%=_aux_rootmetadata.ExtendedMetadata.Prefix%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__; }
			set { <%=_aux_rootmetadata.ExtendedMetadata.Prefix.ToLower()%><%=_aux_elements[e].Name.ToLower()%>__ = value; }
		}
		#endregion<%
			}
		}%>
	}
}<%
//-----------------------------------------------------------------------------------------
%>
