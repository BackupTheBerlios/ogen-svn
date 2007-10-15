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

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata.metadata {
	public class XS0_tableSearchType : OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface {
		public XS0_tableSearchType (
		) {
			tablesearchparameters_ 
				= new OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata>();
			tablesearchupdates_ 
				= new OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata>();
		}
		public XS0_tableSearchType (
			string name_in
		) : this (
		) {
			name_ = name_in;
		}
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return Name;
			}
		}
		#endregion

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				tablesearchparameters_.root_ref = value;
				tablesearchupdates_.root_ref = value;
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
		private OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata> tablesearchparameters_;
			//= new OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata>();

		[XmlElement("tableSearchParameters")]
		public XS_tableSearchParametersType[] tablesearchparameters__xml {
			get { return tablesearchparameters_.cols__; }
			set { tablesearchparameters_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableSearchParametersType, XS__RootMetadata> TableSearchParameters {
			get { return tablesearchparameters_; }
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata> TableSearchUpdates { get; }
		private OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata> tablesearchupdates_;
			//= new OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata>();

		[XmlElement("tableSearchUpdates")]
		public XS_tableSearchUpdatesType[] tablesearchupdates__xml {
			get { return tablesearchupdates_.cols__; }
			set { tablesearchupdates_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableSearchUpdatesType, XS__RootMetadata> TableSearchUpdates {
			get { return tablesearchupdates_; }
		}
		#endregion
	}
}