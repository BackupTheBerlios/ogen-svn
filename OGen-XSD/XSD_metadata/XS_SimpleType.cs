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
	public class XS_SimpleType : OGenCollectionInterface, OGenRootrefCollectionInterface<RootMetadata> {
		public XS_SimpleType(
		) {
		}
		public XS_SimpleType(
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

				if (xs_restriction__ != null) xs_restriction__.root_ref = value;
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

		#region public XS_Restriction XS_Restriction { get; set; }
		private XS_Restriction xs_restriction__;

		[XmlIgnore()]
		public XS_Restriction XS_Restriction {
			get {
				if (xs_restriction__ == null) {
					xs_restriction__ = new XS_Restriction();
				}
				return xs_restriction__;
			}
			set {
				xs_restriction__ = value;
			}
		}

		[XmlElement("restriction")]
		public XS_Restriction xs_restriction__xml {
			get { return xs_restriction__; }
			set { xs_restriction__ = value; }
		}
		#endregion
	}
}
