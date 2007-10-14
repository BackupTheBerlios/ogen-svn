#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata.metadata {
	public class XS0_tableDBsType : OGenRootrefCollectionInterface<XS__RootMetadata>  {
		public XS0_tableDBsType (
		) {
			xs_tabledb_ 
				= new OGenRootrefCollection<XS_tableDBType, XS__RootMetadata>();
		}

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				xs_tabledb_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public OGenRootrefCollection<XS_tableDBType, XS__RootMetadata> TableDB { get; }
		private OGenRootrefCollection<XS_tableDBType, XS__RootMetadata> xs_tabledb_;
			//= new OGenRootrefCollection<XS_tableDBType, XS__RootMetadata>();

		[XmlElement("tableDB")]
		public XS_tableDBType[] xs_tabledb__xml {
			get { return xs_tabledb_.cols__; }
			set { xs_tabledb_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<XS_tableDBType, XS__RootMetadata> TableDB {
			get { return xs_tabledb_; }
		}
		#endregion
	}
}