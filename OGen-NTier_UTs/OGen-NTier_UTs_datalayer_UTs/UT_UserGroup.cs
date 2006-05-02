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
using System.Data;
using NUnit.Framework;

using OGen.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	[TestFixture]
	public class UT_UserGroup : UT0_UserGroup {
		public UT_UserGroup() {}

		private string testid_;

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			testid_ = DateTime.Now.Ticks.ToString();// Guid.NewGuid().ToString();
		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
		}
		#endregion

		#region public void UT_NullableFields();
		[Test]
		public void UT_NullableFields() {
			bool _contraint;
			long _iduser;
			long _idgroup;

			for (int c = 0; c < UT0__utils.DBConnections.Length; c++) {
//Console.WriteLine("UT_NullableFields: {0}", UT0__utils.DBConnections[c].DBServerType.ToString());

				UT0__utils.DBConnections[c].Open();
				UT0__utils.DBConnections[c].Transaction.Begin();

				#region _iduser = new DO_User(UT0__utils.DBConnections[c]).insObject(true);
				DO_User _user = new DO_User(UT0__utils.DBConnections[c]);
				_user.Login = testid_;
				_user.Password = testid_;
				_iduser = _user.insObject(true, out _contraint);
				_user.Dispose(); _user = null;
				#endregion
				#region _idgroup = new DO_Group(UT0__utils.DBConnections[c]).insObject(true);
				DO_Group _group = new DO_Group(UT0__utils.DBConnections[c]);
				_group.Name = testid_;
				_idgroup = _group.insObject(true);
				_group.Dispose(); _group = null;
				#endregion

				DO_UserGroup _usergroup = new DO_UserGroup(UT0__utils.DBConnections[c]);
				_usergroup.IDUser = _iduser;
				_usergroup.IDGroup = _idgroup;
				_usergroup.Relationdate_isNull = true;
				_usergroup.Defaultrelation_isNull = true;
				_usergroup.setObject(true);

				#region test1...
				_usergroup.clrObject();
				_usergroup.getObject(_iduser, _idgroup);
				Assert.IsTrue(_usergroup.Relationdate_isNull, "DO_UserGroup.Relationdate expected to be nullable");
				Assert.IsTrue(_usergroup.Defaultrelation_isNull, "DO_UserGroup.Defaultrelation expected to be nullable");
				#endregion
				#region test2...
				for (int i = 0; i < 2; i++) { // test both fullmode and not
					_usergroup.Record.Open_byUser_Defaultrelation(
						_iduser,
						null,
						(i == 0) // test both fullmode and not
					);
					while (_usergroup.Record.Read()) {
						Assert.IsTrue(_usergroup.Relationdate_isNull, "DO_UserGroup.Relationdate expected to be nullable");
						Assert.IsTrue(_usergroup.Defaultrelation_isNull, "DO_UserGroup.Defaultrelation expected to be nullable");
					}
					_usergroup.Record.Close();
				}
				#endregion
				#region test3...
				Assert.IsTrue(
					_usergroup.Record.hasObject_byUser_Defaultrelation(
						_iduser,
						_idgroup,
						_iduser,
						null
					), 
					"test error: 1"
				);
				Assert.AreEqual(
					1L,
					_usergroup.Record.Count_byUser_Defaultrelation(
						_iduser,
						null
					), 
					"test error: 2"
				);
				#endregion
				#region test4...
				DateTime _now = DateTime.Now;
				_usergroup.Record.Update_SomeUpdateTest_byUser_Defaultrelation(
					_iduser,
					null,
					_now
				);

				Assert.IsTrue(
					_usergroup.Record.hasObject_byUser_Defaultrelation(
						_iduser,
						_idgroup,
						_iduser,
						_now
					), 
					"test error: 3"
				);
				Assert.AreEqual(
					1L,
					_usergroup.Record.Count_byUser_Defaultrelation(
						_iduser,
						_now
					), 
					"test error: 4"
				);
				#endregion

				_usergroup.Dispose(); _usergroup = null;

				UT0__utils.DBConnections[c].Transaction.Rollback();
				UT0__utils.DBConnections[c].Transaction.Terminate();
				UT0__utils.DBConnections[c].Close();
			}
		}
		#endregion
	}
}