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
	/// UserGroup RecordObject which provides access to searches defined for UserGroup table at Database.
	/// </summary>
	public sealed class RO0_UserGroup : RO__base {
		#region internal RO0_UserGroup();
		internal RO0_UserGroup(
			DO0_UserGroup parent_ref_in
		) : base(
			parent_ref_in
		) {
			parent_ref_ = parent_ref_in;
		}
		#endregion

		#region private Properties...
		private DO0_UserGroup parent_ref_;
		#endregion

		#region public Methods...
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate UserGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate UserGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {
					//parent_ref_.iduser_ = (long)base.Record.Rows[Current]["IDUser"];
					parent_ref_.iduser_ = (base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) ? 0L : (long)base.Record.Rows[Current]["IDUser"];
					//parent_ref_.idgroup_ = (long)base.Record.Rows[Current]["IDGroup"];
					parent_ref_.idgroup_ = (base.Record.Rows[Current]["IDGroup"] == System.DBNull.Value) ? 0L : (long)base.Record.Rows[Current]["IDGroup"];
					//parent_ref_.relationdate_ = (DateTime)base.Record.Rows[Current]["Relationdate"];
					parent_ref_.relationdate_ = (base.Record.Rows[Current]["Relationdate"] == System.DBNull.Value) ? new DateTime(1900, 1, 1) : (DateTime)base.Record.Rows[Current]["Relationdate"];
					//parent_ref_.defaultrelation_ = (bool)base.Record.Rows[Current]["Defaultrelation"];
					parent_ref_.defaultrelation_ = (base.Record.Rows[Current]["Defaultrelation"] == System.DBNull.Value) ? false : (bool)base.Record.Rows[Current]["Defaultrelation"];

					parent_ref_.haschanges_ = false;
				} else {
					//parent_ref_.iduser_ = (long)base.Record.Rows[Current]["IDUser"];
					parent_ref_.iduser_ = (base.Record.Rows[Current]["IDUser"] == System.DBNull.Value) ? 0L : (long)base.Record.Rows[Current]["IDUser"];
					//parent_ref_.idgroup_ = (long)base.Record.Rows[Current]["IDGroup"];
					parent_ref_.idgroup_ = (base.Record.Rows[Current]["IDGroup"] == System.DBNull.Value) ? 0L : (long)base.Record.Rows[Current]["IDGroup"];

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
		#endregion
	}
}