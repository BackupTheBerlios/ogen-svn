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

namespace OGen.XSD.lib.metadata {
	public class XS_ComplexType {
		public XS_ComplexType() {
		}

		#region public string Name { get; set; }
		private string name_;

		//[XmlElement("name")]
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
		#region public XS_Sequence XS_Sequence { get; set; }
		private XS_Sequence xs_sequence_;

		[XmlElement("xs___sequence")]
		public XS_Sequence XS_Sequence {
			get { return xs_sequence_; }
			set { xs_sequence_ = value; }
		}
		#endregion

		#region public XS_Attribute[] XS_Attribute { get; set; }
		private XS_Attribute[] xs_attribute_;

		[XmlElement("xs___attribute")]
		public XS_Attribute[] XS_Attribute {
			get { return xs_attribute_; }
			set { xs_attribute_ = value; }
		}
		#endregion
	}
}
