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

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	public class XS_ComplexType : OGenCollectionInterface {
		public XS_ComplexType() {
		}

		#region public string Name { get; set; }
		private string name_;

		//[XmlElement("name")]
		[XmlAttribute("name")]
		public string Name {
			get {
				return name_;
			}
			set {
				name_ = value;
			}
		}
		#endregion

		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get { return Name; }
		}
		#endregion

		#region public xs__collection<XS_Attribute> XS_Attribute { get; }
		private OGenCollection<XS_Attribute> xs_attribute_ 
			= new OGenCollection<XS_Attribute>();

		[XmlElement("attribute")]
		//[XmlArray("attribute")]
		//[XmlArrayItem(typeof(XS_Attribute))]
		public XS_Attribute[] xs_attribute__xml {
			get { return xs_attribute_.cols__; }
			set { xs_attribute_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_Attribute> XS_Attribute {
			get { return xs_attribute_; }
		}
		#endregion

		#region public XS_Sequence XS_Sequence { get; set; }
		private XS_Sequence xs_sequence__;

		[XmlIgnore()]
		public XS_Sequence XS_Sequence {
			get {
				if (xs_sequence__ == null) {
					xs_sequence__ = new XS_Sequence();
				}
				return xs_sequence__;
			}
			set {
				xs_sequence__ = value;
			}
		}

		[XmlElement("sequence")]
		public XS_Sequence xs_sequence__xml {
			get { return xs_sequence__; }
			set { xs_sequence__ = value; }
		}
		#endregion

		public string isCollection_nameIt(
			XS_Schema schema_in, 
			ExtendedMetadata metadata_in
		) {
			for (int c = 0; c < schema_in.XS_ComplexType.Count; c++) {
				for (int e = 0; e < schema_in.XS_ComplexType[c].XS_Sequence.XS_Element.Count; e++) {
					if (
						(schema_in.XS_ComplexType[c].XS_Sequence.XS_Element[e].Type == Name)
						&&
						(schema_in.XS_ComplexType[c].XS_Sequence.XS_Element[e].MaxOccurs 
							== XS_Element.MAXOCCURSENUM_UNBOUNDED)
					) {
						ExtendedMetadata_collection _collection 
							= metadata_in.Collections.Collection[
								Name
							];
						return (_collection == null) 
							? string.Empty 
							: _collection.Name;
					}
				}
			}

			return string.Empty;
		}
	}
}
