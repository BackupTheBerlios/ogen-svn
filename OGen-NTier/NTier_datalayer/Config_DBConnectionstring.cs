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

namespace OGen.NTier.lib.datalayer {
	public struct Config_DBConnectionstring {
		#region public Config_DBConnectionstring(...);
		public Config_DBConnectionstring(
			bool isDefault_in,
			bool generatedSQL_in, 
			bool isIndexed_andReadOnly_in,
			string connectionstring_in
		) {
			isdefault_ = isDefault_in;
			generatedsql_ = generatedSQL_in;
			isindexed_andreadonly_ = isIndexed_andReadOnly_in;
			connectionstring_ = connectionstring_in;
		}
		#endregion

		#region public Properties...
		#region public bool isDefault { get; }
		private bool isdefault_;
		public bool isDefault {
			get { return isdefault_; }
		}
		#endregion
		#region public bool GeneratedSQL { get; }
		private bool generatedsql_;
		public bool GeneratedSQL {
			get { return generatedsql_; }
		}
		#endregion
		#region public bool isIndexed_andReadOnly { get; }
		private bool isindexed_andreadonly_;
		public bool isIndexed_andReadOnly {
			get { return isindexed_andreadonly_; }
		}
		#endregion
		#region public string Connectionstring { get; }
		private string connectionstring_;
		public string Connectionstring {
			get { return connectionstring_; }
		}
		#endregion
		#endregion
		#region public Methods...
		#region public static DBConnection NewDBConnection(string parameters_in);
		public static Config_DBConnectionstring NewDBConnection(string parameters_in) {
			string[] _parameters = parameters_in.Split(new string[] { "::" }, StringSplitOptions.None);
			return new Config_DBConnectionstring(
				bool.Parse(_parameters[0]), 
				bool.Parse(_parameters[1]), 
				bool.Parse(_parameters[2]), 
				_parameters[3]
			);
		}
		#endregion
		#endregion
	}
}