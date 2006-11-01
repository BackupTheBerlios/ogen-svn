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
	/// vUserGroup RecordObject which provides access to searches defined for vUserGroup table at Database.
	/// </summary>
	public sealed class RO0_vUserGroup : RO__base {
		#region internal RO0_vUserGroup();
		internal RO0_vUserGroup(
#if NET20
			DO_vUserGroup 
#else
			DO0_vUserGroup 
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
			DO_vUserGroup 
#else
			DO0_vUserGroup 
#endif
			parent_ref_;
		#endregion

		#region public Methods...
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate vUserGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate vUserGroup DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
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
						parent_ref_.idgroup_ = 0L;
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
					parent_ref_.login_ = (string)((base.Record.Rows[Current]["Login"] == System.DBNull.Value) ? string.Empty : base.Record.Rows[Current]["Login"]);

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