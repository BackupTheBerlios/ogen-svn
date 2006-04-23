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

		private cDBConnection[] dbconnections_;
		private string testid_;

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			testid_ = DateTime.Now.Ticks.ToString();// Guid.NewGuid().ToString();
			//---
			eDBServerTypes _dbtype;
			string[] _dbtypes = OGen.lib.datalayer.utils.DBServerTypes.Names_supportedForGeneration();
			dbconnections_ = new cDBConnection[_dbtypes.Length];
			for (int d = 0; d < _dbtypes.Length; d++) {
				_dbtype 
					= OGen.lib.datalayer.utils.DBServerTypes.convert.FromName(_dbtypes[d]);

				dbconnections_[d] = new cDBConnection(
					_dbtype,
					System.Configuration.ConfigurationSettings.AppSettings[
						string.Format("DBConnectionstring-{0}", _dbtypes[d])
					]
				);
			}

		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
			for (int d = 0; d < dbconnections_.Length; d++) {
				dbconnections_[d].Dispose();
				dbconnections_[d] = null;
			}
		}
		#endregion

		#region public void UT_Constraints();
		[Test]
		public void UT_Constraints() {
			string _testid = DateTime.Now.Ticks.ToString();
			bool _constraint;
			for (int c = 0; c < dbconnections_.Length; c++) {
				dbconnections_[c].Open();
				dbconnections_[c].Transaction.Begin();
				DO_User _user = new DO_User(dbconnections_[c]);

				_user.Login = _testid;
				_user.Password = _testid;
				_user.insObject(false, out _constraint);
				Assert.IsFalse(_constraint, "there should be no constraint problems");

				_user.clrObject();
				_user.Login = _testid;
				_user.Password = _testid;
				_user.insObject(false, out _constraint);
				Assert.IsTrue(_constraint, "constraint problems expected and not found");

				_user.Dispose(); _user = null;
				dbconnections_[c].Transaction.Rollback();
				dbconnections_[c].Transaction.Terminate();
				dbconnections_[c].Close();
			}
		}
		#endregion
		#region public void UT_Reflection_GetProperty();
		[Test]
		public void UT_Reflection_GetProperty() {
			long _initialvalue = 123L;
			long _replacingvalue = 456L;

			DO_User _user = new DO_User();
			_user.IDUser = _initialvalue;
			//---
			PropertyInfo _iduser = typeof(DO_User).GetProperty("IDUser");
			//---
			Assert.AreEqual(_initialvalue, (long)_iduser.GetValue(_user, null));
			_iduser.SetValue(
				_user,
				Convert.ChangeType(
					_replacingvalue,
					_iduser.PropertyType
				),
				null
			);
			Assert.AreEqual(_replacingvalue, (long)_iduser.GetValue(_user, null));
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
			Assert.IsTrue(Attribute.IsDefined(typeof(DO_User).GetProperty("IDUser"), typeof(DOPropertyAttribute)));

			DOPropertyAttribute _att = (DOPropertyAttribute)Attribute.GetCustomAttribute(
			  typeof(DO_User).GetProperty("IDUser"),
			  typeof(DOPropertyAttribute),
			  true
			);
			Assert.AreEqual("IDUser", _att.Name);
			Assert.IsTrue(_att.isPK);
			Assert.IsTrue(_att.isIdentity);
		}
		#endregion
	}
}