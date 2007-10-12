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

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	[System.Xml.Serialization.XmlRootAttribute("metadata")]
	public class ExtendedMetadata : iClaSSe_metadata {
		public ExtendedMetadata() {
		}

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
			applicationname_ = _metadata.applicationname_;
			namespace_ = _metadata.namespace_;
			copyrighttext_ = _metadata.copyrighttext_;
			copyrighttextlong_ = _metadata.copyrighttextlong_;
		}

		public string Read_fromRoot(string what_in) {
			return utils.ReflectThrough(
				this, 
				"ROOT", 
				null, 
				what_in, 
				"ROOT", 
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
				"ROOT", 
				iteration_found_in, 
				iteration_in, 
				"ROOT", 
				false, 
				true
			);
		}
	}
}
