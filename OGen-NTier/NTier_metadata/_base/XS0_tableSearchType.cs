#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_tableSearchType : OGenCollectionInterface {
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
		#region public OGenCollection<XS_tableSearchParametersType> XS_tableSearchParameters { get; }
		private OGenCollection<XS_tableSearchParametersType> xs_tablesearchparameters_ 
			= new OGenCollection<XS_tableSearchParametersType>();

		[XmlElement("tableSearchParameters")]
		public XS_tableSearchParametersType[] xs_tablesearchparameters__xml {
			get { return xs_tablesearchparameters_.cols__; }
			set { xs_tablesearchparameters_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableSearchParametersType> XS_tableSearchParameters {
			get { return xs_tablesearchparameters_; }
		}
		#endregion
		#region public OGenCollection<XS_tableSearchUpdatesType> XS_tableSearchUpdates { get; }
		private OGenCollection<XS_tableSearchUpdatesType> xs_tablesearchupdates_ 
			= new OGenCollection<XS_tableSearchUpdatesType>();

		[XmlElement("tableSearchUpdates")]
		public XS_tableSearchUpdatesType[] xs_tablesearchupdates__xml {
			get { return xs_tablesearchupdates_.cols__; }
			set { xs_tablesearchupdates_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableSearchUpdatesType> XS_tableSearchUpdates {
			get { return xs_tablesearchupdates_; }
		}
		#endregion

	}
}