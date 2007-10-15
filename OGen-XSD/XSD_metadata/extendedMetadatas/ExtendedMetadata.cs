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
using OGen.lib.generator;

namespace OGen.XSD.lib.metadata {
	[System.Xml.Serialization.XmlRootAttribute("metadata")]
	public class ExtendedMetadata : iClaSSe_metadata, OGenRootrefCollectionInterface<RootMetadata> {
		//public ExtendedMetadata() {
		//}

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
		public const string ROOT_METADATA = "ROOT." + ExtendedMetadata.METADATA;

		#region public ExtendedMetadata_caseTypeEnum CaseType { get; set; }
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
		public ExtendedMetadata_caseTypeEnum CaseType {
			get {
				if (
					(casetype_ == null)
					||
					(casetype_ == string.Empty)
				) {
					return ExtendedMetadata_caseTypeEnum._invalid_;
				} else {
					return (ExtendedMetadata_caseTypeEnum)Enum.Parse(typeof(ExtendedMetadata_caseTypeEnum), casetype_);
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
		#region public string Prefix { get; set; }
		private string prefix_;

		[XmlAttribute("prefix")]
		public string Prefix {
			get {
				return prefix_;
			}
			set {
				prefix_ = value;
			}
		}
		#endregion
		#region public string PrefixGenerated { get; set; }
		private string prefixgenerated_;

		[XmlAttribute("prefixGenerated")]
		public string PrefixGenerated {
			get {
				return prefixgenerated_;
			}
			set {
				prefixgenerated_ = value;
			}
		}
		#endregion
		#region public string PrefixBase { get; set; }
		private string prefixbase_;

		[XmlAttribute("prefixBase")]
		public string PrefixBase {
			get {
				return prefixbase_;
			}
			set {
				prefixbase_ = value;
			}
		}
		#endregion
		#region public string PrefixBaseGenerated { get; set; }
		private string prefixbasegenerated_;

		[XmlAttribute("prefixBaseGenerated")]
		public string PrefixBaseGenerated {
			get {
				return prefixbasegenerated_;
			}
			set {
				prefixbasegenerated_ = value;
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
		#region public OGenRootrefCollection<ExtendedMetadata_metadataIndex, RootMetadata> MetadataIndex { get; }
		private OGenRootrefCollection<ExtendedMetadata_metadataIndex, RootMetadata> metadataindex_
			= new OGenRootrefCollection<ExtendedMetadata_metadataIndex, RootMetadata>();

		[XmlElement("metadataIndex")]
		public ExtendedMetadata_metadataIndex[] metadataindex__xml {
			get { return metadataindex_.cols__; }
			set { metadataindex_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenRootrefCollection<ExtendedMetadata_metadataIndex, RootMetadata> MetadataIndex {
			get { return metadataindex_; }
		}
		#endregion

		#region public static ExtendedMetadata Load_fromFile(...);
		public static ExtendedMetadata Load_fromFile(
			string filePath_in
		) {
			return Load_fromFile(
				filePath_in,
				null
			);
		}
		public static ExtendedMetadata Load_fromFile(
			string filePath_in,
			RootMetadata root_ref_in
		) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);

			ExtendedMetadata _output;
			try {
				_output = (ExtendedMetadata)new XmlSerializer(typeof(ExtendedMetadata)).Deserialize(
					_stream
				);
			} catch (Exception _ex) {
				throw new Exception(string.Format(
					"---\nERROR READING XML:\n{0}\n---\n{1}",
					filePath_in,
					_ex.Message
				));
			}

			if (root_ref_in != null) _output.root_ref = root_ref_in;
			return _output;
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

		public string Read_fromRoot(string what_in) {
			return OGen.lib.generator.utils.ReflectThrough(
				this, 
				ROOT_METADATA, 
				null, 
				what_in, 
				ROOT_METADATA, 
				true, 
				true
			);
		}

		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			OGen.lib.generator.utils.ReflectThrough(
				this, 
				ROOT_METADATA, 
				iteration_found_in, 
				iteration_in, 
				ROOT_METADATA, 
				false, 
				true
			);
		}

		#region public string CaseTranslate(string word_in);
		private Hashtable casetranslate_;

		public string CaseTranslate(string word_in) {
			if (casetranslate_ == null) {
				casetranslate_ = new Hashtable();
			}
			if (casetranslate_.Contains(word_in)) {
				return (string)casetranslate_[word_in];
			} else {
				ExtendedMetadata_specificCase _case = SpecificCase[word_in];
				string _output = (_case == null) 
					? string.Empty 
					: _case.Translation;
				if (_output != string.Empty) {
					casetranslate_.Add(word_in, _output);
					return _output;
				} else {
					switch (CaseType) {
						case ExtendedMetadata_caseTypeEnum.PascalCase:
							if (word_in.Length > 0) {
								_output
									= word_in[0].ToString().ToUpper()
									+ word_in.Substring(1);
							} else {
								_output = word_in;
							}
							casetranslate_.Add(word_in, _output);
							return _output;
						case ExtendedMetadata_caseTypeEnum.camelCase:
						case ExtendedMetadata_caseTypeEnum.lowercase:
						case ExtendedMetadata_caseTypeEnum.UPPERCASE:
						case ExtendedMetadata_caseTypeEnum._invalid_:
							// ToDos: later!
							throw new Exception("not implemented!");
						case ExtendedMetadata_caseTypeEnum.none:
						default:
							casetranslate_.Add(word_in, word_in);
							return word_in;
					}
				}
			}
		}
		#endregion
	}
}
