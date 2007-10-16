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
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
#if !NET20
	#region public class XS_ComplexTypeCollection { ... }
	public class XS_ComplexTypeCollection {
		public XS_ComplexTypeCollection () {
			cols_ = new ArrayList();
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		public RootMetadata root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((XS_ComplexType)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_ComplexType[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_ComplexType[] cols__ {
			get {
				XS_ComplexType[] _output = new XS_ComplexType[cols_.Count];
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

		#region public XS_ComplexType this[int index_in] { get; }
		public XS_ComplexType this[int index_in] {
			get {
				return (XS_ComplexType)cols_[index_in];
			}
		}
		#endregion
		#region public XS_ComplexType this[string name_in] { get; }
		public XS_ComplexType this[string name_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((XS_ComplexType)cols_[i]).Name == name_in) {
						return (XS_ComplexType)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_ComplexType[] col_in);
		public int Add(params XS_ComplexType[] col_in) {
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

	public class XS_ComplexType
#if NET20
		: OGenCollectionInterface, OGenRootrefCollectionInterface<RootMetadata>
#endif
	{
		public XS_ComplexType(
		) {
		}
		public XS_ComplexType(
			string name_in
		) : this (
		) {
			name_ = name_in;
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;

				if (xs_sequence__ != null) xs_sequence__.root_ref = value;
				xs_attributecollection_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
#if NET20
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get { return Name; }
		}
		#endregion
#endif

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

		#region public ... XS_Attribute { get; }
#if NET20
		private OGenRootrefCollection<XS_Attribute, RootMetadata> xs_attributecollection_
			= new OGenRootrefCollection<XS_Attribute, RootMetadata>();
#else
		private XS_AttributeCollection xs_attributecollection_
			= new XS_AttributeCollection();
#endif

		[XmlElement("attribute")]
		//[XmlArray("attribute")]
		//[XmlArrayItem(typeof(XS_Attribute))]
		public XS_Attribute[] xs_attribute__xml {
			get { return xs_attributecollection_.cols__; }
			set { xs_attributecollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if NET20
			OGenRootrefCollection<XS_Attribute, RootMetadata>
#else
			XS_AttributeCollection
#endif
		XS_Attribute {
			get { return xs_attributecollection_; }
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

		#region public string isCollection_nameIt(...);
		public string isCollection_nameIt(
			string schemaName_in
		) {
			XS_Schema _schema = root_ref_.SchemaCollection[schemaName_in];

			for (int c = 0; c < _schema.XS_ComplexType.Count; c++) {
				for (int e = 0; e < _schema.XS_ComplexType[c].XS_Sequence.XS_Element.Count; e++) {
					if (
						(_schema.XS_ComplexType[c].XS_Sequence.XS_Element[e].Type == Name)
						&&
						(_schema.XS_ComplexType[c].XS_Sequence.XS_Element[e].MaxOccurs
							== XS_Element.MaxOccursEnum.unbounded)
					) {
						ExtendedMetadata_collection _collection
							= root_ref_.ExtendedMetadata.Collections[
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
		#endregion
	}
}
