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
	#region public class XS_tableFieldTypeCollection { ... }
	public class XS_tableFieldTypeCollection {
		public XS_tableFieldTypeCollection() {
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
					((XS_tableFieldType)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_tableFieldType[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_tableFieldType[] cols__ {
			get {
				XS_tableFieldType[] _output = new XS_tableFieldType[cols_.Count];
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

		#region public XS_tableFieldType this[int index_in] { get; }
		public XS_tableFieldType this[int index_in] {
			get {
				return (XS_tableFieldType)cols_[index_in];
			}
		}
		#endregion
		#region public XS_tableFieldType this[string value_in] { get; }
		public XS_tableFieldType this[string name_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((XS_tableFieldType)cols_[i]).Name == name_in) {
						return (XS_tableFieldType)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_tableFieldType[] col_in);
		public int Add(params XS_tableFieldType[] col_in) {
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

	public class XS0_tableFieldType
#if !NET_1_1
		: OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface
#endif
	{
		public XS0_tableFieldType (
		) {
		}
		public XS0_tableFieldType (
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
				if (tablefielddbs__ != null) tablefielddbs__.root_ref = value;
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
		#region public string DefaultValue { get; set; }
		private string defaultvalue_;

		[XmlAttribute("defaultValue")]
		public string DefaultValue {
			get {
				return defaultvalue_;
			}
			set {
				defaultvalue_ = value;
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
		#region public string FKTableName { get; set; }
		private string fktablename_;

		[XmlAttribute("fkTableName")]
		public string FKTableName {
			get {
				return fktablename_;
			}
			set {
				fktablename_ = value;
			}
		}
		#endregion
		#region public string FKFieldName { get; set; }
		private string fkfieldname_;

		[XmlAttribute("fkFieldName")]
		public string FKFieldName {
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
		#region public int Size { get; set; }
		private int size_;

		[XmlAttribute("size")]
		public int Size {
			get {
				return size_;
			}
			set {
				size_ = value;
			}
		}
		#endregion
		#region public string AditionalInfo { get; set; }
		private string aditionalinfo_;

		[XmlAttribute("aditionalInfo")]
		public string AditionalInfo {
			get {
				return aditionalinfo_;
			}
			set {
				aditionalinfo_ = value;
			}
		}
		#endregion
		#region public int NumericPrecision { get; set; }
		private int numericprecision_;

		[XmlAttribute("numericPrecision")]
		public int NumericPrecision {
			get {
				return numericprecision_;
			}
			set {
				numericprecision_ = value;
			}
		}
		#endregion
		#region public int NumericScale { get; set; }
		private int numericscale_;

		[XmlAttribute("numericScale")]
		public int NumericScale {
			get {
				return numericscale_;
			}
			set {
				numericscale_ = value;
			}
		}
		#endregion
		#region public XS_tableFieldDBsType TableFieldDBs { get; set; }
		private XS_tableFieldDBsType tablefielddbs__;

		[XmlIgnore()]
		public XS_tableFieldDBsType TableFieldDBs {
			get {
				if (tablefielddbs__ == null) {
					tablefielddbs__ = new XS_tableFieldDBsType();
				}
				return tablefielddbs__;
			}
			set {
				tablefielddbs__ = value;
			}
		}

		[XmlElement("tableFieldDBs")]
		public XS_tableFieldDBsType tablefielddbs__xml {
			get { return tablefielddbs__; }
			set { tablefielddbs__ = value; }
		}
		#endregion
	}
}