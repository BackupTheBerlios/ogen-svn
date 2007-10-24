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
using System.Xml;
using OGen.lib.collections;
using OGen.lib.generator;
using OGen.lib.templates;
using OGen.Doc.lib.generator;
using OGen.Doc.lib.metadata;
using OGen.Doc.lib.metadata.documentation;

namespace Doc_test {
	public class MainClass {
		[STAThread]
		static void Main(string[] args) {
			string filename_ 
				= @"X:\OGen.berlios.de\OGen-NTier\OGen-NTier-Doc\OGenDoc-metadatas\MD_OGen.OGenDoc-metadata.xml";
			string _outputDir = System.IO.Directory.GetParent(
				Path.GetDirectoryName(filename_)
			).FullName;

			XS__RootMetadata rootmetadata_ = XS__RootMetadata.Load_fromFile(
				filename_,
				false
			);
			
Console.WriteLine(OGen.Doc.lib.metadata.utils.translate(
	@"---${code::1}
---
${code::1}
---
${code::1}
---",
	rootmetadata_.DocumentationCollection[0]
));
			

			Console.WriteLine(rootmetadata_.Read_fromRoot("ROOT.documentation[0].documentationName"));

//			MetaFile[] _metafiles = new MetaFile[rootmetadata_.MetadataFiles.MetadataFiles.Count];
//			for (int i = 0; i < rootmetadata_.MetadataFiles.MetadataFiles.Count; i++) {
//				_metafiles[i] = new MetaFile(
//					Path.Combine(
//						Path.GetDirectoryName(filename_), 
//						rootmetadata_.MetadataFiles.MetadataFiles[i].XMLFilename
//					),
//					XS__documentation.DOCUMENTATION
//				);
//			}
//			cGenerator _generator = new cGenerator(
//				#if !NET_1_1
//				System.Configuration.ConfigurationManager.AppSettings
//				#else
//				System.Configuration.ConfigurationSettings.AppSettings
//				#endif
//					["Templates"],
//				_outputDir, 
//				_metafiles
//			);
//			_generator.Build(
//				Notify, 
//				rootmetadata_
//			);
			return;
		}
	}
}
