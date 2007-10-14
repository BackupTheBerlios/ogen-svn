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
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	//[XmlRoot("xs___schema")]
	[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.w3.org/2001/XMLSchema")]
	[System.Xml.Serialization.XmlRootAttribute("schema", Namespace="http://www.w3.org/2001/XMLSchema", IsNullable=false)]
	public class XS_Schema : iClaSSe_metadata, OGenRootrefCollectionInterface<RootMetadata> {
		//public XS_Schema() {
		//}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;

				if (xs_element__ != null) xs_element__.root_ref = value;
				xs_simpletype_.root_ref = value;
				xs_complextype_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		public const string SCHEMA = "schema";
		public const string ROOT_SCHEMA = "ROOT:" + XS_Schema.SCHEMA;

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
		private OGenRootrefCollection<XS_SimpleType, RootMetadata> xs_simpletype_
			= new OGenRootrefCollection<XS_SimpleType, RootMetadata>();

		[XmlElement("simpleType")]
		//[XmlArray("simpleType")]
		//[XmlArrayItem(typeof(XS_SimpleType))]
		public XS_SimpleType[] xs_simpletype__xml {
			get { return xs_simpletype_.cols__; }
			set { xs_simpletype_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<XS_SimpleType, RootMetadata> XS_SimpleType {
			get { return xs_simpletype_; }
		}
		#endregion
		#region public xs__collection<XS_ComplexType> XS_ComplexType { get; }
		private OGenRootrefCollection<XS_ComplexType, RootMetadata> xs_complextype_
			= new OGenRootrefCollection<XS_ComplexType, RootMetadata>();

		[XmlElement("complexType")]
		//[XmlArray("complexType")]
		//[XmlArrayItem("complexType", typeof(XS_ComplexType))]
		//[XmlArrayItem("complexType")]
		public XS_ComplexType[] XS_ComplexType__xml {
			get { return xs_complextype_.cols__; }
			set { xs_complextype_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<XS_ComplexType, RootMetadata> XS_ComplexType {
			get { return xs_complextype_; }
		}
		#endregion

		#region public XS_Element XS_Element { get; set; }
		private XS_Element xs_element__;

		[XmlIgnore()]
		public XS_Element XS_Element {
			get {
				if (xs_element__ == null) {
					xs_element__ = new XS_Element();
				}
				return xs_element__;
			}
			set {
				xs_element__ = value;
			}
		}

		[XmlElement("element")]
		public XS_Element xs_element__xml {
			get { return xs_element__; }
			set { xs_element__ = value; }
		}
		#endregion

		#region public static XS_Schema Load_fromFile(...);
		public static XS_Schema Load_fromFile(
			string filePath_in
		) {
			return Load_fromFile(
				filePath_in,
				null
			);
		}
		public static XS_Schema Load_fromFile(
			string filePath_in,
			RootMetadata root_ref_in
		) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);
			XS_Schema _output = (XS_Schema)new XmlSerializer(typeof(XS_Schema)).Deserialize(
				_stream
			);
			if (root_ref_in != null) _output.root_ref = root_ref_in;
			return _output;
		}
		#endregion
		#region public void SaveState_toFile(string filePath_in);
		public void SaveState_toFile(string filePath_in) {
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

		public string Read_fromRoot(string what_in) {
			return utils.ReflectThrough(
				this,
				ROOT_SCHEMA, 
				null, 
				what_in,
				ROOT_SCHEMA, 
				true, 
				true
			);
		}

		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			utils.ReflectThrough(
				this,
				ROOT_SCHEMA, 
				iteration_found_in, 
				iteration_in,
				ROOT_SCHEMA, 
				false, 
				true
			);
		}
	}
}
