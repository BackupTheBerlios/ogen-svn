#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;
using System.Collections;

namespace OGen.Doc.lib.metadata.documentation {
	#if NET_1_1
	public class XS0_itemsType {
	#else
	public partial class XS_itemsType {
	#endif

		#region public object parent_ref { get; }
		internal object parent_ref_;

		[XmlIgnore()]
		public object parent_ref {
			set {
				parent_ref_ = value;
				itemcollection_.parent_ref = this;
			}
			get { return parent_ref_; }
		}
		#endregion
		#region public XS__RootMetadata root_ref { get; }
		internal XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				itemcollection_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public XS_itemTypeCollection ItemCollection { get; }
		internal XS_itemTypeCollection itemcollection_ 
			= new XS_itemTypeCollection();

		[XmlElement("item")]
		public XS_itemType[] itemcollection__xml {
			get { return itemcollection_.cols__; }
			set { itemcollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public XS_itemTypeCollection ItemCollection {
			get { return itemcollection_; }
		}
		#endregion

		#region public void CopyFrom(...);
		public void CopyFrom(XS_itemsType itemsType_in) {
			int _index = -1;

			itemcollection_.Clear();
			for (int d = 0; d < itemsType_in.itemcollection_.Count; d++) {
				itemcollection_.Add(
					out _index,
					new XS_itemType()
				);
				itemcollection_[_index].CopyFrom(
					itemsType_in.itemcollection_[d]
				);
			}
		}
		#endregion
	}
}