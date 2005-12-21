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
using OGen.lib.generator;
using OGen.Doc.lib.metadata;
using OGen.Doc.lib.generator;

namespace OGen.Doc.presentationlayer.console {
	class MainClass {
		[STAThread]
		static void Main(string[] args_in) {
			#region Console.WriteLine("Copyright (C) 2002 Francisco Monteiro");
			Console.WriteLine(
				@"

	OGen
	Copyright (C) 2002 Francisco Monteiro

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	at your option) any later version.

	This program is distributed in the hope that it will be useful, 
	but WITHOUT ANY WARRANTY; without even the implied warranty of 
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License 
	along with this program; if not, write to the Free Software 
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA 

"
			);
			#endregion
			if (args_in.Length == 1) {
				if (File.Exists(args_in[0])) {
					DoIt(args_in[0]);
				} else {
					Console.WriteLine("file doesn't exist");
				}
			} else {
#if DEBUG
				DoIt(@"X:\MyDocuments\_RAM-unsorted-COPY\MySharedProjects\OGen-NTier.SVN\OGen-NTier-Doc\OGenDoc-metadatas\MD_OGen-NTier.OGenDoc-metadata.xml");
				DoIt(@"X:\MyDocuments\_RAM-unsorted-COPY\MySharedProjects\OGen.SVN\OGen-Doc\OGenDoc-metadatas\MD_OGen.OGenDoc-metadata.xml");
#else
				Console.WriteLine("must provide xml file");
#endif
			}
		}

		static void DoIt(string filePath_in) {
			cFGenerator _generator = new cFGenerator();
			_generator.Open(
				filePath_in, 
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