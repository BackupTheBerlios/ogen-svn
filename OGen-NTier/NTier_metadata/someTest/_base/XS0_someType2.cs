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

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata.someTest {
#if NET_1_1
	#region public class XS_someType2Collection { ... }
	public class XS_someType2Collection {
		public XS_someType2Collection() {
			cols_ = new ArrayList();
		}

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		public XS__RootMetadata root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((XS_someType2)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_someType2[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_someType2[] cols__ {
			get {
				XS_someType2[] _output = new XS_someType2[cols_.Count];
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

		#region public XS_someType2 this[int index_in] { get; }
		public XS_someType2 this[int index_in] {
			get {
				return (XS_someType2)cols_[index_in];
			}
		}
		#endregion

		#region public int Add(params XS_someType2[] col_in);
		public int Add(params XS_someType2[] col_in) {
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

	public class XS0_someType2
#if !NET_1_1
		: OGenRootrefCollectionInterface<XS__RootMetadata> 
#endif
	{
		public XS0_someType2 (
		) {
			somecollectioncollection_ = new 
#if !NET_1_1
				OGenRootrefSimpleCollection<XS_someType1, XS__RootMetadata>()
#else
				XS_someType1Collection()
#endif
			;
		}

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				somecollectioncollection_.root_ref = value;
				if (someitem__ != null) someitem__.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public string SomeAttrib2 { get; set; }
		private string someattrib2_;

		[XmlAttribute("someAttrib2")]
		public string SomeAttrib2 {
			get {
				return someattrib2_;
			}
			set {
				someattrib2_ = value;
			}
		}
		#endregion
		#region public string SomeAttrib3 { get; set; }
		private string someattrib3_;

		[XmlAttribute("someAttrib3")]
		public string SomeAttrib3 {
			get {
				return someattrib3_;
			}
			set {
				someattrib3_ = value;
			}
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_someType1, XS__RootMetadata> SomeCollection { get; }
		private 
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_someType1, XS__RootMetadata>
#else
			XS_someType1Collection
#endif
			somecollectioncollection_;

		[XmlElement("someCollection")]
		public XS_someType1[] somecollection__xml {
			get { return somecollectioncollection_.cols__; }
			set { somecollectioncollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_someType1, XS__RootMetadata> SomeCollection
#else
			XS_someType1Collection
#endif
		XS_someType1Collection
		{
			get { return somecollectioncollection_; }
		}
		#endregion
		#region public XS_someType1 SomeItem { get; set; }
		private XS_someType1 someitem__;

		[XmlIgnore()]
		public XS_someType1 SomeItem {
			get {
				if (someitem__ == null) {
					someitem__ = new XS_someType1();
				}
				return someitem__;
			}
			set {
				someitem__ = value;
			}
		}

		[XmlElement("someItem")]
		public XS_someType1 someitem__xml {
			get { return someitem__; }
			set { someitem__ = value; }
		}
		#endregion
	}
}