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
using System.IO;
using System.Xml.Serialization;

namespace OGen.XSD.lib.metadata {
	//[XmlRoot("xs___schema")]
	[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.w3.org/2001/XMLSchema")]
	[System.Xml.Serialization.XmlRootAttribute("schema", Namespace="http://www.w3.org/2001/XMLSchema", IsNullable=false)]
	public class XS_Schema {
		public XS_Schema() {
		}

		#region //public string xmlNS_xs { get; set; }
//		private string xmlns_xs_;
//
//		//[System.Xml.Serialization.XmlElementAttribute("xmlns")]
//		//[XmlElement("xmlns:xs")]
//		[XmlAttribute("xmlns")]
//		//[XmlAttribute(
//		//	AttributeName="xs", 
//		//	//Namespace="http://www.w3.org/2001/XMLSchema-instance"
//		//	Namespace="xs"
//		//)]
//		public string xmlNS_xs {
//			get {
//				return xmlns_xs_;
//			}
//			set {
//				xmlns_xs_ = value;
//			}
//		}
		#endregion
		#region public string TargetNamespace { get; set; }
		private string targetnamespace_;

		//[XmlElement("targetNamespace")]
		[XmlAttribute("targetNamespace")]
		public string TargetNamespace {
			get {
				return targetnamespace_;
			}
			set {
				targetnamespace_ = value;
			}
		}
		#endregion
		#region public string xmlNS { get; set; }
		private string xmlns_;

		//[XmlElement("xmlns")]
		[XmlAttribute("xmlns")]
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
		private string elementformdefault_;

		//[XmlElement("elementFormDefault")]
		[XmlAttribute("elementFormDefault")]
		public string ElementFormDefault {
			get {
				return elementformdefault_;
			}
			set {
				elementformdefault_ = value;
			}
		}
		#endregion

		#region public xs__collection<XS_SimpleType> XS_SimpleType { get; }
		private xs__collection<XS_SimpleType> xs_simpletype_ 
			= new xs__collection<XS_SimpleType>();

		[XmlElement("simpleType")]
		//[XmlArray("simpleType")]
		//[XmlArrayItem(typeof(XS_SimpleType))]
		public XS_SimpleType[] xs_simpletype__xml {
			get { return xs_simpletype_.cols__; }
			set { xs_simpletype_.cols__ = value; }
		}

		public xs__collection<XS_SimpleType> XS_SimpleType {
			get { return xs_simpletype_; }
		}
		#endregion
		#region public xs__collection<XS_ComplexType> XS_ComplexType { get; }
		private xs__collection<XS_ComplexType> xs_complextype_ 
			= new xs__collection<XS_ComplexType>();

		[XmlElement("complexType")]
		//[XmlArray("complexType")]
		//[XmlArrayItem(typeof(XS_ComplexType))]
		public XS_ComplexType[] XS_ComplexType__xml {
			get { return xs_complextype_.cols__; }
			set { xs_complextype_.cols__ = value; }
		}

		public xs__collection<XS_ComplexType> XS_ComplexType {
			get { return xs_complextype_; }
		}
		#endregion

		#region public XS_Element XS_Element { get; set; }
		private XS_Element xs_element_;

		[XmlElement("element")]
		public XS_Element XS_Element {
			get { return xs_element_; }
			set { xs_element_ = value; }
		}
		#endregion

		#region public static XS_Schema Load(string filePath_in);
		public static XS_Schema Load(string filePath_in) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);
			return (XS_Schema)new XmlSerializer(typeof(XS_Schema)).Deserialize(
				_stream
			);
		}
		#endregion
		#region public void Save(string filePath_in);
		public void Save(string filePath_in) {
			FileStream _file = new FileStream(
				filePath_in,
				FileMode.Create,
				FileAccess.Write,
				FileShare.ReadWrite
			);
			new XmlSerializer(typeof(XS_Schema)).Serialize(
				_file,
				this
			);
			_file.Flush();
			_file.Close();
		}
		#endregion
	}
}
