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
//using System.Collections.Generic;
//using System.Text;
//using System.Xml;
using System.Xml.Serialization;

namespace OGen.NTier.lib.metadata {
	[XmlRoot("metadata")]
	public class Metadata {
//		#region	public Metadata(...);
		public Metadata(
		) {
		}
//		#endregion

		#region public string ApplicationName { get; set; }
		private string applicationname_;

		[XmlElement("applicationName")]
		public string ApplicationName {
			get { return applicationname_; }
			set { applicationname_ = value; }
		}
		#endregion
		#region public string Namespace { get; set; }
		private string namespace_;

		[XmlElement("namespace")]
		public string Namespace {
			get { return namespace_; }
			set { namespace_ = value; }
		}
		#endregion
		#region public string SubAppName { get; set; }
		private string subappname_;

		[XmlElement("subAppName")]
		public string SubAppName {
			get { return subappname_; }
			set { subappname_ = value; }
		}
		#endregion
		#region public eSQLScriptOptions SQLScriptOption { get; set; }
		private eSQLScriptOptions sqlscriptoption_;

		[XmlElement("sqlScriptOption")]
		public eSQLScriptOptions SQLScriptOption {
			get { return sqlscriptoption_; }
			set { sqlscriptoption_ = value; }
		}
		#endregion
		#region public string GUIDDatalayer { get; set; }
		private string guiddatalayer_;

		[XmlElement("guidDatalayer")]
		public string GUIDDatalayer {
			get { return guiddatalayer_; }
			set { guiddatalayer_ = value; }
		}
		#endregion
		#region public string GUIDDatalayer_UTs { get; set; }
		private string guiddatalayer_uts_;

		[XmlElement("guidDatalayer_UTs")]
		public string GUIDDatalayer_UTs {
			get { return guiddatalayer_uts_; }
			set { guiddatalayer_uts_ = value; }
		}
		#endregion
		#region public string GUIDBusinesslayer { get; set; }
		private string guidbusinesslayer_;

		[XmlElement("guidBusinesslayer")]
		public string GUIDBusinesslayer {
			get { return guidbusinesslayer_; }
			set { guidbusinesslayer_ = value; }
		}
		#endregion
		#region public string GUIDBusinesslayer_UTs { get; set; }
		private string guidbusinesslayer_uts_;

		[XmlElement("guidBusinesslayer_UTs")]
		public string GUIDBusinesslayer_UTs {
			get { return guidbusinesslayer_uts_; }
			set { guidbusinesslayer_uts_ = value; }
		}
		#endregion
		#region public string GUIDTest { get; set; }
		private string guidtest_;

		[XmlElement("guidTest")]
		public string GUIDTest {
			get { return guidtest_; }
			set { guidtest_ = value; }
		}
		#endregion
		#region public string FeedbackEmailAddress { get; set; }
		private string feedbackemailaddress_;

		[XmlElement("feedbackEmailAddress")]
		public string FeedbackEmailAddress {
			get { return feedbackemailaddress_; }
			set { feedbackemailaddress_ = value; }
		}
		#endregion
		#region public string CopyrightText { get; set; }
		private string copyrighttext_;

		[XmlElement("copyrightText")]
		public string CopyrightText {
			get { return copyrighttext_; }
			set { copyrighttext_ = value; }
		}
		#endregion
		#region public string CopyrightTextLong { get; set; }
		private string copyrighttextlong_;

		[XmlElement("copyrightTextLong")]
		public string CopyrightTextLong {
			get { return copyrighttextlong_; }
			set { copyrighttextlong_ = value; }
		}
		#endregion
	}
}