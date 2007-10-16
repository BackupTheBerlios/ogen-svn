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
	public class XS_Sequence
#if !NET_1_1
		: OGenRootrefCollectionInterface<RootMetadata>
#endif
	{
		public XS_Sequence(
		) {
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;

				xs_elementcollection_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion

		#region public ... XS_Element { get; }
#if !NET_1_1
		private OGenRootrefCollection<XS_Element, RootMetadata> xs_elementcollection_
			= new OGenRootrefCollection<XS_Element, RootMetadata>();
#else
		private XS_ElementCollection xs_elementcollection_
			= new XS_ElementCollection();
#endif

		[XmlElement("element")]
		//[XmlArray("element")]
		//[XmlArrayItem(typeof(XS_Element))]
		public XS_Element[] xs_element__xml {
			get { return xs_elementcollection_.cols__; }
			set { xs_elementcollection_.cols__ = value; }
		}

		[XmlIgnore()]
		public 
#if !NET_1_1
		OGenRootrefCollection<XS_Element, RootMetadata>
#else
		XS_ElementCollection
#endif
		XS_Element {
			get { return xs_elementcollection_; }
		}
		#endregion
	}
}
