#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_tableType : OGenCollectionInterface {
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get { return 
// ToDos: now!
string.Empty
			; }
		}
		#endregion
		#region public string name { get; set; }
		private string name_;

		[XmlAttribute("name")]
		public string name {
			get {
				return name_;
			}
			set {
				name_ = value;
			}
		}
		#endregion
		#region public string friendlyName { get; set; }
		private string friendlyname_;

		[XmlAttribute("friendlyName")]
		public string friendlyName {
			get {
				return friendlyname_;
			}
			set {
				friendlyname_ = value;
			}
		}
		#endregion
		#region public string dbDescription { get; set; }
		private string dbdescription_;

		[XmlAttribute("dbDescription")]
		public string dbDescription {
			get {
				return dbdescription_;
			}
			set {
				dbdescription_ = value;
			}
		}
		#endregion
		#region public string extendedDescription { get; set; }
		private string extendeddescription_;

		[XmlAttribute("extendedDescription")]
		public string extendedDescription {
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
		#region public OGenCollection<XS_tableDBsType> XS_tableDBs { get; }
		private OGenCollection<XS_tableDBsType> xs_tabledbs_ 
			= new OGenCollection<XS_tableDBsType>();

		[XmlElement("tableDBs")]
		public XS_tableDBsType[] xs_tabledbs__xml {
			get { return xs_tabledbs_.cols__; }
			set { xs_tabledbs_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableDBsType> XS_tableDBs {
			get { return xs_tabledbs_; }
		}
		#endregion
		#region public OGenCollection<XS_tableFieldsType> XS_tableFields { get; }
		private OGenCollection<XS_tableFieldsType> xs_tablefields_ 
			= new OGenCollection<XS_tableFieldsType>();

		[XmlElement("tableFields")]
		public XS_tableFieldsType[] xs_tablefields__xml {
			get { return xs_tablefields_.cols__; }
			set { xs_tablefields_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableFieldsType> XS_tableFields {
			get { return xs_tablefields_; }
		}
		#endregion
		#region public OGenCollection<XS_tableSearchesType> XS_tableSearches { get; }
		private OGenCollection<XS_tableSearchesType> xs_tablesearches_ 
			= new OGenCollection<XS_tableSearchesType>();

		[XmlElement("tableSearches")]
		public XS_tableSearchesType[] xs_tablesearches__xml {
			get { return xs_tablesearches_.cols__; }
			set { xs_tablesearches_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableSearchesType> XS_tableSearches {
			get { return xs_tablesearches_; }
		}
		#endregion
		#region public OGenCollection<XS_tableUpdatesType> XS_tableUpdates { get; }
		private OGenCollection<XS_tableUpdatesType> xs_tableupdates_ 
			= new OGenCollection<XS_tableUpdatesType>();

		[XmlElement("tableUpdates")]
		public XS_tableUpdatesType[] xs_tableupdates__xml {
			get { return xs_tableupdates_.cols__; }
			set { xs_tableupdates_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableUpdatesType> XS_tableUpdates {
			get { return xs_tableupdates_; }
		}
		#endregion

	}
}