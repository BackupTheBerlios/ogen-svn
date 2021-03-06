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

namespace OGen.NTier.lib.metadata.metadataDB {
	#if NET_1_1
	public class XS0_tableType {
	#else
	public partial class XS_tableType {
	#endif

		#region public object parent_ref { get; }
		internal object parent_ref_;

		[XmlIgnore()]
		public object parent_ref {
			set {
				parent_ref_ = value;
				if (tabledbs__ != null) tabledbs__.parent_ref = this;
				if (tablefields__ != null) tablefields__.parent_ref = this;
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
				if (tabledbs__ != null) tabledbs__.root_ref = value;
				if (tablefields__ != null) tablefields__.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public string Name { get; set; }
		internal string name_;

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
		#region public bool isVirtualTable { get; set; }
		internal bool isvirtualtable_;

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
		#region public XS_tableDBsType TableDBs { get; set; }
		internal XS_tableDBsType tabledbs__;

		[XmlIgnore()]
		public XS_tableDBsType TableDBs {
			get {
				if (tabledbs__ == null) {
					tabledbs__ = new XS_tableDBsType();
				}
				return tabledbs__;
			}
			set {
				tabledbs__ = value;
			}
		}

		[XmlElement("tableDBs")]
		public XS_tableDBsType tabledbs__xml {
			get { return tabledbs__; }
			set { tabledbs__ = value; }
		}
		#endregion
		#region public XS_tableFieldsType TableFields { get; set; }
		internal XS_tableFieldsType tablefields__;

		[XmlIgnore()]
		public XS_tableFieldsType TableFields {
			get {
				if (tablefields__ == null) {
					tablefields__ = new XS_tableFieldsType();
				}
				return tablefields__;
			}
			set {
				tablefields__ = value;
			}
		}

		[XmlElement("tableFields")]
		public XS_tableFieldsType tablefields__xml {
			get { return tablefields__; }
			set { tablefields__ = value; }
		}
		#endregion

		#region public void CopyFrom(...);
		public void CopyFrom(XS_tableType tableType_in) {
			int _index = -1;

			name_ = tableType_in.name_;
			isvirtualtable_ = tableType_in.isvirtualtable_;
			if (tableType_in.tabledbs__ != null) tabledbs__.CopyFrom(tableType_in.tabledbs__);
			if (tableType_in.tablefields__ != null) tablefields__.CopyFrom(tableType_in.tablefields__);
		}
		#endregion
	}
}