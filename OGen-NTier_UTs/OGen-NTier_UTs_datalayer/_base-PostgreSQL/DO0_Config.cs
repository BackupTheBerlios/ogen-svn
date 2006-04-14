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
	/// Config DataObject which provides access to Config table at Database.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_Config">DO_Config</see>.
	/// </note>
	/// </summary>
	[DOClassAttribute("Config", false, true)]
	public abstract class DO0_Config : DO__base {
		#region internal DO0_Config();
		internal DO0_Config(
		) : base(
			DO0__utils.DBServerType, 
			DO0__utils.DBConnectionstring
		) {
			clrObject();
			haschanges_ = false;
		}
		internal DO0_Config(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public RO0_Config Record { get; }
		private RO0_Config record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_Config Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_Config(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_Config properties since last time getObject method was run.
		/// </summary>
		public virtual bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public virtual string Name { get; set; }
		internal string name_;// = string.Empty;
		
		/// <summary>
		/// Config's Name.
		/// </summary>
		[DOPropertyAttribute("Name", true, false, false, "", "", "", true, false, false, false, false, false, false, true)]
		public virtual string Name {
			get {
				return name_;
			}
			set {
				if (name_ != value) {
					name_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual string Config { get; set; }
		internal string config_;// = string.Empty;
		
		/// <summary>
		/// Config's Config.
		/// </summary>
		[DOPropertyAttribute("Config", false, false, false, "", "", "", false, true, false, false, false, false, false, true)]
		public virtual string Config {
			get {
				return config_;
			}
			set {
				if (config_ != value) {
					config_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual int Type { get; set; }
		internal int type_;// = 0;
		
		/// <summary>
		/// Config's Type.
		/// </summary>
		[DOPropertyAttribute("Type", false, false, false, "", "", "", false, false, true, false, false, true, false, false)]
		public virtual int Type {
			get {
				return type_;
			}
			set {
				if (type_ != value) {
					type_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public virtual void clrObject();
		/// <summary>
		/// Clears all DO0_Config properties, assigning them with their appropriate default property value.
		/// </summary>
		public virtual void clrObject() {
			Name = string.Empty;
			Config = string.Empty;
			Type = 0;
		}
		#endregion
		#region public virtual bool getObject(...);
		/// <summary>
		/// Selects Config values from Database and assigns them to the appropriate DO0_Config property.
		/// </summary>
		/// <returns>True if Config exists at Database, False if not</returns>
		public virtual bool getObject() {
			return getObject(
				name_
			);
		}
		/// <summary>
		/// Selects Config values from Database and assigns them to the appropriate DO0_Config property.
		/// </summary>
		/// <param name="Name_in">Name</param>
		/// <returns>True if Config exists at Database, False if not</returns>
		public virtual bool getObject(
			string Name_in
		) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.InputOutput, Name_in, 50), 
					base.Connection.newDBDataParameter("Config_", DbType.String, ParameterDirection.Output, null, 50), 
					base.Connection.newDBDataParameter("Type_", DbType.Int32, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction("sp0_Config_getObject", _dataparameters);

				if (_dataparameters[0].Value != DBNull.Value) {
					name_ = (_dataparameters[0].Value == System.DBNull.Value) ? string.Empty : (string)_dataparameters[0].Value;
					config_ = (_dataparameters[1].Value == System.DBNull.Value) ? string.Empty : (string)_dataparameters[1].Value;
					type_ = (_dataparameters[2].Value == System.DBNull.Value) ? 0 : (int)_dataparameters[2].Value;
					
					haschanges_ = false;
					return true;
				}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public virtual void delObject(...);
		/// <summary>
		/// Deletes Config from Database.
		/// </summary>
		public virtual void delObject() {
			delObject(
				name_
			);
		}
		/// <summary>
		/// Deletes Config from Database.
		/// </summary>
		/// <param name="Name_in">Name</param>
		public virtual void delObject(
			string Name_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, Name_in, 50)
			};
			base.Connection.Execute_SQLFunction("sp0_Config_delObject", _dataparameters);

			clrObject();
		}
		#endregion
		#region public virtual bool isObject(...);
		/// <summary>
		/// Checks to see if Config exists at Database
		/// </summary>
		/// <returns>True if Config exists at Database, False if not</returns>
		public virtual bool isObject() {
			return isObject(
				name_
			);
		}
		/// <summary>
		/// Checks to see if Config exists at Database
		/// </summary>
		/// <param name="Name_in">Name</param>
		/// <returns>True if Config exists at Database, False if not</returns>
		public virtual bool isObject(
			string Name_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, Name_in, 50)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_Config_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#region public virtual bool setObject(...);
		/// <summary>
		/// Inserts/Updates Config values into/on Database. Inserts if Config doesn't exist or Updates if Config already exists.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <returns>True if it didn't exist (INSERT), and False if it did exist (UPDATE)</returns>
		public virtual bool setObject(bool forceUpdate_in) {
			bool ConstraintExist_out;
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, name_, 50), 
					base.Connection.newDBDataParameter("Config_", DbType.String, ParameterDirection.Input, config_, 50), 
					base.Connection.newDBDataParameter("Type_", DbType.Int32, ParameterDirection.Input, type_, 0), 

					//base.Connection.newDBDataParameter("Exists", DbType.Boolean, ParameterDirection.Output, 0, 1)
					base.Connection.newDBDataParameter("Output_", DbType.Int32, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_Config_setObject", 
					_dataparameters
				);

				ConstraintExist_out = (((int)_dataparameters[3].Value & 2) == 1);
				if (!ConstraintExist_out) {
					haschanges_ = false;

					#region DO0__utils...._REFRESH();
					switch (name_) {
						case "SomeBoolConfig": {
							DO0__utils.SomeBoolConfig_REFRESH();
							break;
						}
						case "SomeIntConfig": {
							DO0__utils.SomeIntConfig_REFRESH();
							break;
						}
						case "SomeMultiLineStringConfig": {
							DO0__utils.SomeMultiLineStringConfig_REFRESH();
							break;
						}
						case "SomeStringConfig": {
							DO0__utils.SomeStringConfig_REFRESH();
							break;
						}
					}
					#endregion
				}

				return (((int)_dataparameters[3].Value & 1) != 1);
			} else {
				ConstraintExist_out = false;

				return  false;
			}
		}
		#endregion
		#endregion
		#region Methods - Search...
		#endregion
		#region Methods - Updates...
		#endregion
	}
}