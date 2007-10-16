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
	#region public class XS_dbTypeCollection { ... }
	public class XS_dbTypeCollection {
		public XS_dbTypeCollection() {
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
					((XS_dbType)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_dbType[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_dbType[] cols__ {
			get {
				XS_dbType[] _output = new XS_dbType[cols_.Count];
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

		#region public XS_dbType this[int index_in] { get; }
		public XS_dbType this[int index_in] {
			get {
				return (XS_dbType)cols_[index_in];
			}
		}
		#endregion
		#region public XS_dbType this[string value_in] { get; }
		public XS_dbType this[string dbServerType_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((XS_dbType)cols_[i]).DBServerType == dbServerType_in) {
						return (XS_dbType)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_dbType[] col_in);
		public int Add(params XS_dbType[] col_in) {
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

	public class XS0_dbType
#if !NET_1_1
		: OGenRootrefCollectionInterface<XS__RootMetadata> , OGenCollectionInterface
#endif
	{
		public XS0_dbType (
		) {
		}
		public XS0_dbType (
			string dbservertype_in
		) : this (
		) {
			dbservertype_ = dbservertype_in;
		}

#if !NET_1_1
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return DBServerType;
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
				if (dbconnections__ != null) dbconnections__.root_ref = value;
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
		private XS_dbConnectionsType dbconnections__;

		[XmlIgnore()]
		public XS_dbConnectionsType DBConnections {
			get {
				if (dbconnections__ == null) {
					dbconnections__ = new XS_dbConnectionsType();
				}
				return dbconnections__;
			}
			set {
				dbconnections__ = value;
			}
		}

		[XmlElement("dbConnections")]
		public XS_dbConnectionsType dbconnections__xml {
			get { return dbconnections__; }
			set { dbconnections__ = value; }
		}
		#endregion
	}
}