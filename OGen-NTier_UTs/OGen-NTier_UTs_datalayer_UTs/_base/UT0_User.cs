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
	public class UT0_User { public UT0_User() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_InsGetDelSequence() {
			DO_User _user;
			try {
				_user = new DO_User();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_User\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_user.Connection.Open();
			_user.Connection.Transaction.Begin();



			_user.Fields.Login = "123";
			_user.Fields.Password = "123";
			_user.Fields.SomeNullValue = 123;
			// handle Constraints // ToDos: here!



			_user.Connection.Transaction.Rollback();
			_user.Connection.Transaction.Terminate();
			_user.Connection.Close();
			_user.Dispose(); _user = null;
		}
	}
}