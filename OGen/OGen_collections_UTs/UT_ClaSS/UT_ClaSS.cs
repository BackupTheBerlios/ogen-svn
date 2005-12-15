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
using NUnit.Framework;

using OGen.lib.collections;
using OGen.lib.collections.UTs.ClaSS.metadatas;

namespace OGen.lib.collections.UTs {
	[TestFixture]
	public class UT_ClaSS { public UT_ClaSS() {}
		private iTables[] tables_;
		private string output_dir_temp;
		private string[] file1_;
		private string[] file2_;
		private string[] message_output_ = new string[] { 
			"R-inherit", 
			"R-aggregate", 
			"noR-inherit", 
			"noR-aggregate", 
			"e-inherit", 
			"e-aggregate"
		};

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			//#region tables_[n] = new cTables_...();
			tables_ = new iTables[message_output_.Length];
			tables_[0] = new cTables_R_inherit();
			tables_[1] = new cTables_R_aggregate();
			tables_[2] = new cTables_noR_inherit();
			tables_[3] = new cTables_noR_aggregate();
			tables_[4] = new cTables_e_inherit();
			tables_[5] = new cTables_e_aggregate();
			//#endregion
			#region file1_[n] = ...; file2_[n] = ...;
			output_dir_temp = System.Configuration.ConfigurationSettings.AppSettings["output_dir_temp"];

			file1_ = new string[tables_.Length];
			file2_ = new string[tables_.Length];
			for (int T = 0; T < tables_.Length; T++) {
				file1_[T] = Path.Combine(output_dir_temp, string.Format("temp-{0}-1.xml", message_output_[T]));
				file2_[T] = Path.Combine(output_dir_temp, string.Format("temp-{0}-2.xml", message_output_[T]));
			}
			#endregion
			for (int T = 0; T < tables_.Length; T++) {
				#region tables_[T].Add("User");
				tables_[T].Add("User");
				tables_[T]["User"].Fields.Add("IDUser");
				tables_[T]["User"].Fields["IDUser"].DBType_inDB = 1;
				tables_[T]["User"].Fields["IDUser"].isPK = true;
				tables_[T]["User"].Fields.Add("EMail");
				tables_[T]["User"].Fields["EMail"].DBType_inDB = 2;
				tables_[T]["User"].Fields["EMail"].isPK = false;
				tables_[T]["User"].Fields.Add("Login");
				tables_[T]["User"].Fields["Login"].DBType_inDB = 3;
				tables_[T]["User"].Fields["Login"].isPK = false;
				#endregion
				#region tables_[T].Add("Group");
				tables_[T].Add("Group");
				tables_[T]["Group"].Fields.Add("IDGroup");
				tables_[T]["Group"].Fields["IDGroup"].DBType_inDB = 1;
				tables_[T]["Group"].Fields["IDGroup"].isPK = true;
				tables_[T]["Group"].Fields.Add("Name");
				tables_[T]["Group"].Fields["Name"].DBType_inDB = 2;
				tables_[T]["Group"].Fields["Name"].isPK = false;
				#endregion
				tables_[T].SaveState_toFile(file1_[T], "dbER");
			}
		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
			//File.Delete(file1_);
			//File.Delete(file2_);
		}
		#endregion

		[Test]
		public void UT_ConfigFile() {
			int i = 1;

			Assert.IsNotNull(output_dir_temp,							">> READTHIS! >> no config file ({0})", i++);
			Assert.IsFalse((output_dir_temp.Trim() == string.Empty),	">> READTHIS! >> config file not ready ({0})", i++);
			Assert.IsTrue(Directory.Exists(output_dir_temp),			">> READTHIS! >> config file needs tweeking ({0})", i++);
		}

		[Test]
		public void UT_Tables_Count() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((tables_[T].Count == 2), ">> READTHIS! >> invalid number of tables, either Tables.SaveState_toFile or Tables.Add not working ({0})", message_output_[T]);
			}
		}
		[Test]
		public void UT_Fields_Count() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((tables_[T]["User"].Fields.Count == 3), ">> READTHIS! >> invalid number of fields ({0})", message_output_[T]);
			}
		}

		[Test]
		public void UT_Tables_Null() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsNotNull(tables_[T], ">> READTHIS! >> Tables Null Referece (1 - {0})", message_output_[T]);
				Assert.IsNotNull(tables_[T]["User"], ">> READTHIS! >> Tables Null Referece (2 - {0})", message_output_[T]);
			}
		}
		[Test]
		public void UT_Fields_Null() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsNotNull(tables_[T]["User"].Fields, ">> READTHIS! >> Fields Null Referece (1 - {0})", message_output_[T]);
				Assert.IsNotNull(tables_[T]["User"].Fields["IDUser"], ">> READTHIS! >> Fields Null Referece (2 - {0})", message_output_[T]);
			}
		}

		[Test]
		public void UT_Tables_Search() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((tables_[T].Search("User") >= 0), ">> READTHIS! >> either Tables.Search or Tables.Add not working ({0})", message_output_[T]);
			}
		}
		[Test]
		public void UT_Fields_Search() {
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((tables_[T]["User"].Fields.Search("IDUser") >= 0), ">> READTHIS! >> either Fields.Search or Fields.Add not working ({0})", message_output_[T]);
			}
		}

		[Test]
		public void UT_Field_isPK() {
			string _message = ">> READTHIS! >> Field.isPK wrong assignment ({0})";
			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((tables_[T]["User"].Fields["IDUser"].isPK), _message, message_output_[T]);
				Assert.IsFalse((tables_[T]["User"].Fields["EMail"].isPK), _message, message_output_[T]);
			}
		}

		[Test]
		public void UT_Save() {
			string _message = ">> READTHIS! >> Tables.SaveState_toFile not working ({0} - {1})";

			for (int T = 0; T < tables_.Length; T++) {
				Assert.IsTrue((File.Exists(file1_[T])), _message, "test xml file not found", message_output_[T]);
			}
		}
		[Test]
		public void UT_SaveAndLoad() {
			string _message = ">> READTHIS! >> either Tables.SaveState_toFile or Tables.LoadState_fromFile not working ({0} - {1})";

			for (int T = 0; T < tables_.Length; T++) {
				iTables _tables2 = (iTables)Activator.CreateInstance(
					tables_[T].GetType()
				);
				_tables2.LoadState_fromFile(file1_[T], "dbER");
				_tables2.SaveState_toFile(file2_[T], "dbER");
				Assert.IsTrue((File.Exists(file2_[T])), _message, "double test xml file not found", message_output_[T]);

				#region string _file1_xml = ...;
				string _file1_xml = new StreamReader(new FileStream(
					file1_[T],
					FileMode.Open,
					FileAccess.Read,
					FileShare.ReadWrite
				)).ReadToEnd();
				#endregion
				#region string _file2_xml = ...;
				string _file2_xml = new StreamReader(new FileStream(
					file1_[T],
					FileMode.Open,
					FileAccess.Read,
					FileShare.ReadWrite
				)).ReadToEnd();
				#endregion

				Assert.IsTrue((_file1_xml.Length > 0), _message, "empty xml file", message_output_[T]);
				Assert.IsTrue((_file1_xml == _file2_xml), _message, 2, message_output_[T]);

				Assert.IsTrue((_tables2.Count == tables_[T].Count), _message, "load returns diferent number of tables", message_output_[T]);
				for (int t = 0; t < _tables2.Count; t++) {
					int t1 = tables_[T].Search(_tables2[t].Name);
					Assert.IsTrue((_tables2[t].Fields.Count == tables_[T][t1].Fields.Count), _message, "load returns diferent number of fields", message_output_[T]);

					for (int f = 0; f < _tables2[t].Fields.Count; f++) {
						int f1 = tables_[T][t1].Fields.Search(_tables2[t].Fields[f].Name);
						Assert.IsTrue((_tables2[t].Fields[f].isPK == tables_[T][t1].Fields[f1].isPK), _message, 5, message_output_[T]);
						Assert.AreEqual(_tables2[t].Fields[f].DBType_inDB, tables_[T][t1].Fields[f1].DBType_inDB, _message, 6, message_output_[T]);
					}
				}
			}
		}

//		[Test]
//		public void UT_xxx() {
//			string _message = ">> READTHIS! >> ... ({0} - {1})";
//
//			for (int T = 2; T < 4; T++) {
//				Console.WriteLine(
//					((cClaSS_noR)tables_[T]).Property_standard.Count
//				);
//			}
//		}
	}
}