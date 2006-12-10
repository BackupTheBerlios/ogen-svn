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
using System.Reflection;

using NUnit.Framework;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	[TestFixture]
	public class UT_User : UT0_User {
		public UT_User() {}

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

		#region public void UT_Constraints();
		[Test]
		public void UT_Constraints() {
			string _testid = DateTime.Now.Ticks.ToString();
			bool _constraint;
			for (int c = 0; c < UT0__utils.DBConnections.Length; c++) {
//Console.WriteLine("UT_Constraints: {0}", UT0__utils.DBConnections[c].DBServerType.ToString());

				UT0__utils.DBConnections[c].Open();
				UT0__utils.DBConnections[c].Transaction.Begin();
				DO_User _user = new DO_User(UT0__utils.DBConnections[c]);

				_user.Fields.Login = _testid;
				_user.Fields.Password = _testid;
				_user.insObject(false, out _constraint);
				Assert.IsFalse(_constraint, "there should be no constraint problems");

				_user.clrObject();
				_user.Fields.Login = _testid;
				_user.Fields.Password = _testid;
				_user.insObject(false, out _constraint);
				Assert.IsTrue(_constraint, "constraint problems expected and not found");

				_user.Dispose(); _user = null;
				UT0__utils.DBConnections[c].Transaction.Rollback();
				UT0__utils.DBConnections[c].Transaction.Terminate();
				UT0__utils.DBConnections[c].Close();
			}
		}
		#endregion
		#region public void UT_Reflection_GetProperty();
		[Test]
		public void UT_Reflection_GetProperty() {
			long _initialvalue = 123L;
			long _replacingvalue = 456L;

			DO_User _user = new DO_User();
			_user.Fields.IDUser = _initialvalue;
			//---
			PropertyInfo _iduser 
				= typeof(SO0_User).GetProperty("IDUser");
			//---
			Assert.AreEqual(_initialvalue, (long)_iduser.GetValue(_user.Fields, null));
			_iduser.SetValue(
				_user.Fields,
				Convert.ChangeType(
					_replacingvalue,
					_iduser.PropertyType
				),
				null
			);
			Assert.AreEqual(_replacingvalue, (long)_iduser.GetValue(_user.Fields, null));
			//---
			_user.Dispose(); _user = null;

			#region //oldstuff...
			//PropertyInfo[] properties = typeof(DO_User).GetProperties(
			//    BindingFlags.Public |
			//    BindingFlags.Instance
			//);
			//for (int p = 0; p < properties.Length; p++) {
			//    if (Attribute.IsDefined(
			//        properties[p],
			//        typeof(DOPropertyAttribute)
			//    )) {
			//        Assert.AreEqual("123", properties[p].GetValue(_user, null).ToString());
			//        properties[p].SetValue(
			//            _user,
			//            Convert.ChangeType(
			//                456,
			//                properties[p].PropertyType
			//            ),
			//            null
			//        );
			//        Assert.AreEqual("456", properties[p].GetValue(_user, null).ToString());
			//    }
			//}
			#endregion
		}
		#endregion
		#region public void UT_Reflection_GetCustomAttribute();
		[Test]
		public void UT_Reflection_GetCustomAttribute() {
			Assert.IsTrue(Attribute.IsDefined(typeof(SO0_User).GetProperty("IDUser"), typeof(DOPropertyAttribute)));

			DOPropertyAttribute _att = (DOPropertyAttribute)Attribute.GetCustomAttribute(
			  typeof(SO0_User).GetProperty("IDUser"),
			  typeof(DOPropertyAttribute),
			  true
			);
			Assert.AreEqual("IDUser", _att.Name);
			Assert.IsTrue(_att.isPK);
			Assert.IsTrue(_att.isIdentity);
		}
		#endregion
		#region public void UT_hasChanges();
		[Test]
		public void UT_hasChanges() {
			string _testid = DateTime.Now.Ticks.ToString();
			bool _constraint;
			long _iduser;

			DO_User _user = new DO_User();
			_user.Connection.Open();
			_user.Connection.Transaction.Begin();

			Assert.IsFalse(_user.Fields.hasChanges, "unexpected changes, object just instantiated and no changes have been made");
			_user.Fields.Login = _testid;
			_user.Fields.Password = _testid;
			Assert.IsTrue(_user.Fields.hasChanges, "expected changes, changes have been made over object");
			_iduser = _user.insObject(true, out _constraint);
			Assert.IsFalse(_user.Fields.hasChanges, "unexpected changes, object state commited (insert) over data base");
			_user.Fields.Login = _testid;
			_user.Fields.Password = _testid;
			Assert.IsFalse(_user.Fields.hasChanges, "unexpected changes, no real changes have been made");
			_user.Fields.Password = string.Empty;
			Assert.IsTrue(_user.Fields.hasChanges, "expected changes, real changes have been made");
			_user.updObject(false, out _constraint);
			Assert.IsFalse(_user.Fields.hasChanges, "unexpected changes, object state commited (update) over data base");
			_user.clrObject();
			Assert.IsTrue(_user.Fields.hasChanges, "expected changes, object state cleared");
			_user.getObject_byLogin(_testid);
			Assert.IsFalse(_user.Fields.hasChanges, "unexpected changes, object state sinchronized (select) with data base");
			_user.delObject();
			Assert.IsTrue(_user.Fields.hasChanges, "expected changes, object erased (delete on data base)");
			
			_user.Connection.Transaction.Rollback();
			_user.Connection.Transaction.Terminate();
			_user.Connection.Close();
			_user.Dispose(); _user = null;
		}
		#endregion
		#region public void UT_PropertyNullAssignement();
		[Test]
		public void UT_PropertyNullAssignement() {
			//string _testid = DateTime.Now.Ticks.ToString();
			//bool _constraint;
			//long _iduser;

			DO_User _user = new DO_User();
			try {
				_user.Fields.Login = null;
			} catch {
				Assert.Fail("unexpected null assignement error!");
			}
			_user.Dispose(); _user = null;
		}
		#endregion
	}
}