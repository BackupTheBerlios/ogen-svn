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
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_vUserDefaultGroup">DO_vUserDefaultGroup</see>.
	/// </note>
#endif
	/// </summary>
	[DOClassAttribute("vUserDefaultGroup", true, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		DO_vUserDefaultGroup 
#else
		DO0_vUserDefaultGroup 
#endif
		: DO__base {
		#region public DO_vUserDefaultGroup();
#if NET20
		///
		public DO_vUserDefaultGroup
#else
		internal DO0_vUserDefaultGroup
#endif
		() : base(
#if NET20
			DO__utils
#else
			DO0__utils
#endif
			.DBServerType, 
#if NET20
			DO__utils
#else
			DO0__utils
#endif
			.DBConnectionstring,
#if NET20
			DO__utils
#else
			DO0__utils
#endif
			.DBLogfile
		) {
			clrObject();
			haschanges_ = false;
		}
#if NET20
			/// <summary>
			/// Making the use of Database Transactions possible on a sequence of operations across multiple DataObjects.
			/// </summary>
			/// <param name="connection_in">opened Database connection with an initiated Transaction</param>
			public DO_vUserDefaultGroup
#else
			internal DO0_vUserDefaultGroup
#endif
		(
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
		public 
#if !NET20
			virtual 
#endif
			bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public long IDUser { get; set; }
		internal long iduser_;// = 0L;
		
		/// <summary>
		/// vUserDefaultGroup's IDUser.
		/// </summary>
		[DOPropertyAttribute("IDUser", true, false, true, "", "", "", false, false, false, false, false, true, false, false)]
		public 
#if !NET20
			virtual 
#endif
			long IDUser {
			get {
				return iduser_;
			}
			set {
				if (
					(!value.Equals(iduser_))
				) {
					iduser_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Login_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Login_isNull {
			get { return (login_ == null); }
			set {
				//if (value) login_ = null;

				if ((value) && (login_ != null)) {
					login_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public string Login { get; set; }
		internal object login_;// = string.Empty;
		
		/// <summary>
		/// vUserDefaultGroup's Login.
		/// </summary>
		[DOPropertyAttribute("Login", false, false, true, "", "", "", false, false, false, false, false, false, false, true)]
		public 
#if !NET20
			virtual 
#endif
			string Login {
			get {
				return (string)((login_ == null) ? string.Empty : login_);
			}
			set {
				if (
					(value != null)
					&&
					(!value.Equals(login_))
				) {
					login_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool IDGroup_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool IDGroup_isNull {
			get { return (idgroup_ == null); }
			set {
				//if (value) idgroup_ = null;

				if ((value) && (idgroup_ != null)) {
					idgroup_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public long IDGroup { get; set; }
		internal object idgroup_;// = 0L;
		
		/// <summary>
		/// vUserDefaultGroup's IDGroup.
		/// </summary>
		[DOPropertyAttribute("IDGroup", false, false, true, "", "", "", false, false, false, false, false, true, false, false)]
		public 
#if !NET20
			virtual 
#endif
			long IDGroup {
			get {
				return (long)((idgroup_ == null) ? 0L : idgroup_);
			}
			set {
				if (
					(!value.Equals(idgroup_))
				) {
					idgroup_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Name_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Name_isNull {
			get { return (name_ == null); }
			set {
				//if (value) name_ = null;

				if ((value) && (name_ != null)) {
					name_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public string Name { get; set; }
		internal object name_;// = string.Empty;
		
		/// <summary>
		/// vUserDefaultGroup's Name.
		/// </summary>
		[DOPropertyAttribute("Name", false, false, true, "", "", "", false, false, false, false, false, false, false, true)]
		public 
#if !NET20
			virtual 
#endif
			string Name {
			get {
				return (string)((name_ == null) ? string.Empty : name_);
			}
			set {
				if (
					(value != null)
					&&
					(!value.Equals(name_))
				) {
					name_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Relationdate_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Relationdate_isNull {
			get { return (relationdate_ == null); }
			set {
				//if (value) relationdate_ = null;

				if ((value) && (relationdate_ != null)) {
					relationdate_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		internal object relationdate_;// = new DateTime(1900, 1, 1);
		
		/// <summary>
		/// vUserDefaultGroup's Relationdate.
		/// </summary>
		[DOPropertyAttribute("Relationdate", false, false, true, "", "", "", false, false, false, false, true, false, false, false)]
		public 
#if !NET20
			virtual 
#endif
			DateTime Relationdate {
			get {
				return (DateTime)((relationdate_ == null) ? new DateTime(1900, 1, 1) : relationdate_);
			}
			set {
				if (
					(!value.Equals(relationdate_))
				) {
					relationdate_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public void clrObject();
		/// <summary>
		/// Clears all DO0_vUserDefaultGroup properties, assigning them with their appropriate default property value.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			void clrObject() {
			IDUser = 0L;
			Login_isNull = true;
			IDGroup_isNull = true;
			Name_isNull = true;
			Relationdate_isNull = true;
		}
		#endregion
		#region public bool getObject(...);
		/// <summary>
		/// Selects vUserDefaultGroup values from Database and assigns them to the appropriate DO0_vUserDefaultGroup property.
		/// </summary>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject() {
			return getObject(
				iduser_
			);
		}
		/// <summary>
		/// Selects vUserDefaultGroup values from Database and assigns them to the appropriate DO0_vUserDefaultGroup property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject(
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
						Login_isNull = true;
					} else {
						login_ = (string)_dataparameters[1].Value;
					}
					if (_dataparameters[2].Value == System.DBNull.Value) {
						IDGroup_isNull = true;
					} else {
						idgroup_ = (long)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						Name_isNull = true;
					} else {
						name_ = (string)_dataparameters[3].Value;
					}
					if (_dataparameters[4].Value == System.DBNull.Value) {
						Relationdate_isNull = true;
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
		#region public bool isObject(...);
		/// <summary>
		/// Checks to see if vUserDefaultGroup exists at Database
		/// </summary>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool isObject() {
			return isObject(
				iduser_
			);
		}
		/// <summary>
		/// Checks to see if vUserDefaultGroup exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if vUserDefaultGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool isObject(
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