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
	public class XS_Element : OGenCollectionInterface, OGenRootrefCollectionInterface<RootMetadata> {
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
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get { return Name; }
		}
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
			ExtendedMetadata_collection _collection 
				= root_ref.Metadata.Collections[Type];
			return (_collection == null) ? string.Empty : _collection.Name;
		}
		#endregion
	}
}
