#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Data;
using System.Xml.Serialization;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer {
	/// <summary>
	/// UserGroup DataObject which provides access to UserGroup table at Database.
	/// </summary>
	[DOClassAttribute("UserGroup", "", "", "", false, false)]
	public 
#if !NET_1_1
		partial 
#else
		abstract 
#endif
		class 
#if !NET_1_1
		DO_UserGroup 
#else
		DO0_UserGroup 
#endif
		: DO__base {
		#region public DO_UserGroup();
#if !NET_1_1
		///
		public DO_UserGroup
#else
		internal DO0_UserGroup
#endif
		() : base(
#if !NET_1_1
			DO__utils
#else
			DO0__utils
#endif
			.DBServerType, 
#if !NET_1_1
			DO__utils
#else
			DO0__utils
#endif
			.DBConnectionstring,
#if !NET_1_1
			DO__utils
#else
			DO0__utils
#endif
			.DBLogfile
		) {
			clrObject();
			Fields.haschanges_ = false;
		}
#if !NET_1_1
			/// <summary>
			/// Making the use of Database Transactions possible on a sequence of operations across multiple DataObjects.
			/// </summary>
			/// <param name="connection_in">opened Database connection with an initiated Transaction</param>
			public DO_UserGroup
#else
			internal DO0_UserGroup
#endif
		(
			DBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			Fields.haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public FO0_UserGroup Fields { get; set; }
		internal SO0_UserGroup fields_;

		public SO0_UserGroup Fields {
			get { return fields_; }
			set { fields_ = value; }
		}
		#endregion
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
		#endregion

		#region Methods...
		public override DBConnection DBConnection_createInstance(
			string dbServerType_in, 
			string connectionstring_in, 
			string logfile_in
		) {
			return 
				#if !NET_1_1
				DO__utils
				#else
				DO0__utils
				#endif
					.DBConnection_createInstance(
						dbServerType_in, 
						connectionstring_in, 
						logfile_in
					);
		}
		#region public SC0_UserGroup Serialize();
		public SO0_UserGroup Serialize() {
			return Fields;
		}
		#endregion
		#region public void clrObject();
		/// <summary>
		/// Clears all DO0_UserGroup properties, assigning them with their appropriate default property value.
		/// </summary>
		public 
#if NET_1_1
			virtual 
#endif
		void clrObject() {
			Fields = new SO0_UserGroup();
		}
		#endregion
		#region public bool getObject(...);
		/// <summary>
		/// Selects UserGroup values from Database and assigns them to the appropriate DO0_UserGroup property.
		/// </summary>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if NET_1_1
			virtual 
#endif
		bool getObject() {
			return getObject(
				Fields.IDUser, 
				Fields.IDGroup
			);
		}
		/// <summary>
		/// Selects UserGroup values from Database and assigns them to the appropriate DO0_UserGroup property.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if NET_1_1
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
						Fields.IDUser = 0L;
					} else {
						Fields.IDUser = (long)_dataparameters[0].Value;
					}
					if (_dataparameters[1].Value == System.DBNull.Value) {
						Fields.IDGroup = 0L;
					} else {
						Fields.IDGroup = (long)_dataparameters[1].Value;
					}
					if (_dataparameters[2].Value == System.DBNull.Value) {
						Fields.Relationdate_isNull = true;
					} else {
						Fields.Relationdate = (DateTime)_dataparameters[2].Value;
					}
					if (_dataparameters[3].Value == System.DBNull.Value) {
						Fields.Defaultrelation_isNull = true;
					} else {
						Fields.Defaultrelation = (bool)_dataparameters[3].Value;
					}

					Fields.haschanges_ = false;
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
#if NET_1_1
			virtual 
#endif
		void delObject() {
			delObject(
				Fields.IDUser, 
				Fields.IDGroup
			);
		}
		/// <summary>
		/// Deletes UserGroup from Database.
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		public 
#if NET_1_1
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
#if NET_1_1
			virtual 
#endif
		bool isObject() {
			return isObject(
				Fields.IDUser, 
				Fields.IDGroup
			);
		}
		/// <summary>
		/// Checks to see if UserGroup exists at Database
		/// </summary>
		/// <param name="IDUser_in">IDUser</param>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if UserGroup exists at Database, False if not</returns>
		public 
#if NET_1_1
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
#if NET_1_1
			virtual 
#endif
			bool setObject(bool forceUpdate_in) {
			bool ConstraintExist_out;
			if (forceUpdate_in || Fields.haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, Fields.IDUser, 0), 
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, Fields.IDGroup, 0), 
					base.Connection.newDBDataParameter("Relationdate_", DbType.DateTime, ParameterDirection.Input, Fields.Relationdate_isNull ? null : (object)Fields.Relationdate, 0), 
					base.Connection.newDBDataParameter("Defaultrelation_", DbType.Boolean, ParameterDirection.Input, Fields.Defaultrelation_isNull ? null : (object)Fields.Defaultrelation, 0), 

					//base.Connection.newDBDataParameter("Exists", DbType.Boolean, ParameterDirection.Output, 0, 1)
					base.Connection.newDBDataParameter("Output_", DbType.Int32, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_UserGroup_setObject", 
					_dataparameters
				);

				ConstraintExist_out = (((int)_dataparameters[4].Value & 2) == 1);
				if (!ConstraintExist_out) {
					Fields.haschanges_ = false;
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