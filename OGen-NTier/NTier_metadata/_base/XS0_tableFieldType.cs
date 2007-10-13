#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_tableFieldType  {
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
		#region public bool isPK { get; set; }
		private bool ispk_;

		[XmlAttribute("isPK")]
		public bool isPK {
			get {
				return ispk_;
			}
			set {
				ispk_ = value;
			}
		}
		#endregion
		#region public bool isIdentity { get; set; }
		private bool isidentity_;

		[XmlAttribute("isIdentity")]
		public bool isIdentity {
			get {
				return isidentity_;
			}
			set {
				isidentity_ = value;
			}
		}
		#endregion
		#region public string defaultValue { get; set; }
		private string defaultvalue_;

		[XmlAttribute("defaultValue")]
		public string defaultValue {
			get {
				return defaultvalue_;
			}
			set {
				defaultvalue_ = value;
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
		#region public bool isListItemValue { get; set; }
		private bool islistitemvalue_;

		[XmlAttribute("isListItemValue")]
		public bool isListItemValue {
			get {
				return islistitemvalue_;
			}
			set {
				islistitemvalue_ = value;
			}
		}
		#endregion
		#region public bool isListItemText { get; set; }
		private bool islistitemtext_;

		[XmlAttribute("isListItemText")]
		public bool isListItemText {
			get {
				return islistitemtext_;
			}
			set {
				islistitemtext_ = value;
			}
		}
		#endregion
		#region public bool isConfig_Name { get; set; }
		private bool isconfig_name_;

		[XmlAttribute("isConfig_Name")]
		public bool isConfig_Name {
			get {
				return isconfig_name_;
			}
			set {
				isconfig_name_ = value;
			}
		}
		#endregion
		#region public bool isConfig_Config { get; set; }
		private bool isconfig_config_;

		[XmlAttribute("isConfig_Config")]
		public bool isConfig_Config {
			get {
				return isconfig_config_;
			}
			set {
				isconfig_config_ = value;
			}
		}
		#endregion
		#region public bool isConfig_Datatype { get; set; }
		private bool isconfig_datatype_;

		[XmlAttribute("isConfig_Datatype")]
		public bool isConfig_Datatype {
			get {
				return isconfig_datatype_;
			}
			set {
				isconfig_datatype_ = value;
			}
		}
		#endregion
		#region public string fkTableName { get; set; }
		private string fktablename_;

		[XmlAttribute("fkTableName")]
		public string fkTableName {
			get {
				return fktablename_;
			}
			set {
				fktablename_ = value;
			}
		}
		#endregion
		#region public string fkFieldName { get; set; }
		private string fkfieldname_;

		[XmlAttribute("fkFieldName")]
		public string fkFieldName {
			get {
				return fkfieldname_;
			}
			set {
				fkfieldname_ = value;
			}
		}
		#endregion
		#region public bool isNullable { get; set; }
		private bool isnullable_;

		[XmlAttribute("isNullable")]
		public bool isNullable {
			get {
				return isnullable_;
			}
			set {
				isnullable_ = value;
			}
		}
		#endregion
		#region public int size { get; set; }
		private int size_;

		[XmlAttribute("size")]
		public int size {
			get {
				return size_;
			}
			set {
				size_ = value;
			}
		}
		#endregion
		#region public string aditionalInfo { get; set; }
		private string aditionalinfo_;

		[XmlAttribute("aditionalInfo")]
		public string aditionalInfo {
			get {
				return aditionalinfo_;
			}
			set {
				aditionalinfo_ = value;
			}
		}
		#endregion
		#region public int numericPrecision { get; set; }
		private int numericprecision_;

		[XmlAttribute("numericPrecision")]
		public int numericPrecision {
			get {
				return numericprecision_;
			}
			set {
				numericprecision_ = value;
			}
		}
		#endregion
		#region public int numericScale { get; set; }
		private int numericscale_;

		[XmlAttribute("numericScale")]
		public int numericScale {
			get {
				return numericscale_;
			}
			set {
				numericscale_ = value;
			}
		}
		#endregion
		#region public XS_tableFieldDBsType XS_tableFieldDBs { get; set; }
		private XS_tableFieldDBsType xs_tablefielddbs__;

		[XmlIgnore()]
		public XS_tableFieldDBsType XS_tableFieldDBs {
			get {
				if (xs_tablefielddbs__ == null) {
					xs_tablefielddbs__ = new XS_tableFieldDBsType();
				}
				return xs_tablefielddbs__;
			}
			set {
				xs_tablefielddbs__ = value;
			}
		}

		[XmlElement("tablefielddbs")]
		public XS_tableFieldDBsType xs_tablefielddbs__xml {
			get { return xs_tablefielddbs__; }
			set { xs_tablefielddbs__ = value; }
		}
		#endregion
	}
}