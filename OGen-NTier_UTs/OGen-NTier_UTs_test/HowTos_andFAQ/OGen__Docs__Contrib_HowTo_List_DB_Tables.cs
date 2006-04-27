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

namespace OGen.UTs.test {
	class HowTo_List_DB_Tables {
		public HowTo_List_DB_Tables() {


			cDBConnection _con = new cDBConnection(
				// set your db server type here
				eDBServerTypes.PostgreSQL, 
				// and connectionstring
				"Server=127.0.0.1;Port=5432;User ID=postgres;Password=passpub;Database=OGen-NTier_UTs;"
			);

			// you now have a cDBTable array populated with all
			// table names and other properties for your database
			cDBTable[] _tables = _con.getTables();

			for (int t = 0; t < _tables.Length; t++) {
				Console.WriteLine(
					"table name: {0}\nis this a view and not a table: {1}", 
					_tables[t].Name, 
					_tables[t].isVirtualTable
				);
			}

			_con.Dispose(); _con = null;


		}
	}
}