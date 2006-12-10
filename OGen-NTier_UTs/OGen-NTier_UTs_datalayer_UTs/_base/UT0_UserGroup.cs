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

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	public class UT0_UserGroup { public UT0_UserGroup() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_SetGetDelSequence() {
			DO_UserGroup _usergroup;
			try {
				_usergroup = new DO_UserGroup();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_UserGroup\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_usergroup.Connection.Open();
			_usergroup.Connection.Transaction.Begin();



			_usergroup.Fields.IDUser = 123L;
			_usergroup.Fields.IDGroup = 123L;
			_usergroup.Fields.Relationdate = new DateTime(2341, 12, 12);
			_usergroup.Fields.Defaultrelation = true;
			// setObject(); // ToDos: here!



			_usergroup.Connection.Transaction.Rollback();
			_usergroup.Connection.Transaction.Terminate();
			_usergroup.Connection.Close();
			_usergroup.Dispose(); _usergroup = null;
		}
	}
}