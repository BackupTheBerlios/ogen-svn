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
	public class XS0_tableUpdateParametersType : OGenRootrefCollectionInterface<XS__RootMetadata>  {
		public XS0_tableUpdateParametersType (
		) {
			tablefieldref_ 
				= new OGenRootrefCollection<XS_tableFieldRefType, XS__RootMetadata>();
		}

		#region public XS__RootMetadata root_ref { get; }
		private XS__RootMetadata root_ref_;

		[XmlIgnore()]
		public XS__RootMetadata root_ref {
			set {
				root_ref_ = value;
				tablefieldref_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		#region public OGenRootrefCollection<XS_tableFieldRefType, XS__RootMetadata> TableFieldRef { get; }
		private OGenRootrefCollection<XS_tableFieldRefType, XS__RootMetadata> tablefieldref_;
			//= new OGenRootrefCollection<XS_tableFieldRefType, XS__RootMetadata>();

		[XmlElement("tableFieldRef")]
		public XS_tableFieldRefType[] tablefieldref__xml {
			get { return tablefieldref_.cols__; }
			set { tablefieldref_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<XS_tableFieldRefType, XS__RootMetadata> TableFieldRef {
			get { return tablefieldref_; }
		}
		#endregion
	}
}