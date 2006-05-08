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
using OGen.NTier.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer {
	/// <summary>
	/// utils DataObject which works as a repository of useful Properties and Methods for DataObjects at OGen.NTier.UTs.lib.datalayer namespace.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO__utils">DO__utils</see>.
	/// </note>
	/// </summary>
	public abstract class DO0__utils {
		#region internal DO0__utils(...);
		internal DO0__utils() {
		}
		#endregion
		#region static DO0__utils();
		static DO0__utils() {
			dbservertype__ = eDBServerTypes.invalid;
			dbconnectionstring__ = null;
		}
		#endregion

		public const string ApplicationName = "OGen-NTier_UTs";

		#region public static Properties...
		#region public static eDBServerTypes DBServerType { get; }
		private static eDBServerTypes dbservertype__;
		/// <summary>
		/// DB Server Type.
		/// </summary>
		public static eDBServerTypes DBServerType {
			get {
				if (dbservertype__ == eDBServerTypes.invalid) {
					DBServerType_read(false);
				}
				return dbservertype__;
			}
		}
		#endregion
		#region public static string DBConnectionstring { get; }
		private static string dbconnectionstring__;
		/// <summary>
		/// Connection String.
		/// </summary>
		public static string DBConnectionstring {
			get {
				if (dbconnectionstring__ == null) {
					DBConnectionstring_read(false);
				}
				return dbconnectionstring__;
			}
		}
		#endregion
		#endregion

		#region public static Methods...
		#region public static void DBConnectionstring_reset();
		public static void DBConnectionstring_reset() {
			Config_DBConnectionstrings.Reset();
		}
		#endregion
		#region private static void DBConnectionstring_read(bool andReset_in);
		private static void DBConnectionstring_read(bool andReset_in) {
			DBServerType_read(andReset_in);
		}
		#endregion
		#region public static void DBServerType_reset();
		public static void DBServerType_reset() {
			Config_DBConnectionstrings.Reset();
		}
		#endregion
		#region private static void DBServerType_read(bool andReset_in);
		private static void DBServerType_read(bool andReset_in) {
			if (andReset_in) {
				DBServerType_reset();
			}
			dbservertype__ = eDBServerTypes.invalid;
			dbconnectionstring__ = null;

			Config_DBConnectionstring _con;
			for (int _db = 0; _db < Config_DBConnectionstrings.DBServerTypes(ApplicationName).Length; _db++) {
				_con = Config_DBConnectionstrings.DBConnectionstrings(ApplicationName)[
					Config_DBConnectionstrings.DBServerTypes(ApplicationName)[_db],
#if DEBUG
					"DEBUG"
#elif !DEBUG
					"!DEBUG"
#endif
				];
				if (_con.isDefault) {
					dbservertype__ = Config_DBConnectionstrings.DBServerTypes(ApplicationName)[_db];
					dbconnectionstring__ = _con.Connectionstring;
					return;
				}
			}
		}
		#endregion
		#endregion
		#region public static Methods - DB.Config...
		#region public static bool SomeBoolConfig { get; }
		private static bool someboolconfig_beenRead = false;
		/// <summary>
		/// Forces SomeBoolConfig config to be re-read from Database.
		/// </summary>
		public static void SomeBoolConfig_reset() { someboolconfig_beenRead = false; }
		private static bool someboolconfig = true;
		/// <summary>
		/// SomeBoolConfig config which provides access to table Config at Database.
		/// </summary>
		public static bool SomeBoolConfig {
			get {
				if (!someboolconfig_beenRead) {
					#region someboolconfig = DO_Config.getObject("SomeBoolConfig");
					DO_Config config = new DO_Config();
					config.getObject("SomeBoolConfig");
					someboolconfig = bool.Parse(config.Config);
					config.Dispose(); config = null;
					#endregion
					someboolconfig_beenRead = true;
				}
				return someboolconfig;
			}
			set {
				#region someboolconfig = DO_Config.Config = value;
				DO_Config config = new DO_Config();
				config.getObject("SomeBoolConfig");
				config.Config = value.ToString();
				config.setObject(false);
				config.Dispose(); config = null;

				someboolconfig = value;
				someboolconfig_beenRead = true;
				#endregion
			}
		}
		#endregion
		#region public static int SomeIntConfig { get; }
		private static int someintconfig;
		private static bool someintconfig_beenRead = false;
		/// <summary>
		/// Forces SomeIntConfig config to be re-read from Database.
		/// </summary>
		public static void SomeIntConfig_reset() { someintconfig_beenRead = false; }
		/// <summary>
		/// SomeIntConfig config which provides access to table Config at Database.
		/// </summary>
		public static int SomeIntConfig {
			get {
				if (!someintconfig_beenRead) {
					#region someintconfig = DO_Config.getObject("SomeIntConfig");
					DO_Config config = new DO_Config();
					config.getObject("SomeIntConfig");
					someintconfig = int.Parse(config.Config);
					config.Dispose(); config = null;
					#endregion
					someintconfig_beenRead = true;
				}
				return someintconfig;
			}
			set {
				#region someintconfig = DO_Config.Config = value;
				DO_Config config = new DO_Config();
				config.getObject("SomeIntConfig");
				config.Config = value.ToString();
				config.setObject(false);
				config.Dispose(); config = null;

				someintconfig = value;
				someintconfig_beenRead = true;
				#endregion
			}
		}
		#endregion
		#region public static string[] SomeMultiLineStringConfig { get; }
		private static string[] somemultilinestringconfig = null;
		/// <summary>
		/// Forces SomeMultiLineStringConfig config to be re-read from Database.
		/// </summary>
		public static void SomeMultiLineStringConfig_reset() { somemultilinestringconfig = null; }
		/// <summary>
		/// SomeMultiLineStringConfig config which provides access to table Config at Database.
		/// </summary>
		public static string[] SomeMultiLineStringConfig {
			get {
				if (somemultilinestringconfig == null) {
					#region somemultilinestringconfig = DO_Config.getObject("SomeMultiLineStringConfig");
					DO_Config config = new DO_Config();
					config.getObject("SomeMultiLineStringConfig");
					somemultilinestringconfig = config.Config.Split((char)10);
					config.Dispose(); config = null;
					#endregion
				}
				return somemultilinestringconfig;
			}
			set {
				#region somemultilinestringconfig = DO_Config.Config = value;
				DO_Config config = new DO_Config();
				config.getObject("SomeMultiLineStringConfig");


				config.Config = string.Empty;
				for (int i = 0; i < value.Length; i++) {
					config.Config += string.Format(
						"{0}{1}",
						(i != 0) ? ((char)10).ToString() : string.Empty, 
						value[i]
					);
				}


				config.setObject(false);
				config.Dispose(); config = null;

				somemultilinestringconfig = value;
				#endregion
			}
		}
		#endregion
		#region public static string SomeStringConfig { get; }
		private static string somestringconfig = null;
		/// <summary>
		/// Forces SomeStringConfig config to be re-read from Database.
		/// </summary>
		public static void SomeStringConfig_reset() { somestringconfig = null; }
		/// <summary>
		/// SomeStringConfig config which provides access to table Config at Database.
		/// </summary>
		public static string SomeStringConfig {
			get {
				if (somestringconfig == null) {
					#region somestringconfig = DO_Config.getObject("SomeStringConfig");
					DO_Config config = new DO_Config();
					config.getObject("SomeStringConfig");
					somestringconfig = config.Config;
					config.Dispose(); config = null;
					#endregion
				}
				return somestringconfig;
			}
			set {
				#region somestringconfig = DO_Config.Config = value;
				DO_Config config = new DO_Config();
				config.getObject("SomeStringConfig");
				config.Config = value;
				config.setObject(false);
				config.Dispose(); config = null;

				somestringconfig = value;
				#endregion
			}
		}
		#endregion
		#endregion
	}
	
}