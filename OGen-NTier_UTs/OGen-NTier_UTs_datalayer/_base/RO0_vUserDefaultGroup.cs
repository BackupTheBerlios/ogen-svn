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
	/// vUserDefaultGroup RecordObject which provides access to searches defined for vUserDefaultGroup table at Database.
	/// </summary>
	public sealed class RO0_vUserDefaultGroup : RO__base {
		#region internal RO0_vUserDefaultGroup();
		internal RO0_vUserDefaultGroup(
#if NET20
			DO_vUserDefaultGroup 
#else
			DO0_vUserDefaultGroup 
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
			DO_vUserDefaultGroup 
#else
			DO0_vUserDefaultGroup 
#endif
			parent_ref_;
		#endregion

		#region public Methods...
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate vUserDefaultGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate vUserDefaultGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {
					if (base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) {
						parent_ref_.iduser_ = 0L;
					} else {
						parent_ref_.iduser_ = (long)base.Record.Rows[Current]["IDUser"];
					}
					if (base.Record.Rows[Current]["Login"] == System.DBNull.Value) {
						parent_ref_.Login_isNull = true;
					} else {
						parent_ref_.login_ = (string)base.Record.Rows[Current]["Login"];
					}
					if (base.Record.Rows[Current]["IDGroup"] == System.DBNull.Value) {
						parent_ref_.IDGroup_isNull = true;
					} else {
						parent_ref_.idgroup_ = (long)base.Record.Rows[Current]["IDGroup"];
					}
					if (base.Record.Rows[Current]["Name"] == System.DBNull.Value) {
						parent_ref_.Name_isNull = true;
					} else {
						parent_ref_.name_ = (string)base.Record.Rows[Current]["Name"];
					}
					if (base.Record.Rows[Current]["Relationdate"] == System.DBNull.Value) {
						parent_ref_.Relationdate_isNull = true;
					} else {
						parent_ref_.relationdate_ = (DateTime)base.Record.Rows[Current]["Relationdate"];
					}

					parent_ref_.haschanges_ = false;
				} else {
					parent_ref_.iduser_ = (long)((base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) ? 0L : base.Record.Rows[Current]["IDUser"]);

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
		/// Opens Record, based on 'all' search. It selects vUserDefaultGroup values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		public void Open_all(
		) {
			Open_all(
				true
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects vUserDefaultGroup values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		public void Open_all(
			bool fullmode_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};
			base.Open(
				string.Format(
					"sp{0}_vUserDefaultGroup_Record_open_all{1}", 
					fullmode_in ? "0" : "", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects vUserDefaultGroup values from Database based on the 'all' search and assigns them to the Record, opening it.
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
		/// Opens Record, based on 'all' search. It selects vUserDefaultGroup values from Database based on the 'all' search and assigns them to the Record, opening it.
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
					"sp0_vUserDefaultGroup_Record_open_all_page{0}", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}
		#endregion
		#region public bool hasObject_all(...);
		/// <summary>
		/// It selects vUserDefaultGroup values from Database based on the 'all' search and checks to see if vUserDefaultGroup Keys(passed as parameters) are met.
		/// </summary>
		/// <param name="IDUser_in">vUserDefaultGroup's IDUser Key used for checking</param>
		/// <returns>True if vUserDefaultGroup Keys are met in the 'all' search, False if not</returns>
		public bool hasObject_all(
			long IDUser_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("IDUser_", DbType.Int64, ParameterDirection.Input, IDUser_in, 0)
			};
			return (bool)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_vUserDefaultGroup_Record_hasObject_all", 
				_dataparameters, 
				DbType.Boolean,
				0
			);
		}
		#endregion
		#region public long Count_all(...);
		/// <summary>
		/// Count's number of search results from vUserDefaultGroup at Database based on the 'all' search.
		/// </summary>
		/// <returns>number of existing Records for the 'all' search</returns>
		public long Count_all(
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};

			return (long)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_vUserDefaultGroup_Record_count_all", 
				_dataparameters, 
				DbType.Int64,
				0
			);
		}
		#endregion
		#endregion
		#endregion
	}
}