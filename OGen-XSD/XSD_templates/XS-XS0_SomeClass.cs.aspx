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
bool _aux_isstandardntype;
string _aux_ntype;

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

using OGen.lib.collections;

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_schema.XS_Element.Name%> {
#if NET_1_1
	#region public class <%=XS_%><%=_aux_complextype.Name%>Collection { ... }
	public class <%=XS_%><%=_aux_complextype.Name%>Collection {
		public <%=XS_%><%=_aux_complextype.Name%>Collection() {
			cols_ = new ArrayList();
		}

		#region public <%=XS__%>RootMetadata root_ref { get; }
		private <%=XS__%>RootMetadata root_ref_;

		public <%=XS__%>RootMetadata root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((<%=XS_%><%=_aux_complextype.Name%>)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal <%=XS_%><%=_aux_complextype.Name%>[] cols__ { get; set; }
		private ArrayList cols_;

		internal <%=XS_%><%=_aux_complextype.Name%>[] cols__ {
			get {
				<%=XS_%><%=_aux_complextype.Name%>[] _output = new <%=XS_%><%=_aux_complextype.Name%>[cols_.Count];
				cols_.CopyTo(_output);
				return _output;
			}
			set {
				cols_.Clear();
				if (value != null) {
					for (int i = 0; i < value.Length; i++) {
						cols_.Add(value[i]);
					}
				}
			}
		}
		#endregion

		#region public int Count { get; }
		public int Count {
			get {
				return cols_.Count;
			}
		}
		#endregion

		#region public <%=XS_%><%=_aux_complextype.Name%> this[int index_in] { get; }
		public <%=XS_%><%=_aux_complextype.Name%> this[int index_in] {
			get {
				return (<%=XS_%><%=_aux_complextype.Name%>)cols_[index_in];
			}
		}
		#endregion<%
		if (_aux_complextype_collectionname != string.Empty) {%>
		#region public <%=XS_%><%=_aux_complextype.Name%> this[string value_in] { get; }
		public <%=XS_%><%=_aux_complextype.Name%> this[string <%=_aux_complextype_collectionname%>_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((<%=XS_%><%=_aux_complextype.Name%>)cols_[i]).<%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_complextype_collectionname)%> == <%=_aux_complextype_collectionname%>_in) {
						return (<%=XS_%><%=_aux_complextype.Name%>)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion<%
		}%>

		#region public int Add(params <%=XS_%><%=_aux_complextype.Name%>[] col_in);
		public int Add(params <%=XS_%><%=_aux_complextype.Name%>[] col_in) {
			int _output = -1;

			for (int i = 0; i < col_in.Length; i++) {
				_output = cols_.Add(col_in[i]);
			}

			return _output;
		}
		#endregion
	}
	#endregion
#endif

	public class <%=XS0_%><%=_aux_complextype.Name%>
#if !NET_1_1
		: OGenRootrefCollectionInterface<<%=XS__%>RootMetadata> <%=(_aux_complextype_collectionname != string.Empty) ? ", OGenCollectionInterface" : ""%>
#endif
	{
		public <%=XS0_%><%=_aux_complextype.Name%> (
		) {<%
			for (int e = 0; e < _aux_elements.Count; e++) {
				if (_aux_elements[e].MaxOccurs == XS_Element.MaxOccursEnum.unbounded) {
					__isCollection_nameIt = _aux_elements[e].isCollection_nameIt();%><%=""%>
			<%=_aux_elements[e].Name.ToLower()%>collection_ = new 
#if !NET_1_1
				<%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=XS_%><%=_aux_elements[e].Type%>, <%=XS__%>RootMetadata>()
#else
				<%=XS_%><%=_aux_elements[e].Type%>Collection()
#endif
			;<%
				}
			}%>
		}<%
		if (_aux_complextype_collectionname != string.Empty) {%>
		public <%=XS0_%><%=_aux_complextype.Name%> (
			string <%=_aux_complextype_collectionname.ToLower()%>_in
		) : this (
		) {
			<%=_aux_complextype_collectionname.ToLower()%>_ = <%=_aux_complextype_collectionname.ToLower()%>_in;
		}

#if !NET_1_1
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_complextype_collectionname)%>;
			}
		}
		#endregion
#endif<%
		}%>

		#region public <%=XS__%>RootMetadata root_ref { get; }
		private <%=XS__%>RootMetadata root_ref_;

		[XmlIgnore()]
		public <%=XS__%>RootMetadata root_ref {
			set {
				root_ref_ = value;<%

				for (int e = 0; e < _aux_elements.Count; e++) {
					if (_aux_elements[e].MaxOccurs == XS_Element.MaxOccursEnum.unbounded) {%><%=""%>
				<%=_aux_elements[e].Name.ToLower()%>collection_.root_ref = value;<%

					} else {
						_aux_ntype = OGen.XSD.lib.metadata.utils.Convert_NType(
							_aux_rootmetadata,
							_aux_elements[e].Type,
							out _aux_isstandardntype
						);
						if (!_aux_isstandardntype) {%>
				if (<%=_aux_elements[e].Name.ToLower()%>__ != null) <%=_aux_elements[e].Name.ToLower()%>__.root_ref = value;<%
						}
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
		#region public <%=((__isCollection_nameIt = _aux_elements[e].isCollection_nameIt()) != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=XS_%><%=_aux_elements[e].Type%>, <%=XS__%>RootMetadata> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> { get; }
		private 
#if !NET_1_1
			<%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=XS_%><%=_aux_elements[e].Type%>, <%=XS__%>RootMetadata>
#else
			<%=XS_%><%=_aux_elements[e].Type%>Collection
#endif
			<%=_aux_elements[e].Name.ToLower()%>collection_;

		[XmlElement("<%=_aux_elements[e].Name%>")]
		public <%=XS_%><%=_aux_elements[e].Type%>[] <%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return <%=_aux_elements[e].Name.ToLower()%>collection_.cols__; }
			set { <%=_aux_elements[e].Name.ToLower()%>collection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			<%=(__isCollection_nameIt != string.Empty) ? "OGenRootrefCollection" : "OGenRootrefSimpleCollection"%><<%=XS_%><%=_aux_elements[e].Type%>, <%=XS__%>RootMetadata> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%>
#else
			<%=XS_%><%=_aux_elements[e].Type%>Collection
#endif
		<%=XS_%><%=_aux_elements[e].Type%>Collection
		{
			get { return <%=_aux_elements[e].Name.ToLower()%>collection_; }
		}
		#endregion<%

		//////////////////////////////////////////////////////////////

			} else {
				_aux_ntype = OGen.XSD.lib.metadata.utils.Convert_NType(
					_aux_rootmetadata,
					_aux_elements[e].Type,
					out _aux_isstandardntype
				);
				if (_aux_isstandardntype) {%>
		#region public <%=_aux_ntype%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> { get; set; }
		private <%=_aux_ntype%> <%=_aux_elements[e].Name.ToLower()%>_;

		[XmlElement("<%=_aux_elements[e].Name%>")]
		public <%=_aux_ntype%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> {
			get { return <%=_aux_elements[e].Name.ToLower()%>_; }
			set { <%=_aux_elements[e].Name.ToLower()%>_ = value; }
		}
		#endregion<%

		//////////////////////////////////////////////////////////////

				} else {%>
		#region public <%=XS_%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> { get; set; }
		private <%=XS_%><%=_aux_elements[e].Type%> <%=_aux_elements[e].Name.ToLower()%>__;

		[XmlIgnore()]
		public <%=XS_%><%=_aux_elements[e].Type%> <%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_elements[e].Name)%> {
			get {
				if (<%=_aux_elements[e].Name.ToLower()%>__ == null) {
					<%=_aux_elements[e].Name.ToLower()%>__ = new <%=XS_%><%=_aux_elements[e].Type%>();
				}
				return <%=_aux_elements[e].Name.ToLower()%>__;
			}
			set {
				<%=_aux_elements[e].Name.ToLower()%>__ = value;
			}
		}

		[XmlElement("<%=_aux_elements[e].Name%>")]
		public <%=XS_%><%=_aux_elements[e].Type%> <%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return <%=_aux_elements[e].Name.ToLower()%>__; }
			set { <%=_aux_elements[e].Name.ToLower()%>__ = value; }
		}
		#endregion<%
				}
			}
		}%>
	}
}<%
//-----------------------------------------------------------------------------------------
%>
