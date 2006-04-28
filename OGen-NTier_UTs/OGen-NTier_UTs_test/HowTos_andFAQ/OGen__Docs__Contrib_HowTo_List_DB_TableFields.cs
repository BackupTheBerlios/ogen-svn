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

namespace OGen.UTs.howtos {
	class HowTo_List_DB_TableFields {
		public HowTo_List_DB_TableFields() {


			cDBConnection _con = new cDBConnection(
				// set your db server type here
				eDBServerTypes.PostgreSQL, 
				// and connectionstring
				"Server=127.0.0.1;Port=5432;User ID=postgres;Password=passpub;Database=OGen-NTier_UTs;"
			);

			// you now have a cDBTableField array populated with all
			// field names and other properties for specified table
			cDBTableField[] _fields = _con.getTableFields("User");

			for (int f = 0; f < _fields.Length; f++) {
				Console.WriteLine(
					"field name: {0}\nis PK: {1}\nis Identity: {2}\nis nullable: {3}", 
					_fields[f].Name, 
					_fields[f].isPK, 
					_fields[f].isIdentity, 
					_fields[f].isNullable
				);
			}

			_con.Dispose(); _con = null;


		}
	}
}