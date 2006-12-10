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
	/// vUserGroup DataObject which provides access to vUserGroup view at Database.
	/// </summary>
	[DOClassAttribute("vUserGroup", "", "", "", true, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		DO_vUserGroup 
#else
		DO0_vUserGroup 
#endif
		: DO__base {
		#region public DO_vUserGroup();
#if NET20
		///
		public DO_vUserGroup
#else
		internal DO0_vUserGroup
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
			public DO_vUserGroup
#else
			internal DO0_vUserGroup
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
		#region public FO0_vUserGroup Fields { get; set; }
		internal SO0_vUserGroup fields_;

		public SO0_vUserGroup Fields {
			get { return fields_; }
			set { fields_ = value; }
		}
		#endregion
		#region public RO0_vUserGroup Record { get; }
		private RO0_vUserGroup record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_vUserGroup Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_vUserGroup(this);
				}
				return record__;
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public SC0_vUserGroup Serialize();
		public SO0_vUserGroup Serialize() {
			return Fields;
		}
		#endregion
		#region public void clrObject();
		/// <summary>
		/// Clears all DO0_vUserGroup properties, assigning them with their appropriate default property value.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		void clrObject() {
			Fields = new SO0_vUserGroup();
		}
		#endregion
		#region public bool getObject(...);
		/// <summary>
		/// Selects vUserGroup values from Database and assigns them to the appropriate DO0_vUserGroup property.
		/// </summary>
		/// <returns>True if vUserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool getObject() {
			return getObject(
				Fields.IDUser, 
				Fields.IDGroup
			);
		}
		/// <summary>
		/// Selects vUserGroup values from Database and assigns them to the appropriate DO0_vUserGroup property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if vUserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
			bool getObject(
			long IDUser_in, 
			long IDGroup_in
		) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.InputOutput, IDUser_in, 0, 19, 0), 
					base.Connection.newDBDataParameter("Login_", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.InputOutput, IDGroup_in, 0, 19, 0), 
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Output, null, 50, 0, 0), 
					base.Connection.newDBDataParameter("Relationdate_", DbType.DateTime, ParameterDirection.Output, null, 0, 0, 0)
				};
				base.Connection.Execute_SQLFunction("sp0_vUserGroup_getObject", _dataparameters);

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
						Fields.IDGroup = 0L;
					} else {
						Fields.IDGroup = (long)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						Fields.Name = string.Empty;
					} else {
						Fields.Name = (string)_dataparameters[3].Value;
					}
					if (_dataparameters[4].Value == System.DBNull.Value) {
						Fields.Relationdate = new DateTime(1900, 1, 1);
					} else {
						Fields.Relationdate = (DateTime)_dataparameters[4].Value;
					}

					Fields.haschanges_ = false;
					return true;
				}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public bool isObject(...);
		/// <summary>
		/// Checks to see if vUserGroup exists at Database
		/// </summary>
		/// <returns>True if vUserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool isObject() {
			return isObject(
				Fields.IDUser, 
				Fields.IDGroup
			);
		}
		/// <summary>
		/// Checks to see if vUserGroup exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if vUserGroup exists at Database, False if not</returns>
		public 
#if !NET20
			virtual 
#endif
		bool isObject(
			long IDUser_in, 
			long IDGroup_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0, 19, 0), 
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup_in, 0, 19, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_vUserGroup_isObject", 
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