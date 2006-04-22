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
	}
}