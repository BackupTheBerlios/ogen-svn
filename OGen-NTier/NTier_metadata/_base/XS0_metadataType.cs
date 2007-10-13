#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_metadataType  {
		#region public string applicationName { get; set; }
		private string applicationname_;

		[XmlAttribute("applicationName")]
		public string applicationName {
			get {
				return applicationname_;
			}
			set {
				applicationname_ = value;
			}
		}
		#endregion
		#region public string applicationNamespace { get; set; }
		private string applicationnamespace_;

		[XmlAttribute("applicationNamespace")]
		public string applicationNamespace {
			get {
				return applicationnamespace_;
			}
			set {
				applicationnamespace_ = value;
			}
		}
		#endregion
		#region public string subAppName { get; set; }
		private string subappname_;

		[XmlAttribute("subAppName")]
		public string subAppName {
			get {
				return subappname_;
			}
			set {
				subappname_ = value;
			}
		}
		#endregion
		#region public string pseudoReflectionable { get; set; }
		private string pseudoreflectionable_;

		[XmlAttribute("pseudoReflectionable")]
		public string pseudoReflectionable {
			get {
				return pseudoreflectionable_;
			}
			set {
				pseudoreflectionable_ = value;
			}
		}
		#endregion
		#region public XS_sqlScriptOptionEnumeration sqlScriptOption { get; set; }
		private XS_sqlScriptOptionEnumeration sqlscriptoption_;

		[XmlAttribute("sqlScriptOption")]
		public XS_sqlScriptOptionEnumeration sqlScriptOption {
			get {
				return sqlscriptoption_;
			}
			set {
				sqlscriptoption_ = value;
			}
		}
		#endregion
		#region public string guidDatalayer { get; set; }
		private string guiddatalayer_;

		[XmlAttribute("guidDatalayer")]
		public string guidDatalayer {
			get {
				return guiddatalayer_;
			}
			set {
				guiddatalayer_ = value;
			}
		}
		#endregion
		#region public string guidDatalayer_UTs { get; set; }
		private string guiddatalayer_uts_;

		[XmlAttribute("guidDatalayer_UTs")]
		public string guidDatalayer_UTs {
			get {
				return guiddatalayer_uts_;
			}
			set {
				guiddatalayer_uts_ = value;
			}
		}
		#endregion
		#region public string guidBusinesslayer { get; set; }
		private string guidbusinesslayer_;

		[XmlAttribute("guidBusinesslayer")]
		public string guidBusinesslayer {
			get {
				return guidbusinesslayer_;
			}
			set {
				guidbusinesslayer_ = value;
			}
		}
		#endregion
		#region public string guidBusinesslayer_UTs { get; set; }
		private string guidbusinesslayer_uts_;

		[XmlAttribute("guidBusinesslayer_UTs")]
		public string guidBusinesslayer_UTs {
			get {
				return guidbusinesslayer_uts_;
			}
			set {
				guidbusinesslayer_uts_ = value;
			}
		}
		#endregion
		#region public string guidTest { get; set; }
		private string guidtest_;

		[XmlAttribute("guidTest")]
		public string guidTest {
			get {
				return guidtest_;
			}
			set {
				guidtest_ = value;
			}
		}
		#endregion
		#region public string feedbackEmailAddress { get; set; }
		private string feedbackemailaddress_;

		[XmlAttribute("feedbackEmailAddress")]
		public string feedbackEmailAddress {
			get {
				return feedbackemailaddress_;
			}
			set {
				feedbackemailaddress_ = value;
			}
		}
		#endregion
		#region public string copyrightText { get; set; }
		private string copyrighttext_;

		[XmlAttribute("copyrightText")]
		public string copyrightText {
			get {
				return copyrighttext_;
			}
			set {
				copyrighttext_ = value;
			}
		}
		#endregion
		#region public string copyrightTextLong { get; set; }
		private string copyrighttextlong_;

		[XmlAttribute("copyrightTextLong")]
		public string copyrightTextLong {
			get {
				return copyrighttextlong_;
			}
			set {
				copyrighttextlong_ = value;
			}
		}
		#endregion
		#region public XS_dbsType XS_dbs { get; set; }
		private XS_dbsType xs_dbs__;

		[XmlIgnore()]
		public XS_dbsType XS_dbs {
			get {
				if (xs_dbs__ == null) {
					xs_dbs__ = new XS_dbsType();
				}
				return xs_dbs__;
			}
			set {
				xs_dbs__ = value;
			}
		}

		[XmlElement("dbs")]
		public XS_dbsType xs_dbs__xml {
			get { return xs_dbs__; }
			set { xs_dbs__ = value; }
		}
		#endregion
		#region public XS_tablesType XS_tables { get; set; }
		private XS_tablesType xs_tables__;

		[XmlIgnore()]
		public XS_tablesType XS_tables {
			get {
				if (xs_tables__ == null) {
					xs_tables__ = new XS_tablesType();
				}
				return xs_tables__;
			}
			set {
				xs_tables__ = value;
			}
		}

		[XmlElement("tables")]
		public XS_tablesType xs_tables__xml {
			get { return xs_tables__; }
			set { xs_tables__ = value; }
		}
		#endregion
	}
}