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
	public class XS0_tableType : OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface {
		public XS0_tableType (
		) {
			tabledbs_ 
				= new OGenRootrefSimpleCollection<XS_tableDBsType, XS__RootMetadata>();
			tablefields_ 
				= new OGenRootrefSimpleCollection<XS_tableFieldsType, XS__RootMetadata>();
			tablesearches_ 
				= new OGenRootrefSimpleCollection<XS_tableSearchesType, XS__RootMetadata>();
			tableupdates_ 
				= new OGenRootrefSimpleCollection<XS_tableUpdatesType, XS__RootMetadata>();
		}
		public XS0_tableType (
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
				tabledbs_.root_ref = value;
				tablefields_.root_ref = value;
				tablesearches_.root_ref = value;
				tableupdates_.root_ref = value;
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
		#region public string FriendlyName { get; set; }
		private string friendlyname_;

		[XmlAttribute("friendlyName")]
		public string FriendlyName {
			get {
				return friendlyname_;
			}
			set {
				friendlyname_ = value;
			}
		}
		#endregion
		#region public string DBDescription { get; set; }
		private string dbdescription_;

		[XmlAttribute("dbDescription")]
		public string DBDescription {
			get {
				return dbdescription_;
			}
			set {
				dbdescription_ = value;
			}
		}
		#endregion
		#region public string ExtendedDescription { get; set; }
		private string extendeddescription_;

		[XmlAttribute("extendedDescription")]
		public string ExtendedDescription {
			get {
				return extendeddescription_;
			}
			set {
				extendeddescription_ = value;
			}
		}
		#endregion
		#region public bool isVirtualTable { get; set; }
		private bool isvirtualtable_;

		[XmlAttribute("isVirtualTable")]
		public bool isVirtualTable {
			get {
				return isvirtualtable_;
			}
			set {
				isvirtualtable_ = value;
			}
		}
		#endregion
		#region public bool isConfig { get; set; }
		private bool isconfig_;

		[XmlAttribute("isConfig")]
		public bool isConfig {
			get {
				return isconfig_;
			}
			set {
				isconfig_ = value;
			}
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableDBsType, XS__RootMetadata> TableDBs { get; }
		private OGenRootrefSimpleCollection<XS_tableDBsType, XS__RootMetadata> tabledbs_;
			//= new OGenRootrefSimpleCollection<XS_tableDBsType, XS__RootMetadata>();

		[XmlElement("tableDBs")]
		public XS_tableDBsType[] tabledbs__xml {
			get { return tabledbs_.cols__; }
			set { tabledbs_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableDBsType, XS__RootMetadata> TableDBs {
			get { return tabledbs_; }
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableFieldsType, XS__RootMetadata> TableFields { get; }
		private OGenRootrefSimpleCollection<XS_tableFieldsType, XS__RootMetadata> tablefields_;
			//= new OGenRootrefSimpleCollection<XS_tableFieldsType, XS__RootMetadata>();

		[XmlElement("tableFields")]
		public XS_tableFieldsType[] tablefields__xml {
			get { return tablefields_.cols__; }
			set { tablefields_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableFieldsType, XS__RootMetadata> TableFields {
			get { return tablefields_; }
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableSearchesType, XS__RootMetadata> TableSearches { get; }
		private OGenRootrefSimpleCollection<XS_tableSearchesType, XS__RootMetadata> tablesearches_;
			//= new OGenRootrefSimpleCollection<XS_tableSearchesType, XS__RootMetadata>();

		[XmlElement("tableSearches")]
		public XS_tableSearchesType[] tablesearches__xml {
			get { return tablesearches_.cols__; }
			set { tablesearches_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableSearchesType, XS__RootMetadata> TableSearches {
			get { return tablesearches_; }
		}
		#endregion
		#region public OGenRootrefSimpleCollection<XS_tableUpdatesType, XS__RootMetadata> TableUpdates { get; }
		private OGenRootrefSimpleCollection<XS_tableUpdatesType, XS__RootMetadata> tableupdates_;
			//= new OGenRootrefSimpleCollection<XS_tableUpdatesType, XS__RootMetadata>();

		[XmlElement("tableUpdates")]
		public XS_tableUpdatesType[] tableupdates__xml {
			get { return tableupdates_.cols__; }
			set { tableupdates_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefSimpleCollection<XS_tableUpdatesType, XS__RootMetadata> TableUpdates {
			get { return tableupdates_; }
		}
		#endregion
	}
}