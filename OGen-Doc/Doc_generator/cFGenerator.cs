#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

This file is part of OGen.

OGen is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 2 of the License, or 
(at your option) any later version.

OGen is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details.

You should have received a copy of the GNU General Public License 
along with OGen; if not, write to the

	Free Software Foundation, Inc., 
	59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA 

							- or -

	http://www.fsf.org/licensing/licenses/gpl.txt

*/
#endregion
using System;
using System.IO;
using OGen.lib.config;
using OGen.lib.templates;
using OGen.lib.generator;
using OGen.Doc.lib.metadata;

namespace OGen.Doc.lib.generator {
	public class cFGenerator {
		#region	public cFGenerator();
		public cFGenerator() {
			filename_ = string.Empty;
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
		#region public DocMetadata Metadata { get ; }
		private DocMetadata metadata_;
		public DocMetadata Metadata {
			get { return metadata_; }
		}
		#endregion
		//#endregion

		#region public Delegates...
		public delegate void dNotifyBack(string message_in, bool onANewLine_in);
		#endregion

		#region private Methods...
		#endregion
		#region public Methods...
		#region public void New(...);
		public void New(
			string applicationPath_in, 
			string documentationName_in, 
			dNotifyBack notifyBack_in
		) {
			if (notifyBack_in != null) notifyBack_in("creating...", true);
			#region DocMetadata _metadata_temp = new DocMetadata(); ...;
			DocMetadata _metadata_temp = new DocMetadata();
			_metadata_temp.DocumentationName = documentationName_in;
			#endregion

			if (notifyBack_in != null) notifyBack_in("- generating xml file", true);
			#region string _xmlfile = ...;
			string _xmlfile = string.Format(
				"{0}{1}OGenDoc-metadatas{1}MD_{2}.OGenDoc-metadata.xml", 
				/*0*/applicationPath_in, 
				/*1*/System.IO.Path.DirectorySeparatorChar, 
				/*2*/documentationName_in
			);
			#endregion
			_metadata_temp.SaveState_toFile(_xmlfile);

			if (notifyBack_in != null) notifyBack_in("... finished!", true);
			if (notifyBack_in != null) notifyBack_in("", true);

			Open(
				_xmlfile, 
				true, 
				notifyBack_in
			);
		}
		#endregion
		#region public void Open(...);
		public void Open(
			string filename_in, 
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

			if (notifyBack_in != null) notifyBack_in("opening...", true);
			if (notifyBack_in != null) notifyBack_in("- reading metadata from xml file", true);
			metadata_ = new DocMetadata();
			metadata_.LoadState_fromFile(
				filename_
			);
			if (notifyBack_in != null) notifyBack_in("... finished", true);
		}
		#endregion
		#region public void Close(...);
		public void Close(bool force_doNOTsave_in) {
			if (
				(this.hasChanges) && 
				(!force_doNOTsave_in)
			) {
				throw new Exception(string.Format("{0}.{1}.Open(): - must save before open", this.GetType().Namespace, this.GetType().Name));
			}

			filename_ = string.Empty;
		}
		#endregion
		#region public void Save(...);
		public void Save() {
			if (this.hasChanges) {

				metadata_.SaveState_toFile(
					filename_
				);

				haschanges_ = false;
			}
		}
		#endregion
		#region public void Build(cGenerator.dBuild notifyBase_in);
		public void Build(cGenerator.dBuild notifyBase_in) {
			#region string _outputDir = ...;
			string _outputDir = System.IO.Directory.GetParent(
				Path.GetDirectoryName(filename_)
			).FullName;
			#endregion
			#region string _metadataFilePath = ...;
			string _metadata0 = string.Format(
				"{0}{1}OGenDoc-metadatas{1}MD0_{2}.OGenDoc-metadata.xml", 
				/*00*/ _outputDir, 
				/*01*/ Path.DirectorySeparatorChar, 
				/*02*/ metadata_.DocumentationName
			);
			#endregion
			if (notifyBase_in != null) notifyBase_in("generating...", true);
			metadata_.SaveState_toFile(_metadata0);

			new cGenerator(
				filename_, 
				DocMetadata.root4xml, 
				ConfigurationSettingsBinder.Read("Templates"), 
				cTemplates.root4xml, 
				_outputDir
			).Build(
				notifyBase_in, 
				metadata_
			);
			if (notifyBase_in != null) notifyBase_in("...finished", true);
		}
		#endregion
		#endregion
	}
}
