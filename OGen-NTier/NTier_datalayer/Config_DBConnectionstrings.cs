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
using System.Collections;

using OGen.lib.datalayer;

namespace OGen.NTier.lib.datalayer {
	public class Config_DBConnectionstrings {
		#region public Config_DBConnectionstrings();
		public Config_DBConnectionstrings() {
			dbconnections_ = new System.Collections.Hashtable(
				ConfigModes.Length * 
				DBServerTypes.Length
			);
			for (int _cfg = 0; _cfg < ConfigModes.Length; _cfg++) {
				for (int _db = 0; _db < DBServerTypes.Length; _db++) {
					Add(
						DBServerTypes[_db], 
						ConfigModes[_cfg], 
						Config_DBConnectionstring.NewDBConnection(
							System.Configuration.ConfigurationSettings.AppSettings[string.Format(
								"OGen-NTier_UTs:DBConnection:{0}:{1}",
								ConfigModes[_cfg],
								DBServerTypes[_db].ToString()
							)]
						)
					);
				}
			}
		}
		#endregion
		#region static Config_DBConnectionstrings();
		static Config_DBConnectionstrings() {
			configmodes__ = null;
			dbservertypes__ = null;
			dbconnectionstrings__ = null;
		}
		#endregion

		#region private Properties...
		private System.Collections.Hashtable dbconnections_;
		#endregion
		#region public Properties...
		#region public DBConnection this[eDBServerTypes dbServerType_in, string configMode_in] { get; }
		public Config_DBConnectionstring this[eDBServerTypes dbServerType_in, string configMode_in] {
			get {
				return (Config_DBConnectionstring)dbconnections_[string.Format(
					"{0}:{1}",
					configMode_in,
					dbServerType_in
				)];

			}
		}
		#endregion
		#region public int Count { get; }
		public int Count {
			get { return dbconnections_.Count; }
		}
		#endregion
		#endregion
		#region public static Properties...
		#region public static string[] ConfigModes { get; }
		private static string[] configmodes__;
		/// <summary>
		/// Supported Config Modes (i.e. DEBUG, !DEBUG, etc.).
		/// </summary>
		public static string[] ConfigModes {
			get {
				if (configmodes__ == null) {
					configmodes__ = System.Configuration.ConfigurationSettings.AppSettings["OGen-NTier_UTs:ConfigModes"].Split(':');
				}
				return configmodes__;
			}
		}
		#endregion
		#region public static eDBServerTypes[] DBServerTypes { get; }
		private static eDBServerTypes[] dbservertypes__;
		/// <summary>
		/// Supported DB Server Types.
		/// </summary>
		public static eDBServerTypes[] DBServerTypes {
			get {
				if (dbservertypes__ == null) {
					string[] _dbservertypes 
						= System.Configuration.ConfigurationSettings.AppSettings["OGen-NTier_UTs:DBServerTypes"].Split(':');

					dbservertypes__ = new eDBServerTypes[_dbservertypes.Length];
					for (int i = 0; i < _dbservertypes.Length; i++) {
						dbservertypes__[i] 
							= OGen.lib.datalayer.utils.DBServerTypes.convert.FromName(
								_dbservertypes[i]
							);
					}
				}
				return dbservertypes__;
			}
		}
		#endregion
		#region public static Config_DBConnectionstrings DBConnectionstrings { get; }
		private static Config_DBConnectionstrings dbconnectionstrings__;
		public static Config_DBConnectionstrings DBConnectionstrings {
			get {
				if (dbconnectionstrings__ == null) {
					dbconnectionstrings__ = new Config_DBConnectionstrings();
				}
				return dbconnectionstrings__;
			}
		}
		#endregion
		#endregion

		#region private Methods...
		#region private void Add(...);
		private void Add(
			eDBServerTypes dbServerType_in, 
			string configMode_in, 
			Config_DBConnectionstring dbConnection_in
		) {
			dbconnections_.Add(
				string.Format(
					"{0}:{1}",
					configMode_in,
					dbServerType_in
				), 
				dbConnection_in
			);
		}
		#endregion
		#endregion
		#region public static Methods...
		#region public static void Reset();
		public static void Reset() {
			configmodes__ = null;
			dbservertypes__ = null;
			dbconnectionstrings__ = null;
		}
		#endregion
		#endregion
	}
}