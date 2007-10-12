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
string _arg_SchemaFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaFilepath"]);
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_ComplexTypeName = System.Web.HttpUtility.UrlDecode(Request.QueryString["ComplexTypeName"]);
#endregion

#region varaux...
XS_Schema _aux_schema;
if (XS_Schema.Metacache.Contains(_arg_SchemaFilepath)) {
	_aux_schema = (XS_Schema)XS_Schema.Metacache[_arg_SchemaFilepath];
} else {
	_aux_schema = XS_Schema.Load_fromFile(_arg_SchemaFilepath);
	XS_Schema.Metacache.Add(_arg_SchemaFilepath, _aux_schema);
}

ExtendedMetadata _aux_metadata;
if (ExtendedMetadata.Metacache.Contains(_arg_MetadataFilepath)) {
	_aux_metadata = (ExtendedMetadata)ExtendedMetadata.Metacache[_arg_MetadataFilepath];
} else {
	_aux_metadata = ExtendedMetadata.Load_fromFile(_arg_MetadataFilepath);
	ExtendedMetadata.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
}

XS_ComplexType _aux_complextype = _aux_schema.XS_ComplexType[_arg_ComplexTypeName];
OGenCollection<XS_Element> _aux_elements = _aux_complextype.XS_Sequence.XS_Element;
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
using System.Data;
using System.Xml.Serialization;

namespace <%=_aux_metadata.Namespace%> {
	public class XS0_<%=_aux_complextype.Name%> {<%

	for (int a = 0; a < _aux_complextype.XS_Attribute.Count; a++) {%>
		#region public <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_complextype.XS_Attribute[a].Name%> { get; set; }
		private <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_complextype.XS_Attribute[a].Name.ToLower()%>_;

		[XmlAttribute("<%=_aux_complextype.XS_Attribute[a].Name%>")]
		public <%=_aux_complextype.XS_Attribute[a].NType%> <%=_aux_complextype.XS_Attribute[a].Name%> {
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
		if (_aux_elements[e].MaxOccurs == XS_Element.MAXOCCURSENUM_UNBOUNDED) {%>
		#region public xs__collection<XS_<%=_aux_elements[e].Name%>> XS_<%=_aux_elements[e].Name%> { get; }
		private OGenCollection<XS_<%=_aux_elements[e].Name%>> xs_<%=_aux_elements[e].Name.ToLower()%>_ 
			= new OGenCollection<XS_<%=_aux_elements[e].Name%>>();

		[XmlElement("<%=_aux_elements[e].Name%>")]
		public XS_<%=_aux_elements[e].Name%>[] xs_<%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return xs_<%=_aux_elements[e].Name.ToLower()%>_.cols__; }
			set { xs_<%=_aux_elements[e].Name.ToLower()%>_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_<%=_aux_elements[e].Name%>> XS_<%=_aux_elements[e].Name%> {
			get { return xs_<%=_aux_elements[e].Name.ToLower()%>_; }
		}
		#endregion<%

		} else {%>
		#region public XS_<%=_aux_elements[e].Name%> XS_<%=_aux_elements[e].Name%> { get; set; }
		private XS_<%=_aux_elements[e].Name%> xs_<%=_aux_elements[e].Name.ToLower()%>__;

		[XmlIgnore()]
		public XS_<%=_aux_elements[e].Name%> XS_<%=_aux_elements[e].Name%> {
			get {
				if (xs_<%=_aux_elements[e].Name.ToLower()%>__ == null) {
					xs_<%=_aux_elements[e].Name.ToLower()%>__ = new XS_<%=_aux_elements[e].Name%>();
				}
				return xs_<%=_aux_elements[e].Name.ToLower()%>__;
			}
			set {
				xs_<%=_aux_elements[e].Name.ToLower()%>__ = value;
			}
		}

		[XmlElement("<%=_aux_elements[e].Name.ToLower()%>")]
		public XS_<%=_aux_elements[e].Name%> xs_<%=_aux_elements[e].Name.ToLower()%>__xml {
			get { return xs_<%=_aux_elements[e].Name.ToLower()%>__; }
			set { xs_<%=_aux_elements[e].Name.ToLower()%>__ = value; }
		}
		#endregion<%
		}
	}%>

	}
}<%
//-----------------------------------------------------------------------------------------
%>
