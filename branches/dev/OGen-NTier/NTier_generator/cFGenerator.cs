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
using System.Collections;
using System.IO;
using OGen.lib.templates;
using OGen.lib.generator;
using OGen.lib.datalayer;
using OGen.NTier.lib.metadata;

namespace OGen.NTier.lib.generator {
	public class cFGenerator {
		#region	public cFGenerator();
		public cFGenerator() {
			filename_ = string.Empty;
		}
		#endregion

		#region public Delegates...
		public delegate void dNotifyBack(string message_in, bool onANewLine_in);
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
		#region public XS__RootMetadata Metadata { get ; }
		private XS__RootMetadata metadata_;
		public XS__RootMetadata Metadata {
			get { return metadata_; }
		}
		#endregion
		//#endregion

		//#region public Methods...
		//#region public void New(...);
		public void New(
			string applicationPath_in, 
			string applicationName_in, 
			string namespace_in, 
			OGen.NTier.lib.metadata.metadataExtended.XS_dbType[] dbs_in,
			dNotifyBack notifyBack_in
		) {
throw new Exception("// ToDos: not implemented!");
			//int _justadded;

			//if (notifyBack_in != null) notifyBack_in("creating...", true);
			//#region cDBMetadata _metadata_temp = new cDBMetadata(); ...;
			//cDBMetadata _metadata_temp = new cDBMetadata();
			//_metadata_temp.ApplicationName = applicationName_in;
			//_metadata_temp.Namespace = namespace_in;
			//_metadata_temp.DBs.Clear();
			//for (int d = 0; d < dbs_in.Length; d++) {
			//    _justadded = _metadata_temp.DBs.Add(
			//        dbs_in[d].DBServerType, 
			//        false
			//    );
			//    _metadata_temp.DBs[_justadded].CopyFrom(
			//        dbs_in[d]
			//    );

			//    //if (d == 0) {
			//    //    // ToDos: here! document this behaviour and describe it throught unit testing
			//    //    // first item in the array, represents default db connection
			//    //    _metadata_temp.Default_DBServerType = _metadata_temp.DBs[_justadded].DBServerType;
			//    //    _metadata_temp.Default_ConfigMode = _metadata_temp.DBs[_justadded].Connections[0].ConfigMode;
			//    //}
			//}
			//_metadata_temp.GUIDDatalayer = System.Guid.NewGuid().ToString("D").ToUpper();
			//_metadata_temp.GUIDDatalayer_UTs = System.Guid.NewGuid().ToString("D").ToUpper();
			//_metadata_temp.GUIDBusinesslayer = System.Guid.NewGuid().ToString("D").ToUpper();
			//_metadata_temp.GUIDBusinesslayer_UTs = System.Guid.NewGuid().ToString("D").ToUpper();
			//_metadata_temp.GUIDTest = System.Guid.NewGuid().ToString("D").ToUpper();
			//#endregion

			//if (notifyBack_in != null) notifyBack_in("- generating xml file", true);
			//#region string _xmlfile = ...;
			//string _xmlfile = string.Format(
			//    //"{0}{1}OGen-metadatas{1}MD_{2}-{3}.OGen-metadata.xml", 
			//    "{0}{1}OGen-metadatas{1}MD_{2}.OGen-metadata.xml", 
			//    /*0*/applicationPath_in, 
			//    /*1*/System.IO.Path.DirectorySeparatorChar, 
			//    /*2*/applicationName_in

			//    // first item in the array, represents default db connection
			//    ///*3*/, dbs_in[0].DBServerType.ToString()
			//);
			//#endregion
			//_metadata_temp.SaveState_toFile(_xmlfile);

			//if (notifyBack_in != null) notifyBack_in("... finished!", true);
			//if (notifyBack_in != null) notifyBack_in("", true);

			//Open(_xmlfile, true, notifyBack_in);
		}
		//#endregion
//		#region public void Open(...);
		public void Open(
			string filename_in, 
			bool force_doNOTsave_in,
			dNotifyBack notifyBack_in
		) {
			#region Checking...
			if (this.hasChanges) {
				if (!force_doNOTsave_in) {
					throw new Exception(string.Format(
						"{0}.{1}.Open(): - must save before open", 
						this.GetType().Namespace, 
						this.GetType().Name
					));
				}
			}
			#endregion
			filename_ = filename_in;

			if (notifyBack_in != null) notifyBack_in("opening...", true);
			if (notifyBack_in != null) notifyBack_in("- reading configuration from xml file", true);
			metadata_ = XS__RootMetadata.Load_fromFile(
				filename_,
				false
			);

			if (notifyBack_in != null) notifyBack_in("- reading metadata from db", true);
			OGen.NTier.lib.metadata.metadataDB.XS__metadataDB _metadatadb 
				= OGen.NTier.lib.metadata.metadataDB.XS__metadataDB.Load_fromDB(
					null,
					metadata_.MetadataExtendedCollection[0].SubAppName,
					metadata_,
					0,
					metadata_dbconnectionstrings().Convert_toArray()
				);
			for (int i = 0; i < metadata_.MetadataFiles.MetadataFiles.Count; i++) {
				if (
					metadata_.MetadataFiles.MetadataFiles[i].XMLFileType
					==
					OGen.NTier.lib.metadata.metadataDB.XS__metadataDB.METADATADB
				) {
					if (notifyBack_in != null) notifyBack_in("- saving db metadata to xml file", true);
					metadata_.MetadataDBCollection[0].SaveState_toFile(
						Path.Combine(
							Path.GetDirectoryName(filename_), 
							metadata_.MetadataFiles.MetadataFiles[i].XMLFilename
						)
					);
					break;
				}
			}

			if (notifyBack_in != null) notifyBack_in("- re-reading configuration from xml file", true);
			metadata_ = XS__RootMetadata.Load_fromFile(
				filename_,
				false
			);

			if (notifyBack_in != null) notifyBack_in("... finished", true);
		}
//		#endregion
		#region public void Close(...);
		public void Close(bool force_doNOTsave_in) {
			if (
				(this.hasChanges) && 
				(!force_doNOTsave_in)
			) {
				throw new Exception(string.Format(
					"{0}.{1}.Open(): - must save before open", 
					this.GetType().Namespace, 
					this.GetType().Name
				));
			}

			filename_ = string.Empty;
		}
		#endregion
		//#region public void Save(...);
		public void Save() {
			throw new Exception("// ToDos: not implemented!");

			//if (this.hasChanges) {

			//    metadata_.SaveState_toFile(
			//        filename_
			//    );

			//    haschanges_ = false;
			//}
		}
		//#endregion
//		#region public void Build(cGenerator.dBuild notifyBase_in);
		public void Build(cGenerator.dBuild notifyBase_in) {
			#region string _outputDir = ...;
			string _outputDir = System.IO.Directory.GetParent(
				Path.GetDirectoryName(filename_)
			).FullName;
			#endregion
			if (notifyBase_in != null) notifyBase_in("generating...", true);

// ToDos: now! need to save MetadataDB to xml file

			MetaFile[] _metafiles = new MetaFile[metadata_.MetadataFiles.MetadataFiles.Count];
			for (int i = 0; i < metadata_.MetadataFiles.MetadataFiles.Count; i++) {
				_metafiles[i] = new MetaFile(
					Path.Combine(
						Path.GetDirectoryName(filename_), 
						metadata_.MetadataFiles.MetadataFiles[i].XMLFilename
					),
					metadata_.MetadataFiles.MetadataFiles[i].XMLFileType
				);
			}

			new cGenerator(
				#if !NET_1_1
				System.Configuration.ConfigurationManager.AppSettings
				#else
				System.Configuration.ConfigurationSettings.AppSettings
				#endif
					["Templates"],
				metadata_dbconnectionstrings(), 
				_outputDir, 
				_metafiles
			).Build(
				notifyBase_in, 
				metadata_
			);
			if (notifyBase_in != null) notifyBase_in("...finished", true);
		}
//		#endregion
		#region private DBConnectionstrings metadata_dbconnectionstrings();
		private DBConnectionstrings metadata_dbconnectionstrings(
		) {
			//#region int _paramCount = ...;
			//int _paramCount = 0;
			//for (int d = 0; d < metadata_.MetadataExtendedCollection[0].DBs.DBCollection.Count; d++)
			//    for (int c = 0; c < metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection.Count; c++)
			//        if (metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].generateSQL)
			//            _paramCount++;
			//#endregion
			//DBSimpleConnectionstring[] _output = new DBSimpleConnectionstring[_paramCount];
			//_paramCount = 0;

			//for (int d = 0; d < metadata_.MetadataExtendedCollection[0].DBs.DBCollection.Count; d++) {
			//    for (int c = 0; c < metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection.Count; c++) {
			//        if (metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].generateSQL) {
			//            _output[_paramCount] = new DBSimpleConnectionstring(
			//                (DBServerTypes)Enum.Parse(
			//                    typeof(DBServerTypes),
			//                    metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBServerType
			//                ),
			//                metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].Connectionstring
			//            );
			//            _paramCount++;
			//        }
			//    }
			//}

			//return _output;

			DBConnectionstrings _output = new DBConnectionstrings();
			for (int d = 0; d < metadata_.MetadataExtendedCollection[0].DBs.DBCollection.Count; d++) {
				for (int c = 0; c < metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection.Count; c++) {
					if (metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].generateSQL) {
						_output.Add(
							(DBServerTypes)Enum.Parse(
								typeof(DBServerTypes), 
								metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBServerType
							), 
							metadata_.MetadataExtendedCollection[0].DBs.DBCollection[d].DBConnections.DBConnectionCollection[c].Connectionstring
						);
					}
				}
			}

			return _output;
		}
		#endregion
		//#endregion
	}
}