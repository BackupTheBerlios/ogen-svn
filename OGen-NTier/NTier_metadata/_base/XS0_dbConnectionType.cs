#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_dbConnectionType : OGenCollectionInterface {
		public XS0_dbConnectionType (
		) {
		}
		public XS0_dbConnectionType (
			string configmode_in
		) : this (
		) {
			configmode_ = configmode_in;
		}
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return configMode;
			}
		}
		#endregion
		#region public string configMode { get; set; }
		private string configmode_;

		[XmlAttribute("configMode")]
		public string configMode {
			get {
				return configmode_;
			}
			set {
				configmode_ = value;
			}
		}
		#endregion
		#region public bool isDefault { get; set; }
		private bool isdefault_;

		[XmlAttribute("isDefault")]
		public bool isDefault {
			get {
				return isdefault_;
			}
			set {
				isdefault_ = value;
			}
		}
		#endregion
		#region public bool generateSQL { get; set; }
		private bool generatesql_;

		[XmlAttribute("generateSQL")]
		public bool generateSQL {
			get {
				return generatesql_;
			}
			set {
				generatesql_ = value;
			}
		}
		#endregion
		#region public bool isIndexed_andReadOnly { get; set; }
		private bool isindexed_andreadonly_;

		[XmlAttribute("isIndexed_andReadOnly")]
		public bool isIndexed_andReadOnly {
			get {
				return isindexed_andreadonly_;
			}
			set {
				isindexed_andreadonly_ = value;
			}
		}
		#endregion
		#region public string connectionstring { get; set; }
		private string connectionstring_;

		[XmlAttribute("connectionstring")]
		public string connectionstring {
			get {
				return connectionstring_;
			}
			set {
				connectionstring_ = value;
			}
		}
		#endregion
	}
}