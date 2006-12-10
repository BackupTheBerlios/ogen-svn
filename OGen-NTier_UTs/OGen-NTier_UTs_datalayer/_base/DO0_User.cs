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
using System.Xml.Serialization;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer {
	/// <summary>
	/// User DataObject which provides access to User table at Database.
	/// </summary>
	[DOClassAttribute("User", "", "", "", false, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		DO_User 
#else
		DO0_User 
#endif
		: DO__base {
		#region public DO_User();
#if NET20
		///
		public DO_User
#else
		internal DO0_User
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
			Fields.haschanges_ = false;
		}
#if NET20
			/// <summary>
			/// Making the use of Database Transactions possible on a sequence of operations across multiple DataObjects.
			/// </summary>
			/// <param name="connection_in">opened Database connection with an initiated Transaction</param>
			public DO_User
#else
			internal DO0_User
#endif
		(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			Fields.haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public FO0_User Fields { get; set; }
		internal SO0_User fields_;

		public SO0_User Fields {
			get { return fields_; }
			set { fields_ = value; }
		}
		#endregion
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
		#endregion

		#region Methods...
		#region public SC0_User Serialize();
		public SO0_User Serialize() {
			return Fields;
		}
		#endregion
		#region public void clrObject();
		/// <summary>
		/// Clears all DO0_User properties, assigning them with their appropriate default property value.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		void clrObject() {
			Fields = new SO0_User();
		}
		#endregion
		#region public bool getObject(...);
		/// <summary>
		/// Selects User values from Database and assigns them to the appropriate DO0_User property.
		/// </summary>
		/// <returns>True if User exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool getObject() {
			return getObject(
				Fields.IDUser
			);
		}
		/// <summary>
		/// Selects User values from Database and assigns them to the appropriate DO0_User property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject(
			long IDUser_in
		) {
			if (IDUser_in != 0L) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.InputOutput, IDUser_in, 0, 19, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
					base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
					base.Connection.newDBDataParameter("SomeNullValue_", DbType.Int32, ParameterDirection.Output, null, 0, 10, 0)
				};
				base.Connection.Execute_SQLFunction("sp0_User_getObject", _dataparameters);

				if (_dataparameters[0].Value != DBNull.Value) {
					if (_dataparameters[0].Value == System.DBNull.Value) {
						Fields.IDUser = 0L;
					} else {
						Fields.IDUser = (long)_dataparameters[0].Value;
					}
					if (_dataparameters[1].Value == System.DBNull.Value) {
						Fields.Login = string.Empty;
					} else {
						Fields.Login = (string)_dataparameters[1].Value;
					}
					if (_dataparameters[2].Value == System.DBNull.Value) {
						Fields.Password = string.Empty;
					} else {
						Fields.Password = (string)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						Fields.SomeNullValue_isNull = true;
					} else {
						Fields.SomeNullValue = (int)_dataparameters[3].Value;
					}

					Fields.haschanges_ = false;
					return true;
				}
			}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public void delObject(...);
		/// <summary>
		/// Deletes User from Database.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		void delObject() {
			delObject(
				Fields.IDUser
			);
		}
		/// <summary>
		/// Deletes User from Database.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		public 
#if !NET20
			virtual 
#endif
		void delObject(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0, 19, 0)
			};
			base.Connection.Execute_SQLFunction("sp0_User_delObject", _dataparameters);

			clrObject();
		}
		#endregion
		#region public bool isObject(...);
		/// <summary>
		/// Checks to see if User exists at Database
		/// </summary>
		/// <returns>True if User exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool isObject() {
			return isObject(
				Fields.IDUser
			);
		}
		/// <summary>
		/// Checks to see if User exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <returns>True if User exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool isObject(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0, 19, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_User_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#region public long insObject(...);
		/// <summary>
		/// Inserts User values into Database.
		/// </summary>
		/// <param name="selectIdentity_in">assign with True if you wish to retrieve insertion sequence/identity seed and with False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and insertion failed, and False if no constraint and insertion was successful</param>
		/// <returns>insertion sequence/identity seed</returns>
		public 
#if !NET20
			virtual 
#endif
		long insObject(
			bool selectIdentity_in, 
			out bool constraintExist_out
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Output, null, 0, 19, 0), 
				base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Input, Fields.Login, 50, 0, 0), 
				base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Input, Fields.Password, 50, 0, 0), 
				base.Connection.newDBDataParameter("SomeNullValue_", DbType.Int32, ParameterDirection.Input, Fields.SomeNullValue_isNull ? null : (object)Fields.SomeNullValue, 0, 10, 0), 

				base.Connection.newDBDataParameter("SelectIdentity_", DbType.Boolean, ParameterDirection.Input, selectIdentity_in, 1)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_User_insObject", 
				_dataparameters
			);

			Fields.IDUser = (long)_dataparameters[0].Value;
			constraintExist_out = (Fields.IDUser == -1L);
			if (!constraintExist_out) {
				Fields.haschanges_ = false;
			}

			return Fields.IDUser;
		}
		#endregion
		#region public void updObject(...);
		/// <summary>
		/// Updates User values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param>
		public 
#if !NET20
			virtual 
#endif
		void updObject(bool forceUpdate_in, out bool constraintExist_out) {
			if (forceUpdate_in || Fields.haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, Fields.IDUser, 0, 19, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Input, Fields.Login, 50, 0, 0), 
					base.Connection.newDBDataParameter("Password_", DbType.String, ParameterDirection.Input, Fields.Password, 50, 0, 0), 
					base.Connection.newDBDataParameter("SomeNullValue_", DbType.Int32, ParameterDirection.Input, Fields.SomeNullValue_isNull ? null : (object)Fields.SomeNullValue, 0, 10, 0), 

					base.Connection.newDBDataParameter("ConstraintExist_", DbType.Boolean, ParameterDirection.Output, null, 1)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_User_updObject", 
					_dataparameters
				);
				
				constraintExist_out = (bool)_dataparameters[4].Value;
				if (!constraintExist_out) {
					Fields.haschanges_ = false;
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
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50, 0, 0), 
				base.Connection.newDBDataParameter("IDUser", DbType.Int64, ParameterDirection.Output, null, 0, 19, 0), 
				base.Connection.newDBDataParameter("Login", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
				base.Connection.newDBDataParameter("Password", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
				base.Connection.newDBDataParameter("SomeNullValue", DbType.Int32, ParameterDirection.Output, null, 0, 10, 0)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_User_getObject_byLogin", 
				_dataparameters
			);

			if (_dataparameters[1].Value != DBNull.Value) {
				if (_dataparameters[1].Value == System.DBNull.Value) {
					Fields.IDUser = 0L;
				} else {
					Fields.IDUser = (long)_dataparameters[1].Value;
				}
				if (_dataparameters[2].Value == System.DBNull.Value) {
					Fields.Login = string.Empty;
				} else {
					Fields.Login = (string)_dataparameters[2].Value;
				}
				if (_dataparameters[3].Value == System.DBNull.Value) {
					Fields.Password = string.Empty;
				} else {
					Fields.Password = (string)_dataparameters[3].Value;
				}
				if (_dataparameters[4].Value == System.DBNull.Value) {
					Fields.SomeNullValue_isNull = true;
				} else {
					Fields.SomeNullValue = (int)_dataparameters[4].Value;
				}

				Fields.haschanges_ = false;
				return true;
			}

			//clrObject();
			//Fields.haschanges_ = false;

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
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50, 0, 0), 

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
				base.Connection.newDBDataParameter("Login_search_", DbType.String, ParameterDirection.Input, Login_search_in, 50, 0, 0)
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
		#region public void updObject_SomeUpdateTest(...);
		/// <summary>
		/// Updates User specific(only) values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param>
		public 
#if !NET20
			virtual 
#endif
		void updObject_SomeUpdateTest(bool forceUpdate_in, out bool constraintExist_out) {
			if (forceUpdate_in || Fields.haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser", DbType.Int64, ParameterDirection.Input, Fields.IDUser, 0, 19, 0), 
					base.Connection.newDBDataParameter("Password_update", DbType.String, ParameterDirection.Input, Fields.Password, 50, 0, 0), 

					base.Connection.newDBDataParameter("ConstraintExist", DbType.Boolean, ParameterDirection.Output, null, 1)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_User_updObject_SomeUpdateTest", 
					_dataparameters
				);
				
				constraintExist_out = (bool)_dataparameters[4].Value;
				if (!constraintExist_out) {
					Fields.haschanges_ = false;
				}
			} else {
				constraintExist_out = false;
			}
		}
		#endregion
		#endregion
	}
}