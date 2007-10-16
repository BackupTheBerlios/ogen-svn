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
#if NET_1_1
	#region public class XS_ElementCollection { ... }
	public class XS_ElementCollection {
		public XS_ElementCollection() {
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
					((XS_Element)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_Enumeration[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_Element[] cols__ {
			get {
				XS_Element[] _output = new XS_Element[cols_.Count];
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

		#region public XS_Element this[int index_in] { get; }
		public XS_Element this[int index_in] {
			get {
				return (XS_Element)cols_[index_in];
			}
		}
		#endregion
		#region public XS_Element this[string value_in] { get; }
		public XS_Element this[string name_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((XS_Element)cols_[i]).Name == name_in) {
						return (XS_Element)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_Element[] col_in);
		public int Add(params XS_Element[] col_in) {
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

	public class XS_Element 
#if !NET_1_1
		: OGenCollectionInterface, OGenRootrefCollectionInterface<RootMetadata>
#endif
	{
		public XS_Element(
		) {
		}
		public XS_Element(
			string name_in
		) : this (
		) {
			name_ = name_in;
		}

		//public const string MAXOCCURSENUM_UNBOUNDED = "unbounded";
		public enum MaxOccursEnum {
			_undefined_ = 0, 
			unbounded = 1
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;
			}
			get { return root_ref_; }
		}
		#endregion
#if !NET_1_1
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get { return Name; }
		}
		#endregion
#endif
		#region //public string NType { get; set; }
		//[XmlIgnore()]
		//public string NType {
		//    get {
		//        return utils.Convert_NType(
		//            root_ref,
		//            type_
		//        );
		//    }
		//}
		#endregion

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
		#region public string Type { get; set; }
		private string type_;

		//[XmlElement("type")]
		[XmlAttribute("type")]
		public string Type {
			get {
				return type_;
			}
			set {
				type_ = value;
			}
		}
		#endregion
		#region public MaxOccursEnum MaxOccurs { get; set; }
		private string maxoccurs_;

		//[XmlElement("maxOccurs")]
		[XmlAttribute("maxOccurs")]
		public string maxoccurs__xml {
			get {
				return maxoccurs_;
			}
			set {
				maxoccurs_ = value;
			}
		}

		[XmlIgnore()]
		public MaxOccursEnum MaxOccurs {
			get {
				if (
					(maxoccurs_ == null)
					||
					(maxoccurs_ == string.Empty)
				) {
					return MaxOccursEnum._undefined_;
				} else {
					return (MaxOccursEnum)Enum.Parse(typeof(MaxOccursEnum), maxoccurs_);
				}
			}
			set {
				maxoccurs_ = value.ToString();
			}
		}
		#endregion

		#region public string isCollection_nameIt(...);
		public string isCollection_nameIt(
		) {
			ExtendedMetadata_complexTypeKeys _collection
				= root_ref.ExtendedMetadata.ComplexTypeKeys[Type];
			return (_collection == null) ? string.Empty : _collection.Keys;
		}
		#endregion
	}
}
