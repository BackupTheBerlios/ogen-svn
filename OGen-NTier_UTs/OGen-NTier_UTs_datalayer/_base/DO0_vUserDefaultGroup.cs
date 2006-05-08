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
	/// vUserDefaultGroup DataObject which provides access to vUserDefaultGroup view at Database.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_vUserDefaultGroup">DO_vUserDefaultGroup</see>.
	/// </note>
	/// </summary>
	[DOClassAttribute("vUserDefaultGroup", true, false)]
	public abstract class DO0_vUserDefaultGroup : DO__base {
		#region internal DO0_vUserDefaultGroup();
		internal DO0_vUserDefaultGroup(
		) : base(
			DO0__utils.DBServerType, 
			DO0__utils.DBConnectionstring
		) {
			clrObject();
			haschanges_ = false;
		}
		internal DO0_vUserDefaultGroup(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public RO0_vUserDefaultGroup Record { get; }
		private RO0_vUserDefaultGroup record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_vUserDefaultGroup Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_vUserDefaultGroup(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_vUserDefaultGroup properties since last time getObject method was run.
		/// </summary>
		public virtual bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public virtual long IDUser { get; set; }
		internal long iduser_;// = 0L;
		
		/// <summary>
		/// vUserDefaultGroup's IDUser.
		/// </summary>
		[DOPropertyAttribute("IDUser", true, false, false, "", "", "", false, false, false, false, false, true, false, false)]
		public virtual long IDUser {
			get {
				return iduser_;
			}
			set {
				if (!value.Equals(iduser_)) {
					iduser_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual string Login { get; set; }
		internal string login_;// = string.Empty;
		
		/// <summary>
		/// vUserDefaultGroup's Login.
		/// </summary>
		[DOPropertyAttribute("Login", false, false, false, "", "", "", false, false, false, false, false, false, false, true)]
		public virtual string Login {
			get {
				return login_;
			}
			set {
				if (!value.Equals(login_)) {
					login_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual long IDGroup { get; set; }
		internal long idgroup_;// = 0L;
		
		/// <summary>
		/// vUserDefaultGroup's IDGroup.
		/// </summary>
		[DOPropertyAttribute("IDGroup", false, false, false, "", "", "", false, false, false, false, false, true, false, false)]
		public virtual long IDGroup {
			get {
				return idgroup_;
			}
			set {
				if (!value.Equals(idgroup_)) {
					idgroup_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual string Name { get; set; }
		internal string name_;// = string.Empty;
		
		/// <summary>
		/// vUserDefaultGroup's Name.
		/// </summary>
		[DOPropertyAttribute("Name", false, false, false, "", "", "", false, false, false, false, false, false, false, true)]
		public virtual string Name {
			get {
				return name_;
			}
			set {
				if (!value.Equals(name_)) {
					name_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual DateTime Relationdate { get; set; }
		internal DateTime relationdate_;// = new DateTime(1900, 1, 1);
		
		/// <summary>
		/// vUserDefaultGroup's Relationdate.
		/// </summary>
		[DOPropertyAttribute("Relationdate", false, false, false, "", "", "", false, false, false, false, true, false, false, false)]
		public virtual DateTime Relationdate {
			get {
				return relationdate_;
			}
			set {
				if (!value.Equals(relationdate_)) {
					relationdate_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public virtual void clrObject();
		/// <summary>
		/// Clears all DO0_vUserDefaultGroup properties, assigning them with their appropriate default property value.
		/// </summary>
		public virtual void clrObject() {
			IDUser = 0L;
			Login = string.Empty;
			IDGroup = 0L;
			Name = string.Empty;
			Relationdate = new DateTime(1900, 1, 1);
		}
		#endregion
		#region public virtual bool getObject(...);
		/// <summary>
		/// Selects vUserDefaultGroup values from Database and assigns them to the appropriate DO0_vUserDefaultGroup property.
		/// </summary>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public virtual bool getObject() {
			return getObject(
				iduser_
			);
		}
		/// <summary>
		/// Selects vUserDefaultGroup values from Database and assigns them to the appropriate DO0_vUserDefaultGroup property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public virtual bool getObject(
			long IDUser_in
		) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.InputOutput, IDUser_in, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Output, null, 50), 
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Output, null, 0), 
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Output, null, 50), 
					base.Connection.newDBDataParameter("Relationdate_", DbType.DateTime, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction("sp0_vUserDefaultGroup_getObject", _dataparameters);

				if (_dataparameters[0].Value != DBNull.Value) {
					if (_dataparameters[0].Value == System.DBNull.Value) {
						iduser_ = 0L;
					} else {
						iduser_ = (long)_dataparameters[0].Value;
					}
					if (_dataparameters[1].Value == System.DBNull.Value) {
						login_ = string.Empty;
					} else {
						login_ = (string)_dataparameters[1].Value;
					}
					if (_dataparameters[2].Value == System.DBNull.Value) {
						idgroup_ = 0L;
					} else {
						idgroup_ = (long)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						name_ = string.Empty;
					} else {
						name_ = (string)_dataparameters[3].Value;
					}
					if (_dataparameters[4].Value == System.DBNull.Value) {
						relationdate_ = new DateTime(1900, 1, 1);
					} else {
						relationdate_ = (DateTime)_dataparameters[4].Value;
					}

					haschanges_ = false;
					return true;
				}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public virtual bool isObject(...);
		/// <summary>
		/// Checks to see if vUserDefaultGroup exists at Database
		/// </summary>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public virtual bool isObject() {
			return isObject(
				iduser_
			);
		}
		/// <summary>
		/// Checks to see if vUserDefaultGroup exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public virtual bool isObject(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_vUserDefaultGroup_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#endregion
		#region Methods - Search...
		#endregion
		#region Methods - Updates...
		#endregion
	}
}