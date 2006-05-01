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

using OGen.lib.datalayer;

namespace OGen.UTs.howtos {
	class HowTo_Execute_SQLFunction {
		public HowTo_Execute_SQLFunction() {
			long _iduser = 0L;


			cDBConnection _con = new cDBConnection(
				// set your db server type here
				eDBServerTypes.PostgreSQL, 
				// and connectionstring
				"Server=127.0.0.1;Port=5432;User ID=postgres;Password=passpub;Database=OGen-NTier_UTs;"
			);

			// set your function parameters
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				_con.newDBDataParameter(
					"IDUser_", 
					DbType.Int64, 
					ParameterDirection.Input, 
					_iduser, 
					0
				)
			};

			// call you function
			_con.Execute_SQLFunction(
				"sp0_User_delObject", 
				_dataparameters
			);

			_con.Dispose(); _con = null;


		}
	}
}