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
	class HowTo_Execute_SQLFunction_returnDataTable {
		public HowTo_Execute_SQLFunction_returnDataTable() {
			long _idgroup_search = 1L;


			cDBConnection _con = new cDBConnection(
				// set your db server type here
				eDBServerTypes.PostgreSQL, 
				// and connectionstring
				"Server=127.0.0.1;Port=5432;User ID=postgres;Password=passpub;Database=OGen-NTier_UTs;"
			);

			// set your function parameters
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				_con.newDBDataParameter(
					"IDGroup_search_", 
					DbType.Int64, 
					ParameterDirection.Input, 
					_idgroup_search, 
					0
				)
			};

			// you now have a DataTable populated
			// with results from your sql function
			DataTable _datatable 
				= _con.Execute_SQLFunction_returnDataTable(
					"sp0_User_Record_open_byGroup_fullmode", 
					_dataparameters
				);

			_con.Dispose(); _con = null;


		}
	}
}