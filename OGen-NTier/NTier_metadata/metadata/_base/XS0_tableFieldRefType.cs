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
	public class XS0_tableFieldRefType : OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface {
		public XS0_tableFieldRefType (
		) {
		}
		public XS0_tableFieldRefType (
			string paramname_in
		) : this (
		) {
			paramname_ = paramname_in;
		}
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return ParamName;
			}
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
		#region public string TableName { get; set; }
		private string tablename_;

		[XmlAttribute("tableName")]
		public string TableName {
			get {
				return tablename_;
			}
			set {
				tablename_ = value;
			}
		}
		#endregion
		#region public string TableFieldName { get; set; }
		private string tablefieldname_;

		[XmlAttribute("tableFieldName")]
		public string TableFieldName {
			get {
				return tablefieldname_;
			}
			set {
				tablefieldname_ = value;
			}
		}
		#endregion
		#region public string ParamName { get; set; }
		private string paramname_;

		[XmlAttribute("paramName")]
		public string ParamName {
			get {
				return paramname_;
			}
			set {
				paramname_ = value;
			}
		}
		#endregion
	}
}