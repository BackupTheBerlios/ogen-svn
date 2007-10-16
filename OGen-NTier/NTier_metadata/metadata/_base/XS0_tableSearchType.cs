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

namespace OGen.NTier.lib.metadata.metadata {
#if NET_1_1
	#region public class XS_tableSearchTypeCollection { ... }
	public class XS_tableSearchTypeCollection {
		public XS_tableSearchTypeCollection() {
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
					((XS_tableSearchType)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_tableSearchType[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_tableSearchType[] cols__ {
			get {
				XS_tableSearchType[] _output = new XS_tableSearchType[cols_.Count];
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

		#region public XS_tableSearchType this[int index_in] { get; }
		public XS_tableSearchType this[int index_in] {
			get {
				return (XS_tableSearchType)cols_[index_in];
			}
		}
		#endregion
		#region public XS_tableSearchType this[string value_in] { get; }
		public XS_tableSearchType this[string name_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((XS_tableSearchType)cols_[i]).Name == name_in) {
						return (XS_tableSearchType)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_tableSearchType[] col_in);
		public int Add(params XS_tableSearchType[] col_in) {
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

	public class XS0_tableSearchType
#if !NET_1_1
		: OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface
#endif
	{
		public XS0_tableSearchType (
		) {
			tablesearchparameterscollection_ = new 
#if !NET_1_1
				OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata>()
#else
				XS_tableSearchParametersTypeCollection()
#endif
			;
			tablesearchupdatescollection_ = new 
#if !NET_1_1
				OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata>()
#else
				XS_tableSearchUpdatesTypeCollection()
#endif
			;
		}
		public XS0_tableSearchType (
			string name_in
		) : this (
		) {
			name_ = name_in;
		}

#if !NET_1_1
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return Name;
			}
		}
		#endregion
#endif

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				tablesearchparameterscollection_.root_ref = value;
				tablesearchupdatescollection_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public string Name { get; set; }
		private string name_;

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
		#region public bool isRange { get; set; }
		private bool isrange_;

		[XmlAttribute("isRange")]
		public bool isRange {
			get {
				return isrange_;
			}
			set {
				isrange_ = value;
			}
		}
		#endregion
		#region public bool isExplicitUniqueIndex { get; set; }
		private bool isexplicituniqueindex_;

		[XmlAttribute("isExplicitUniqueIndex")]
		public bool isExplicitUniqueIndex {
			get {
				return isexplicituniqueindex_;
			}
			set {
				isexplicituniqueindex_ = value;
			}
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata> TableSearchParameters { get; }
		private 
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata>
#else
			XS_tableSearchParametersTypeCollection
#endif
			tablesearchparameterscollection_;

		[XmlElement("tableSearchParameters")]
		public XS_tableSearchParametersType[] tablesearchparameters__xml {
			get { return tablesearchparameterscollection_.cols__; }
			set { tablesearchparameterscollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata> TableSearchParameters
#else
			XS_tableSearchParametersTypeCollection
#endif
		XS_tableSearchParametersTypeCollection
		{
			get { return tablesearchparameterscollection_; }
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata> TableSearchUpdates { get; }
		private 
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata>
#else
			XS_tableSearchUpdatesTypeCollection
#endif
			tablesearchupdatescollection_;

		[XmlElement("tableSearchUpdates")]
		public XS_tableSearchUpdatesType[] tablesearchupdates__xml {
			get { return tablesearchupdatescollection_.cols__; }
			set { tablesearchupdatescollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public
#if !NET_1_1
			OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata> TableSearchUpdates
#else
			XS_tableSearchUpdatesTypeCollection
#endif
		XS_tableSearchUpdatesTypeCollection
		{
			get { return tablesearchupdatescollection_; }
		}
		#endregion
	}
}