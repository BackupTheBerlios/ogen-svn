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
using System.IO;
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	public enum CaseTypeEnum {
		_invalid_,

		none,

		camelCase,
		PascalCase,
		UPPERCASE,
		lowercase,
	}

	[System.Xml.Serialization.XmlRootAttribute("metadata")]
	public class ExtendedMetadata : iClaSSe_metadata, OGenRootrefCollectionInterface<RootMetadata> {
		public ExtendedMetadata() {
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;

				collections_.root_ref = value;
				specificcase_.root_ref = value;
			}
			get { return root_ref_; }
		}
		#endregion
		public const string METADATA = "metadata";
		#region public static Hashtable Metacache { get; }
		private static Hashtable metacache__;

		public static Hashtable Metacache {
			get {
				if (metacache__ == null) {
					metacache__ = new Hashtable();
				}
				return metacache__;
			}
		}
		#endregion

		#region public CaseTypeEnum CaseType { get; set; }
		private string casetype_;

		[XmlAttribute("caseType")]
		public string casetype__xml {
			get {
				return casetype_;
			}
			set {
				casetype_ = value;
			}
		}

		[XmlIgnore()]
		public CaseTypeEnum CaseType {
			get {
				if (
					(casetype_ == null)
					||
					(casetype_ == string.Empty)
				) {
					return CaseTypeEnum._invalid_;
				} else {
					return (CaseTypeEnum)Enum.Parse(typeof(CaseTypeEnum), casetype_);
				}
			}
			set {
				casetype_ = value.ToString();
			}
		}
		#endregion
		#region public string ApplicationName { get; set; }
		private string applicationname_;

		[XmlAttribute("applicationName")]
		public string ApplicationName {
			get {
				return applicationname_;
			}
			set {
				applicationname_ = value;
			}
		}
		#endregion
		#region public string Namespace { get; set; }
		private string namespace_;

		[XmlAttribute("namespace")]
		public string Namespace {
			get {
				return namespace_;
			}
			set {
				namespace_ = value;
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
		#region public string CopyrightTextLong { get; set; }
		private string copyrighttextlong_;

		[XmlAttribute("copyrightTextLong")]
		public string CopyrightTextLong {
			get {
				return copyrighttextlong_;
			}
			set {
				copyrighttextlong_ = value;
			}
		}
		#endregion

		#region public OGenRootrefCollection<ExtendedMetadata_collection, RootMetadata> Collections { get; }
		private OGenRootrefCollection<ExtendedMetadata_collection, RootMetadata> collections_
			= new OGenRootrefCollection<ExtendedMetadata_collection, RootMetadata>();

		[XmlElement("collection")]
		public ExtendedMetadata_collection[] collections__xml {
			get { return collections_.cols__; }
			set { collections_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<ExtendedMetadata_collection, RootMetadata> Collections {
			get { return collections_; }
		}
		#endregion
		#region public OGenRootrefCollection<ExtendedMetadata_specificCase, RootMetadata> SpecificCase { get; }
		private OGenRootrefCollection<ExtendedMetadata_specificCase, RootMetadata> specificcase_
			= new OGenRootrefCollection<ExtendedMetadata_specificCase, RootMetadata>();

		[XmlElement("specificCase")]
		public ExtendedMetadata_specificCase[] specificcase__xml {
			get { return specificcase_.cols__; }
			set { specificcase_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<ExtendedMetadata_specificCase, RootMetadata> SpecificCase {
			get { return specificcase_; }
		}
		#endregion

		#region public static ExtendedMetadata Load_fromFile(string filePath_in);
		public static ExtendedMetadata Load_fromFile(string filePath_in) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);
			return (ExtendedMetadata)new XmlSerializer(typeof(ExtendedMetadata)).Deserialize(
				_stream
			);
		}
		#endregion
		#region public void SaveState_toFile(string filePath_in);
		public void SaveState_toFile(string filePath_in) {
			FileStream _file = new FileStream(
				filePath_in,
				FileMode.Create,
				FileAccess.Write,
				FileShare.ReadWrite
			);
			new XmlSerializer(typeof(ExtendedMetadata)).Serialize(
				_file,
				this
			);
			_file.Flush();
			_file.Close();
		}
		#endregion

		public void LoadState_fromFile(
			string fileName_in, 
			string objectName_in
		) {
			LoadState_fromFile(fileName_in);
		}
		public void LoadState_fromFile(
			string fileName_in
		) {
			// ToDos: now! performance penalties
			// ToDos: now! harder to maintain

			ExtendedMetadata _metadata = ExtendedMetadata.Load_fromFile(fileName_in);
			casetype_ = _metadata.casetype_;
			applicationname_ = _metadata.applicationname_;
			namespace_ = _metadata.namespace_;
			copyrighttext_ = _metadata.copyrighttext_;
			copyrighttextlong_ = _metadata.copyrighttextlong_;
			collections_ = _metadata.collections_;
			specificcase_ = _metadata.specificcase_;
		}

		public string Read_fromRoot(string what_in) {
			return utils.ReflectThrough(
				this, 
				"ROOT:" + METADATA, 
				null, 
				what_in, 
				"ROOT:" + METADATA, 
				true, 
				true
			);
		}

		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			utils.ReflectThrough(
				this, 
				"ROOT:" + METADATA, 
				iteration_found_in, 
				iteration_in, 
				"ROOT:" + METADATA, 
				false, 
				true
			);
		}
	}
}
