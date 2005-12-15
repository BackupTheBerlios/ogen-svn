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
using NUnit.Framework;

using OGen.lib.datalayer;

namespace OGen.lib.datalayer.UTs {
	[TestFixture]
	public class UT_DBConnection { public UT_DBConnection() {}
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
			cDBConnection connection = new cDBConnection(
				utils.DBServerTypes.convert.FromName(
					System.Configuration.ConfigurationSettings.AppSettings["DBServerType"]
				),
				System.Configuration.ConfigurationSettings.AppSettings["DBConnectionstring"]
			);
			connection.Open();
			string[] dbs = connection.getBDs();
			connection.Close();
			for (int d = 0; d < dbs.Length; d++) {
				Console.WriteLine(dbs[d]);
			}
			Assert.IsTrue(true, "some test");
		}
	}
}
