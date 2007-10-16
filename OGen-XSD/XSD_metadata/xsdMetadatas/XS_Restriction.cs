#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion

using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	public class XS_Restriction 
#if !NET_1_1
		: OGenRootrefCollectionInterface<RootMetadata> 
#endif
	{
		public XS_Restriction() {
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;

				xs_enumerationcollection_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion

		#region public string Base { get; set; }
		private string base_;

		//[XmlElement("base")]
		[XmlAttribute("base")]
		public string Base {
			get {
				return base_;
			}
			set {
				base_ = value;
			}
		}
		#endregion

		#region public ... XS_Enumeration { get; }
#if !NET_1_1
		private OGenRootrefCollection<XS_Enumeration, RootMetadata> xs_enumerationcollection_
			= new OGenRootrefCollection<XS_Enumeration, RootMetadata>();
#else
		private XS_EnumerationCollection xs_enumerationcollection_
			= new XS_EnumerationCollection();
#endif

		[XmlElement("enumeration")]
		//[XmlArray("enumeration")]
		//[XmlArrayItem(typeof(XS_Enumeration))]
		public XS_Enumeration[] xs_enumeration__xml {
			get { return xs_enumerationcollection_.cols__; }
			set { xs_enumerationcollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public 
#if !NET_1_1
			OGenRootrefCollection<XS_Enumeration, RootMetadata>
#else
			XS_EnumerationCollection
#endif
		XS_Enumeration {
			get { return xs_enumerationcollection_; }
		}
		#endregion
	}
}
