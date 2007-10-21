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

namespace OGen.Doc.lib.documentation {
	public class XS0_documentationType
#if !NET_1_1
#endif
	{
		public XS0_documentationType (
		) {
		}
		#region public string DocumentationName { get; set; }
		private string documentationname_;

		[XmlAttribute("documentationName")]
		public string DocumentationName {
			get {
				return documentationname_;
			}
			set {
				documentationname_ = value;
			}
		}
		#endregion
		#region public string ProjectURL { get; set; }
		private string projecturl_;

		[XmlAttribute("projectURL")]
		public string ProjectURL {
			get {
				return projecturl_;
			}
			set {
				projecturl_ = value;
			}
		}
		#endregion
		#region public string CopyrightText { get; set; }
		private string copyrighttext_;

		[XmlAttribute("copyrightText")]
		public string CopyrightText {
			get {
				return copyrighttext_;
			}
			set {
				copyrighttext_ = value;
			}
		}
		#endregion
		#region public string FeedbackEmailAddress { get; set; }
		private string feedbackemailaddress_;

		[XmlAttribute("feedbackEmailAddress")]
		public string FeedbackEmailAddress {
			get {
				return feedbackemailaddress_;
			}
			set {
				feedbackemailaddress_ = value;
			}
		}
		#endregion
		#region public string Version { get; set; }
		private string version_;

		[XmlAttribute("version")]
		public string Version {
			get {
				return version_;
			}
			set {
				version_ = value;
			}
		}
		#endregion
		#region public string Date { get; set; }
		private string date_;

		[XmlAttribute("date")]
		public string Date {
			get {
				return date_;
			}
			set {
				date_ = value;
			}
		}
		#endregion
		#region public string Configs { get; set; }
		private string configs_;

		[XmlElement("configs")]
		public string Configs {
			get { return configs_; }
			set { configs_ = value; }
		}
		#endregion
		#region public string Subjects { get; set; }
		private string subjects_;

		[XmlElement("subjects")]
		public string Subjects {
			get { return subjects_; }
			set { subjects_ = value; }
		}
		#endregion
		#region public string Authors { get; set; }
		private string authors_;

		[XmlElement("authors")]
		public string Authors {
			get { return authors_; }
			set { authors_ = value; }
		}
		#endregion
		#region public string CodeSamples { get; set; }
		private string codesamples_;

		[XmlElement("codeSamples")]
		public string CodeSamples {
			get { return codesamples_; }
			set { codesamples_ = value; }
		}
		#endregion
		#region public string Links { get; set; }
		private string links_;

		[XmlElement("links")]
		public string Links {
			get { return links_; }
			set { links_ = value; }
		}
		#endregion
		#region public string FAQSubjects { get; set; }
		private string faqsubjects_;

		[XmlElement("faqSubjects")]
		public string FAQSubjects {
			get { return faqsubjects_; }
			set { faqsubjects_ = value; }
		}
		#endregion
	}
}