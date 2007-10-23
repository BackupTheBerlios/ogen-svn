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

namespace OGen.NTier.lib.metadata.metadataExtended {
	public class XS0_tableFieldType
#if !NET_1_1
		: OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface<string>
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

		#region public object parent_ref { get; }
		private object parent_ref_;

		[XmlIgnore()]
		public object parent_ref {
			set {
				parent_ref_ = value;
			}
			get { return parent_ref_; }
		}
		#endregion
		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
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
	}
}