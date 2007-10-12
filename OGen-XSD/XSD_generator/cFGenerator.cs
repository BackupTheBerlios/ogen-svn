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
using OGen.lib.templates;
using OGen.lib.generator;
using OGen.XSD.lib.metadata;

namespace OGen.XSD.lib.generator {
	public class cFGenerator {
		#region	public cFGenerator();
		public cFGenerator() {
			filename_ = string.Empty;
			filenameextendedmetadata_ = string.Empty;
		}
		#endregion

		#region private Properties...
		#endregion
		//#region public Properties...
		#region public string Filename { get; }
		private string filename_;

		public string Filename {
			get { return filename_; }
		}
		#endregion
		#region public string FilenameExtendedMetadata { get; }
		private string filenameextendedmetadata_;

		public string FilenameExtendedMetadata {
			get { return filenameextendedmetadata_; }
		}
		#endregion
		#region public bool hasChanges { get; }
		private bool haschanges_;

		public bool hasChanges {
			get { return haschanges_; }
			set { haschanges_ = value; }
		}
		#endregion
		#region public bool isOpened { get; }
		public bool isOpened {
			get { return (filename_ != string.Empty); }
		}
		#endregion
		#region public XS_Schema Metadata { get ; }
		private XS_Schema metadata_;

		public XS_Schema Metadata {
			get { return metadata_; }
		}
		#endregion
		#region public ExtendedMetadata ExtendedMetadata { get ; }
		private ExtendedMetadata extendedmetadata_;

		public ExtendedMetadata ExtendedMetadata {
			get { return extendedmetadata_; }
		}
		#endregion
		//#endregion

		#region public Delegates...
		public delegate void dNotifyBack(string message_in, bool onANewLine_in);
		#endregion

		#region private Methods...
		#endregion
//		#region public Methods...
		#region //public void New(...);
//		public void New(
//			string applicationPath_in, 
//string documentationName_in, 
//			dNotifyBack notifyBack_in
//		) {
//			if (notifyBack_in != null) notifyBack_in("creating...", true);
//			#region XS_Schema _metadata_temp = new XS_Schema(); ...;
//			XS_Schema _metadata_temp = new XS_Schema();
//			_metadata_temp.DocumentationName = documentationName_in;
//			#endregion
//
//			if (notifyBack_in != null) notifyBack_in("- generating xml file", true);
//			#region string _xmlfile = ...;
//			string _xmlfile = string.Format(
//				"{0}{1}OGenXSD-metadatas{1}MD_{2}.OGenXSD-metadata.xml", 
//				/*0*/applicationPath_in, 
//				/*1*/System.IO.Path.DirectorySeparatorChar, 
//				/*2*/documentationName_in
//			);
//			#endregion
//			_metadata_temp.SaveState_toFile(_xmlfile);
//
//			if (notifyBack_in != null) notifyBack_in("... finished!", true);
//			if (notifyBack_in != null) notifyBack_in("", true);
//
//			Open(
//				_xmlfile, 
//				true, 
//				notifyBack_in
//			);
//		}
		#endregion
//		#region public void Open(...);
		public void Open(
			string filename_in, 
			string filenameextendedmetadata_in, 
			bool force_doNOTsave_in, 
			dNotifyBack notifyBack_in
		) {
			#region Checking...
			if (this.hasChanges) {
				if (!force_doNOTsave_in) {
					throw new Exception(string.Format("{0}.{1}.Open(): - must save before open", this.GetType().Namespace, this.GetType().Name));
				}
			}
			#endregion
			filename_ = filename_in;
			filenameextendedmetadata_ = filenameextendedmetadata_in;

			if (notifyBack_in != null) notifyBack_in("opening...", true);
			if (notifyBack_in != null) notifyBack_in("- reading metadata from xml files", true);
			//metadata_ = new XS_Schema();
			//metadata_.LoadState_fromFile(
			//	filename_
			//);
			metadata_ = XS_Schema.Load_fromFile(filename_);
			extendedmetadata_ = ExtendedMetadata.Load_fromFile(filenameextendedmetadata_);
			if (notifyBack_in != null) notifyBack_in("... finished", true);
		}
//		#endregion
		#region public void Close(...);
		public void Close(bool force_doNOTsave_in) {
			if (
				(this.hasChanges) && 
				(!force_doNOTsave_in)
			) {
				throw new Exception(string.Format("{0}.{1}.Open(): - must save before open", this.GetType().Namespace, this.GetType().Name));
			}

			filename_ = string.Empty;
			filenameextendedmetadata_ = string.Empty;
		}
		#endregion
		#region public void Save(...);
		public void Save() {
			if (this.hasChanges) {

				metadata_.SaveState_toFile(
					filename_
				);
				extendedmetadata_.SaveState_toFile(
					filenameextendedmetadata_
				);

				haschanges_ = false;
			}
		}
		#endregion
//		#region public void Build(cGenerator.dBuild notifyBase_in);
		public void Build(cGenerator.dBuild notifyBase_in) {
			#region string _outputDir = ...;
			string _outputDir = System.IO.Directory.GetParent(
				Path.GetDirectoryName(filename_)
			).FullName;
			#endregion
			#region string _metadataFilePath = ...;
			string _metadata0 = string.Format(
				"{0}{1}OGenXSD-metadatas{1}MD0_{2}.OGenXSD-metadata.xml", 
				/*00*/ _outputDir, 
				/*01*/ Path.DirectorySeparatorChar, 
				/*02*/ metadata_.DocumentationName
			);
			#endregion
			if (notifyBase_in != null) notifyBase_in("generating...", true);
			metadata_.SaveState_toFile(_metadata0);

			new cGenerator(
filename_, 
				string.Empty,
				#if NET20
				System.Configuration.ConfigurationManager.AppSettings
				#else
				System.Configuration.ConfigurationSettings.AppSettings
				#endif
					["Templates"],
				cTemplates.root4xml, 
				_outputDir
			).Build(
				notifyBase_in, 
				metadata_
			);
			if (notifyBase_in != null) notifyBase_in("...finished", true);
		}
//		#endregion
//		#endregion
	}
}
