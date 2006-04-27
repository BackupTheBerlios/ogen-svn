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

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.test {
	public class HowTo_UseTransactions_betweenDOs_operations {
		public HowTo_UseTransactions_betweenDOs_operations() {
			string _testid = DateTime.Now.Ticks.ToString();
			bool _constraint;
			long _iduser;
			long _idgroup;

			// we need a shared connection between Data Objects
			cDBConnection _con = new cDBConnection(
				DO__utils.DBServerType, 
				DO__utils.DBConnectionstring
			);

			// before beginning a transaction we need to open the connection
			_con.Open();

			// beginning transaction
			_con.Transaction.Begin();

			// sharing connection with User Data Object
			DO_User _user = new DO_User(_con);
			// performing some operations on User Data Object
			_user.Login = _testid;
			_user.Password = _testid;
			_iduser = _user.insObject(true, out _constraint);
			// handling constraint code should be added here
			_user.Dispose(); _user = null;

			// sharing connection with Group Data Object
			DO_Group _group = new DO_Group(_con);
			// performing some operations on User Data Object
			_group.Name = _testid;
			_idgroup = _group.insObject(true);
			_group.Dispose(); _group = null;

			// sharing connection with Group Data Object
			DO_UserGroup _usergroup = new DO_UserGroup(_con);
			// performing some operations on User Data Object
			_usergroup.IDGroup = _idgroup;
			_usergroup.IDUser = _iduser;
			_usergroup.Relationdate = DateTime.Now;
			_usergroup.Defaultrelation = false;
			_usergroup.setObject(false);
			_usergroup.Dispose(); _usergroup = null;

			// rollback transaction, we don't need such data in db, this is just an how to sample
			_con.Transaction.Rollback();

			// terminate transaction
			_con.Transaction.Terminate();

			// closing connection
			_con.Close();

			_con.Dispose(); _con = null;
		}
	}
}