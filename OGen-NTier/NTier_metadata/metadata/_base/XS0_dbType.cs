#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata.metadata {
	public class XS0_dbType : OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface {
		public XS0_dbType (
		) {
		}
		public XS0_dbType (
			string dbservertype_in
		) : this (
		) {
			dbservertype_ = dbservertype_in;
		}
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return DBServerType;
			}
		}
		#endregion

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				if (xs_dbconnections__ != null) xs_dbconnections__.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public string DBServerType { get; set; }
		private string dbservertype_;

		[XmlAttribute("dbServerType")]
		public string DBServerType {
			get {
				return dbservertype_;
			}
			set {
				dbservertype_ = value;
			}
		}
		#endregion
		#region public XS_dbConnectionsType DBConnections { get; set; }
		private XS_dbConnectionsType xs_dbconnections__;

		[XmlIgnore()]
		public XS_dbConnectionsType DBConnections {
			get {
				if (xs_dbconnections__ == null) {
					xs_dbconnections__ = new XS_dbConnectionsType();
				}
				return xs_dbconnections__;
			}
			set {
				xs_dbconnections__ = value;
			}
		}

		[XmlElement("dbconnections")]
		public XS_dbConnectionsType xs_dbconnections__xml {
			get { return xs_dbconnections__; }
			set { xs_dbconnections__ = value; }
		}
		#endregion
	}
}