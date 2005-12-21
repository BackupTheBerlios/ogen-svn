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
using System.Collections;
using NUnit.Framework;

using OGen.lib.parser;

namespace OGen.lib.parser.UTs {
	[TestFixture]
	public class UT_ParserASPX { public UT_ParserASPX() {}
		#region private string resourse_dir { get; }
		private string resourse_dir { 
			get { 
				return System.Configuration.ConfigurationSettings.AppSettings["OGen_parser_UTs_resourse_dir"];
			}
		}
		#endregion
		#region private string Metadata_File { get; }
		private string metadata_file = null;
		private string Metadata_File {
			get {
				if (metadata_file == null) {
					metadata_file = Path.Combine(
						resourse_dir, 
						Path.Combine(
							"UT_ParserASPX", 
							Path.Combine(
								"resources", 
								"metadata.xml"
							)
						)
					);
				}
				return metadata_file;
			}
		}
		#endregion
		#region private string Template_Dir { get; }
		private string template_dir = null;
		private string Template_Dir {
			get {
				if (template_dir == null) {
					template_dir = Path.Combine(
						resourse_dir, 
						Path.Combine(
							"UT_ParserASPX", 
							"resources"
						)
					);
				}
				return template_dir;
			}
		}
		#endregion
		private string Template_File = "template.aspx";

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			// ...
		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
			// ...
		}
		#endregion

		[Test]
		public void UT_SomeTest() {
			Assert.IsTrue(true);
		}

//		[Test]
//		public void UT_SomeTest() {
//			string _parsedOutput;
//			Hashtable _hash = new Hashtable();
//			_hash.Add("Lines", 3);
//
////Console.WriteLine(Template_Dir);
////Console.WriteLine(Template_File);
//
//			_parsedOutput = ParserASPX.Parse(
//				Template_Dir, 
//				Template_File, 
//				_hash
//			);
//
//Console.WriteLine(_parsedOutput);
//
//			Assert.IsTrue(
//				(
//					_parsedOutput
//					==
//					"1#2#3#"
//				), 
//				"some test"
//			);
//		}
	}
}