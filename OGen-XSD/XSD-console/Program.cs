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
using OGen.lib.generator;
using OGen.XSD.lib.metadata;
using OGen.XSD.lib.generator;

namespace OGen.XSD.presentationlayer.console {
	class MainClass {
		[STAThread]
		static void Main(string[] args_in) {
			#region Console.WriteLine("Copyright (C) 2002 Francisco Monteiro");
			Console.WriteLine(
				@"

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ""AS IS"", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

"
			);
			#endregion
			if (args_in.Length == 2) {
				if (
					File.Exists(args_in[0])
					&&
					File.Exists(args_in[1])
				) {
					DoIt(
						args_in[0], 
						args_in[1]
					);
				} else {
					Console.WriteLine("file doesn't exist");
				}
			} else {
				#if DEBUG
					try {
						DoIt(
							System.IO.Path.Combine(
								#if NET20
								System.Configuration.ConfigurationManager.AppSettings
								#else
								System.Configuration.ConfigurationSettings.AppSettings
								#endif
									["ogenPath"],

								@"..\..\OGen-NTier\NTier_metadata\OGenXSD-metadatas\MD_NTier_metadata.OGenXSD-metadata.xsd"
							), 
							System.IO.Path.Combine(
								#if NET20
								System.Configuration.ConfigurationManager.AppSettings
								#else
								System.Configuration.ConfigurationSettings.AppSettings
								#endif
									["ogenPath"],

								@"..\..\OGen-NTier\NTier_metadata\OGenXSD-metadatas\MD_NTier_metadata.OGenXSD-metadata.xml"
							)
						);
					} catch (Exception _ex) {
						Console.WriteLine(_ex.ToString());
					}
	
					Console.WriteLine("Press any key to continue...");
					#if NET20
						Console.ReadKey();
					#else
						Console.ReadLine();
					#endif
				#else
					Console.WriteLine("must provide xml file");
				#endif
			}
		}

		static void DoIt(
			string filePath_in, 
			string filePathExtendedMetadata_in
		) {
			cFGenerator _generator = new cFGenerator();
			_generator.Open(
				filePath_in, 
				filePathExtendedMetadata_in, 
				true, 
				new cFGenerator.dNotifyBack(
					Notify
				)
			);
			_generator.Build(new cGenerator.dBuild(Notify));
		}
		#region private static void Notify(string message_in, bool onANewLine_in);
		private static void Notify(string message_in, bool onANewLine_in) {
			if (onANewLine_in) {
				Console.WriteLine(message_in);
			} else {
				Console.Write(message_in);
			}
		}
		#endregion
	}
}
