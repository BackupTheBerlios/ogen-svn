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
	/// User RecordObject which provides access to searches defined for User table at Database.
	/// </summary>
	public sealed class RO0_User : RO__base {
		#region internal RO0_User();
		internal RO0_User(
#if NET20
			DO_User 
#else
			DO0_User 
#endif
			parent_ref_in
		) : base(
			parent_ref_in
		) {
			parent_ref_ = parent_ref_in;
		}
		#endregion

		#region private Properties...
		private 
#if NET20
			DO_User 
#else
			DO0_User 
#endif
			parent_ref_;
		#endregion

		#region public Methods...
		#region //public SC0_User Serialize();
		//public SC0_User Serialize() {
		//	return new SC0_User(Record);
		//}
		#endregion
		#region public SC0_User Serialize();
		public SC0_User Serialize() {
			SO0_User[] _serialisableobject;

			lock (record__) {
				int _current = Current;

				_serialisableobject = new SO0_User[Count];

				Reset();
				while (Read()) {
					_serialisableobject[Current] 
						= new SO0_User(
							parent_ref_.Fields.IDUser,
							parent_ref_.Fields.Login,
							parent_ref_.Fields.Password,
							parent_ref_.Fields.SomeNullValue
						);
				}

				Current = _current;
			}

			SC0_User _serialize_out = new SC0_User();
			_serialize_out.SO0_User = _serialisableobject;
			return _serialize_out;
		}
		#endregion
		#region public void Open(SC0_User serialisablecollection_in);
		public void Open(SC0_User serialisablecollection_in) {
			Open(serialisablecollection_in.SO0_User);
		}
		#endregion
		#region public void Open(SO0_User[] serialisableobject_in);
		public void Open(SO0_User[] serialisableobject_in) {
			DataTable _datatable = new DataTable();
			_datatable.Columns.Add(new DataColumn("codProfissao", typeof(int)));
			_datatable.Columns.Add(new DataColumn("descProfissao", typeof(string)));

			DataRow _datarow;
			for (int i = 0; i < serialisableobject_in.Length; i++) {
			    _datarow = _datatable.NewRow();
				_datarow["IDUser"] = serialisableobject_in[i].IDUser;
				_datarow["Login"] = serialisableobject_in[i].Login;
				_datarow["Password"] = serialisableobject_in[i].Password;
				_datarow["SomeNullValue"] = serialisableobject_in[i].SomeNullValue;

			    _datatable.Rows.Add(_datarow);
			}

			Open(true, _datatable);
		}
		#endregion
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate User DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate User DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {
					if (base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) {
						parent_ref_.Fields.iduser_ = 0L;
					} else {
						parent_ref_.Fields.iduser_ = (long)base.Record.Rows[Current]["IDUser"];
					}
					if (base.Record.Rows[Current]["Login"] == System.DBNull.Value) {
						parent_ref_.Fields.login_ = string.Empty;
					} else {
						parent_ref_.Fields.login_ = (string)base.Record.Rows[Current]["Login"];
					}
					if (base.Record.Rows[Current]["Password"] == System.DBNull.Value) {
						parent_ref_.Fields.password_ = string.Empty;
					} else {
						parent_ref_.Fields.password_ = (string)base.Record.Rows[Current]["Password"];
					}
					if (base.Record.Rows[Current]["SomeNullValue"] == System.DBNull.Value) {
						parent_ref_.Fields.SomeNullValue_isNull = true;
					} else {
						parent_ref_.Fields.somenullvalue_ = (int)base.Record.Rows[Current]["SomeNullValue"];
					}

					parent_ref_.Fields.haschanges_ = false;
				} else {
					parent_ref_.Fields.IDUser = (long)((base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) ? 0L : base.Record.Rows[Current]["IDUser"]);

					if (!doNOTgetObject_in) {
						parent_ref_.getObject();
					}
				}

				return true;
			} else {
				parent_ref_.clrObject();

				return false;
			}
		}
		#endregion
		//---
		#region public void ????_all
		#region public void Open_all(...);
		/// <summary>
		/// Opens Record, based on 'all' search. It selects User values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		public void Open_all(
		) {
			Open_all(
				true
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects User values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		public void Open_all(
			bool fullmode_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};
			base.Open(
				string.Format(
					"sp{0}_User_Record_open_all{1}", 
					fullmode_in ? "0" : "", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects User values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_all(
			int page_in, 
			int page_numRecords_in
		) {
			Open_all(
				true, 
				page_in, 
				page_numRecords_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects User values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_all(
			bool fullmode_in, 
			int page_in, 
			int page_numRecords_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("page_", DbType.Int32, ParameterDirection.Input, page_in, 0), 
				parent_ref_.Connection.newDBDataParameter("page_numRecords_", DbType.Int32, ParameterDirection.Input, page_numRecords_in, 0)
			};
			base.Open(
				string.Format(
					"sp0_User_Record_open_all_page{0}", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}
		#endregion
		#region public bool hasObject_all(...);
		/// <summary>
		/// It selects User values from Database based on the 'all' search and checks to see if User Keys(passed as parameters) are met.
		/// </summary>
		/// <param name="IDUser_in">User's IDUser Key used for checking</param>
		/// <returns>True if User Keys are met in the 'all' search, False if not</returns>
		public bool hasObject_all(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0, 19, 0)
			};
			return (bool)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_User_Record_hasObject_all", 
				_dataparameters, 
				DbType.Boolean,
				0
			);
		}
		#endregion
		#region public long Count_all(...);
		/// <summary>
		/// Count's number of search results from User at Database based on the 'all' search.
		/// </summary>
		/// <returns>number of existing Records for the 'all' search</returns>
		public long Count_all(
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};

			return (long)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_User_Record_count_all", 
				_dataparameters, 
				DbType.Int64,
				0
			);
		}
		#endregion
		#region public void Delete_all(...);
		/// <summary>
		/// Deletes User values from Database based on the 'all' search.
		/// </summary>
		public void Delete_all(
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};

			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_User_Record_delete_all", 
				_dataparameters
			);
		}
		#endregion
		#endregion
		#region public void ????_byGroup
		#region public void Open_byGroup(...);
		/// <summary>
		/// Opens Record, based on 'byGroup' search. It selects User values from Database based on the 'byGroup' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		public void Open_byGroup(
			long IDGroup_search_in
		) {
			Open_byGroup(
				IDGroup_search_in, 
				true
			);
		}

		/// <summary>
		/// Opens Record, based on 'byGroup' search. It selects User values from Database based on the 'byGroup' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		public void Open_byGroup(
			long IDGroup_search_in, 
			bool fullmode_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0)
			};
			base.Open(
				string.Format(
					"sp{0}_User_Record_open_byGroup{1}", 
					fullmode_in ? "0" : "", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'byGroup' search. It selects User values from Database based on the 'byGroup' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_byGroup(
			long IDGroup_search_in, 
			int page_in, 
			int page_numRecords_in
		) {
			Open_byGroup(
				IDGroup_search_in, 
				true, 
				page_in, 
				page_numRecords_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'byGroup' search. It selects User values from Database based on the 'byGroup' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_byGroup(
			long IDGroup_search_in, 
			bool fullmode_in, 
			int page_in, 
			int page_numRecords_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0), 
				parent_ref_.Connection.newDBDataParameter("page_", DbType.Int32, ParameterDirection.Input, page_in, 0), 
				parent_ref_.Connection.newDBDataParameter("page_numRecords_", DbType.Int32, ParameterDirection.Input, page_numRecords_in, 0)
			};
			base.Open(
				string.Format(
					"sp0_User_Record_open_byGroup_page{0}", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}
		#endregion
		#region public bool Update_SomeUpdateTest_byGroup(...);
		/// <summary>
		/// Updates (some) User values on Database based on the 'byGroup' search.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <param name="Password_update_in">Password update value</param>
		public void Update_SomeUpdateTest_byGroup(
			long IDGroup_search_in, 
			string Password_update_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0), 
				parent_ref_.Connection.newDBDataParameter("Password_update_", DbType.String, ParameterDirection.Input, Password_update_in, 50, 0, 0)
			};
			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_User_Record_update_SomeUpdateTest_byGroup", 
				_dataparameters
			);
		}
		#endregion
		#region public bool hasObject_byGroup(...);
		/// <summary>
		/// It selects User values from Database based on the 'byGroup' search and checks to see if User Keys(passed as parameters) are met.
		/// </summary>
		/// <param name="IDUser_in">User's IDUser Key used for checking</param>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <returns>True if User Keys are met in the 'byGroup' search, False if not</returns>
		public bool hasObject_byGroup(
			long IDUser_in, 
			long IDGroup_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0, 19, 0), 
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0)
			};
			return (bool)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_User_Record_hasObject_byGroup", 
				_dataparameters, 
				DbType.Boolean,
				0
			);
		}
		#endregion
		#region public long Count_byGroup(...);
		/// <summary>
		/// Count's number of search results from User at Database based on the 'byGroup' search.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		/// <returns>number of existing Records for the 'byGroup' search</returns>
		public long Count_byGroup(
			long IDGroup_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0)
			};

			return (long)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_User_Record_count_byGroup", 
				_dataparameters, 
				DbType.Int64,
				0
			);
		}
		#endregion
		#region public void Delete_byGroup(...);
		/// <summary>
		/// Deletes User values from Database based on the 'byGroup' search.
		/// </summary>
		/// <param name="IDGroup_search_in">IDGroup search condition</param>
		public void Delete_byGroup(
			long IDGroup_search_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDGroup_search_", DbType.Int64, ParameterDirection.Input, IDGroup_search_in, 0, 19, 0)
			};

			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_User_Record_delete_byGroup", 
				_dataparameters
			);
		}
		#endregion
		#endregion
		#endregion
	}
}