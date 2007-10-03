#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion

using System;
using System.Xml.Serialization;

namespace OGen.XSD.lib.metadata {
	[XmlRoot("xs:schema")]
	public class XS_Schema {
		public XS_Schema() {
		}

		#region public string xmlNS_xs { get; set; }
		public string xmlns_xs_;

		[XmlElement("xmlns:xs")]
		public string xmlNS_xs {
			get {
				return xmlns_xs_;
			}
			set {
				xmlns_xs_ = value;
			}
		}
		#endregion
		#region public string TargetNamespace { get; set; }
		public string targetnamespace_;

		[XmlElement("targetNamespace")]
		public string targetNamespace {
			get {
				return targetnamespace_;
			}
			set {
				targetnamespace_ = value;
			}
		}
		#endregion
		#region public string xmlNS { get; set; }
		public string xmlns_;

		[XmlElement("xmlns")]
		public string xmlNS {
			get {
				return xmlns_;
			}
			set {
				xmlns_ = value;
			}
		}
		#endregion
		#region public string ElementFormDefault { get; set; }
		public string elementformdefault_;

		[XmlElement("elementFormDefault")]
		public string ElementFormDefault {
			get {
				return elementformdefault_;
			}
			set {
				elementformdefault_ = value;
			}
		}
		#endregion

		#region public XS_SimpleType[] XS_SimpleType { get; set; }
		private XS_SimpleType[] xs_simpletype_;

		[XmlElement("xs:simpleType")]
		public XS_SimpleType[] XS_SimpleType {
			get { return xs_simpletype_; }
			set { xs_simpletype_ = value; }
		}
		#endregion
		#region public XS_ComplexType[] XS_ComplexType { get; set; }
		private XS_ComplexType[] xs_complextype_;

		[XmlElement("xs:complexType")]
		public XS_ComplexType[] XS_ComplexType {
			get { return xs_complextype_; }
			set { xs_complextype_ = value; }
		}
		#endregion
		#region public XS_Element[] XS_Element { get; set; }
		private XS_Element[] xs_element_;

		[XmlElement("xs:element")]
		public XS_Element[] XS_Element {
			get { return xs_element_; }
			set { xs_element_ = value; }
		}
		#endregion
	}
}
