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
	/// User DataObject which provides access to User table at Database.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_User">DO_User</see>.
	/// </note>
	/// </summary>
	[DOClassAttribute("User", false, false)]
	public abstract class DO0_User : DO__base {
		#region internal DO0_User();
		internal DO0_User(
		) : base(
			DO0__utils.DBServerType, 
			DO0__utils.DBConnectionstring
		) {
			clrObject();
			haschanges_ = false;
		}
		internal DO0_User(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public RO0_User Record { get; }
		private RO0_User record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_User Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_User(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_User properties since last time getObject method was run.
		/// </summary>
		public virtual bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public virtual long IDUser { get; set; }
		internal long iduser_;// = 0L;
		
		/// <summary>
		/// User's IDUser.
		/// </summary>
		[DOPropertyAttribute("IDUser", true, true, false, "", "", "", false, false, false, false, false, true, false, false)]
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
		/// User's Login.
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
		#region public virtual string Password { get; set; }
		internal string password_;// = string.Empty;
		
		/// <summary>
		/// User's Password.
		/// </summary>
		[DOPropertyAttribute("Password", false, false, false, "", "", "", false, false, false, false, false, false, false, true)]
		public virtual string Password {
			get {
				return password_;
			}
			set {
				if (!value.Equals(password_)) {
					password_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public virtual void clrObject();
		/// <summary>
		/// Clears all DO0_User properties, assigning them with their appropriate default property value.
		/// </summary>
		public virtual void clrObject() {
			IDUser = 0L;
			Login = string.Empty;
			Password = string.Empty;
		}
		#endregion
		#region public virtual bool getObject(...);
		/// <summary>
		/// Selects User values from Database and assigns them to the appropriate DO0_User property.
		/// </summary>
		/// <returns>True if User exists at Database, False if not</returns>
		public virtual bool getObject() {
			return getObject(
				iduser_
			);
		}
		/// <summary>
		/// Selects User values from Database and assigns them to the appropriate DO0_User property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public virtual bool getObject(
			long IDUser_in
		) {
			if (IDUser_in != 0L) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.InputOutput, IDUser_in, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Output, null, 50), 
					base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Output, null, 50)
				};
				base.Connection.Execute_SQLFunction("sp0_User_getObject", _dataparameters);

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
						password_ = string.Empty;
					} else {
						password_ = (string)_dataparameters[2].Value;
					}

					haschanges_ = false;
					return true;
				}
			}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public virtual void delObject(...);
		/// <summary>
		/// Deletes User from Database.
		/// </summary>
		public virtual void delObject() {
			delObject(
				iduser_
			);
		}
		/// <summary>
		/// Deletes User from Database.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		public virtual void delObject(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0)
			};
			base.Connection.Execute_SQLFunction("sp0_User_delObject", _dataparameters);

			clrObject();
		}
		#endregion
		#region public virtual bool isObject(...);
		/// <summary>
		/// Checks to see if User exists at Database
		/// </summary>
		/// <returns>True if User exists at Database, False if not</returns>
		public virtual bool isObject() {
			return isObject(
				iduser_
			);
		}
		/// <summary>
		/// Checks to see if User exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public virtual bool isObject(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_User_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#region public virtual long insObject(...);
		/// <summary>
		/// Inserts User values into Database.
		/// </summary>
		/// <param name="selectIdentity_in">assign with True if you wish to retrieve insertion sequence/identity seed and with False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and insertion failed, and False if no constraint and insertion was successful</param>
		/// <returns>insertion sequence/identity seed</returns>
		public virtual long insObject(
			bool selectIdentity_in, 
			out bool constraintExist_out
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Output, null, 0), 
				base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Input, login_, 50), 
				base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Input, password_, 50), 

				base.Connection.newDBDataParameter("SelectIdentity_", DbType.Boolean, ParameterDirection.Input, selectIdentity_in, 1)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_User_insObject", 
				_dataparameters
			);

			IDUser = (long)_dataparameters[0].Value;
			constraintExist_out = (IDUser == -1L);
			if (!constraintExist_out) {
				haschanges_ = false;
			}

			return IDUser;
		}
		#endregion
		#region public virtual void updObject(...);
		/// <summary>
		/// Updates User values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param>
		public virtual void updObject(bool forceUpdate_in, out bool constraintExist_out) {
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, iduser_, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Input, login_, 50), 
					base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Input, password_, 50), 

					base.Connection.newDBDataParameter("ConstraintExist_", DbType.Boolean, ParameterDirection.Output, null, 1)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_User_updObject", 
					_dataparameters
				);
				
				constraintExist_out = (bool)_dataparameters[3].Value;
				if (!constraintExist_out) {
					haschanges_ = false;
				}
			} else {
				constraintExist_out = false;
			}
		}
		#endregion
		#endregion
		#region Methods - Search...
		#region public void ???Object_byLogin
		#region public bool getObject_byLogin(...);
		/// <summary>
		/// Selects User values from Database (based on the search condition) and assigns them to the appropriate DO0_User property.
		/// </summary>
		/// <param name="Login_search_in">Login search condition</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public bool getObject_byLogin(
			string Login_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50), 
				base.Connection.newDBDataParameter("IDUser", DbType.Int64, ParameterDirection.Output, null, 0), 
				base.Connection.newDBDataParameter("Login", DbType.String, ParameterDirection.Output, null, 50), 
				base.Connection.newDBDataParameter("Password", DbType.String, ParameterDirection.Output, null, 50)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_User_getObject_byLogin", 
				_dataparameters
			);

			if (_dataparameters[1].Value != DBNull.Value) {
				if (_dataparameters[1].Value == System.DBNull.Value) {
					iduser_ = 0L;
				} else {
					iduser_ = (long)_dataparameters[1].Value;
				}
				if (_dataparameters[2].Value == System.DBNull.Value) {
					login_ = string.Empty;
				} else {
					login_ = (string)_dataparameters[2].Value;
				}
				if (_dataparameters[3].Value == System.DBNull.Value) {
					password_ = string.Empty;
				} else {
					password_ = (string)_dataparameters[3].Value;
				}

				haschanges_ = false;
				return true;
			}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public bool delObject_byLogin(...);
		/// <summary>
		/// Deletes User from Database (based on the search condition).
		/// </summary>
		/// <param name="Login_search_in"> Login search condition</param>
		/// <returns>True if User existed and was Deleted at Database, False if it didn't exist</returns>
		public bool delObject_byLogin(
			string Login_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50), 

				base.Connection.newDBDataParameter("Exists_", DbType.Boolean, ParameterDirection.Output, null, 1)
			};
			base.Connection.Execute_SQLFunction("sp0_User_delObject_byLogin", _dataparameters);

			return ((bool)_dataparameters[1].Value);
		}
		#endregion
		#region public bool isObject_byLogin(...);
		/// <summary>
		/// Checks to see if User exists at Database (based on the search condition).
		/// </summary>
		/// <param name="Login_search_in">Login search condition</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public bool isObject_byLogin(
			string Login_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50)
			};
			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_User_isObject_byLogin", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#endregion
		#endregion
		#region Methods - Updates...
		#region public virtual void updObject_SomeUpdateTest(...);
		/// <summary>
		/// Updates User specific(only) values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param>
		public virtual void updObject_SomeUpdateTest(bool forceUpdate_in, out bool constraintExist_out) {
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser", DbType.Int64, ParameterDirection.Input, iduser_, 0), 
					base.Connection.newDBDataParameter("Password_update", DbType.String, ParameterDirection.Input, password_, 50), 

					base.Connection.newDBDataParameter("ConstraintExist", DbType.Boolean, ParameterDirection.Output, null, 1)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_User_updObject_SomeUpdateTest", 
					_dataparameters
				);
				
				constraintExist_out = (bool)_dataparameters[3].Value;
				if (!constraintExist_out) {
					haschanges_ = false;
				}
			} else {
				constraintExist_out = false;
			}
		}
		#endregion
		#endregion
	}
}