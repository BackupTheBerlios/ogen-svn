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
	/// UserGroup DataObject which provides access to UserGroup table at Database.
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_UserGroup">DO_UserGroup</see>.
	/// </note>
#endif
	/// </summary>
	[DOClassAttribute("UserGroup", false, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		DO_UserGroup 
#else
		DO0_UserGroup 
#endif
		: DO__base {
		#region public DO_UserGroup();
#if NET20
		///
		public DO_UserGroup
#else
		internal DO0_UserGroup
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
			public DO_UserGroup
#else
			internal DO0_UserGroup
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
		#region public RO0_UserGroup Record { get; }
		private RO0_UserGroup record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_UserGroup Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_UserGroup(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_UserGroup properties since last time getObject method was run.
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
		/// UserGroup's IDUser.
		/// </summary>
		[DOPropertyAttribute("IDUser", true, false, false, "", "User", "IDUser", false, false, false, false, false, true, false, false)]
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
		#region public long IDGroup { get; set; }
		internal long idgroup_;// = 0L;
		
		/// <summary>
		/// UserGroup's IDGroup.
		/// </summary>
		[DOPropertyAttribute("IDGroup", true, false, false, "", "Group", "IDGroup", false, false, false, false, false, true, false, false)]
		public 
#if !NET20
			virtual 
#endif
			long IDGroup {
			get {
				return idgroup_;
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
		/// UserGroup's Relationdate.
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
		#region public bool Defaultrelation_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Defaultrelation_isNull {
			get { return (defaultrelation_ == null); }
			set {
				//if (value) defaultrelation_ = null;

				if ((value) && (defaultrelation_ != null)) {
					defaultrelation_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Defaultrelation { get; set; }
		internal object defaultrelation_;// = false;
		
		/// <summary>
		/// UserGroup's Defaultrelation.
		/// </summary>
		[DOPropertyAttribute("Defaultrelation", false, false, true, "", "", "", false, false, false, true, false, false, false, false)]
		public 
#if !NET20
			virtual 
#endif
			bool Defaultrelation {
			get {
				return (bool)((defaultrelation_ == null) ? false : defaultrelation_);
			}
			set {
				if (
					(!value.Equals(defaultrelation_))
				) {
					defaultrelation_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public void clrObject();
		/// <summary>
		/// Clears all DO0_UserGroup properties, assigning them with their appropriate default property value.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			void clrObject() {
			IDUser = 0L;
			IDGroup = 0L;
			Relationdate_isNull = true;
			Defaultrelation_isNull = true;
		}
		#endregion
		#region public bool getObject(...);
		/// <summary>
		/// Selects UserGroup values from Database and assigns them to the appropriate DO0_UserGroup property.
		/// </summary>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject() {
			return getObject(
				iduser_, 
				idgroup_
			);
		}
		/// <summary>
		/// Selects UserGroup values from Database and assigns them to the appropriate DO0_UserGroup property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject(
			long IDUser_in, 
			long IDGroup_in
		) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.InputOutput, IDUser_in, 0), 
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.InputOutput, IDGroup_in, 0), 
					base.Connection.newDBDataParameter("Relationdate_", DbType.DateTime, ParameterDirection.Output, null, 0), 
					base.Connection.newDBDataParameter("Defaultrelation_", DbType.Boolean, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction("sp0_UserGroup_getObject", _dataparameters);

				if (_dataparameters[0].Value != DBNull.Value) {
					if (_dataparameters[0].Value == System.DBNull.Value) {
						iduser_ = 0L;
					} else {
						iduser_ = (long)_dataparameters[0].Value;
					}
					if (_dataparameters[1].Value == System.DBNull.Value) {
						idgroup_ = 0L;
					} else {
						idgroup_ = (long)_dataparameters[1].Value;
					}
					if (_dataparameters[2].Value == System.DBNull.Value) {
						Relationdate_isNull = true;
					} else {
						relationdate_ = (DateTime)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						Defaultrelation_isNull = true;
					} else {
						defaultrelation_ = (bool)_dataparameters[3].Value;
					}

					haschanges_ = false;
					return true;
				}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public void delObject(...);
		/// <summary>
		/// Deletes UserGroup from Database.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			void delObject() {
			delObject(
				iduser_, 
				idgroup_
			);
		}
		/// <summary>
		/// Deletes UserGroup from Database.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		public 
#if !NET20
			virtual 
#endif
			void delObject(
			long IDUser_in, 
			long IDGroup_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0), 
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup_in, 0)
			};
			base.Connection.Execute_SQLFunction("sp0_UserGroup_delObject", _dataparameters);

			clrObject();
		}
		#endregion
		#region public bool isObject(...);
		/// <summary>
		/// Checks to see if UserGroup exists at Database
		/// </summary>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool isObject() {
			return isObject(
				iduser_, 
				idgroup_
			);
		}
		/// <summary>
		/// Checks to see if UserGroup exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool isObject(
			long IDUser_in, 
			long IDGroup_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0), 
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup_in, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_UserGroup_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#region public bool setObject(...);
		/// <summary>
		/// Inserts/Updates UserGroup values into/on Database. Inserts if UserGroup doesn't exist or Updates if UserGroup already exists.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <returns>True if it didn't exist (INSERT), and False if it did exist (UPDATE)</returns>
		public 
#if !NET20
			virtual 
#endif
			bool setObject(bool forceUpdate_in) {
			bool ConstraintExist_out;
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, iduser_, 0), 
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, idgroup_, 0), 
					base.Connection.newDBDataParameter("Relationdate_", DbType.DateTime, ParameterDirection.Input, relationdate_, 0), 
					base.Connection.newDBDataParameter("Defaultrelation_", DbType.Boolean, ParameterDirection.Input, defaultrelation_, 0), 

					//base.Connection.newDBDataParameter("Exists", DbType.Boolean, ParameterDirection.Output, 0, 1)
					base.Connection.newDBDataParameter("Output_", DbType.Int32, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_UserGroup_setObject", 
					_dataparameters
				);

				ConstraintExist_out = (((int)_dataparameters[4].Value & 2) == 1);
				if (!ConstraintExist_out) {
					haschanges_ = false;
				}

				return (((int)_dataparameters[4].Value & 1) != 1);
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