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
	/// Config RecordObject which provides access to searches defined for Config table at Database.
	/// </summary>
	public sealed class RO0_Config : RO__base {
		#region internal RO0_Config();
		internal RO0_Config(
			DO0_Config parent_ref_in
		) : base(
			parent_ref_in
		) {
			parent_ref_ = parent_ref_in;
		}
		#endregion

		#region private Properties...
		private DO0_Config parent_ref_;
		#endregion

		#region public Methods...
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate Config DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate Config DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {
					//parent_ref_.name_ = (string)base.Record.Rows[Current]["Name"];
					parent_ref_.name_ = (base.Record.Rows[Current]["Name"] == System.DBNull.Value) ? string.Empty : (string)base.Record.Rows[Current]["Name"];
					//parent_ref_.config_ = (string)base.Record.Rows[Current]["Config"];
					parent_ref_.config_ = (base.Record.Rows[Current]["Config"] == System.DBNull.Value) ? string.Empty : (string)base.Record.Rows[Current]["Config"];
					//parent_ref_.type_ = (int)base.Record.Rows[Current]["Type"];
					parent_ref_.type_ = (base.Record.Rows[Current]["Type"] == System.DBNull.Value) ? 0 : (int)base.Record.Rows[Current]["Type"];

					parent_ref_.haschanges_ = false;
				} else {
					//parent_ref_.name_ = (string)base.Record.Rows[Current]["Name"];
					parent_ref_.name_ = (base.Record.Rows[Current]["Name"] == System.DBNull.Value) ? string.Empty : (string)base.Record.Rows[Current]["Name"];

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
		/// Opens Record, based on 'all' search. It selects Config values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		public void Open_all(
		) {
			Open_all(
				true
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects Config values from Database based on the 'all' search and assigns them to the Record, opening it.
		/// </summary>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		public void Open_all(
			bool fullmode_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};
			base.Open(
				string.Format(
					"sp{0}_Config_Record_open_all{1}", 
					fullmode_in ? "0" : "", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}

		/// <summary>
		/// Opens Record, based on 'all' search. It selects Config values from Database based on the 'all' search and assigns them to the Record, opening it.
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
		/// Opens Record, based on 'all' search. It selects Config values from Database based on the 'all' search and assigns them to the Record, opening it.
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
					"sp0_Config_Record_open_all_page{0}", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}
		#endregion
		#region public bool hasObject_all(...);
		/// <summary>
		/// It selects Config values from Database based on the 'all' search and checks to see if Config Keys(passed as parameters) are met.
		/// </summary>
		/// <param name="Name_in">Config's Name Key used for checking</param>
		/// <returns>True if Config Keys are met in the 'all' search, False if not</returns>
		public bool hasObject_all(
			string Name_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				parent_ref_.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, Name_in, 50)
			};
			return (bool)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_Config_Record_hasObject_all", 
				_dataparameters, 
				DbType.Boolean,
				0
			);
		}
		#endregion
		#region public long Count_all(...);
		/// <summary>
		/// Count's number of search results from Config at Database based on the 'all' search.
		/// </summary>
		/// <returns>number of existing Records for the 'all' search</returns>
		public long Count_all(
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};

			return (long)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_Config_Record_count_all", 
				_dataparameters, 
				DbType.Int64,
				0
			);
		}
		#endregion
		#region public void Delete_all(...);
		/// <summary>
		/// Deletes Config values from Database based on the 'all' search.
		/// </summary>
		public void Delete_all(
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
			};

			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_Config_Record_delete_all", 
				_dataparameters
			);
		}
		#endregion
		#endregion
		#endregion
	}
}