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
	public class UT0_vUserDefaultGroup { public UT0_vUserDefaultGroup() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_SetGetDelSequence() {
			DO_vUserDefaultGroup _vuserdefaultgroup;
			try {
				_vuserdefaultgroup = new DO_vUserDefaultGroup();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_vUserDefaultGroup\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_vuserdefaultgroup.Connection.Open();
			_vuserdefaultgroup.Connection.Transaction.Begin();



			_vuserdefaultgroup.IDUser = 123L;
			_vuserdefaultgroup.Login = "123";
			_vuserdefaultgroup.IDGroup = 123L;
			_vuserdefaultgroup.Name = "123";
			_vuserdefaultgroup.Relationdate = new DateTime(1234, 12, 12);
			// setObject(); // ToDos: here!



			_vuserdefaultgroup.Connection.Transaction.Rollback();
			_vuserdefaultgroup.Connection.Transaction.Terminate();
			_vuserdefaultgroup.Connection.Close();
			_vuserdefaultgroup.Dispose(); _vuserdefaultgroup = null;
		}
	}
}