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
	/// Group RecordObject which provides access to searches defined for Group table at Database.
	/// </summary>
	public sealed class RO0_Group : RO__base {
		#region internal RO0_Group();
		internal RO0_Group(
#if NET20
			DO_Group 
#else
			DO0_Group 
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
			DO_Group 
#else
			DO0_Group 
#endif
			parent_ref_;
		#endregion

		#region public Methods...
		#region //public SC0_Group Serialize();
		//public SC0_Group Serialize() {
		//	return new SC0_Group(Record);
		//}
		#endregion
		#region public SC0_Group Serialize();
		public SC0_Group Serialize() {
			SO0_Group[] _serialisableobject;

			lock (record__) {
				int _current = Current;

				_serialisableobject = new SO0_Group[Count];

				Reset();
				while (Read()) {
					_serialisableobject[Current] 
						= new SO0_Group(
							parent_ref_.Fields.IDGroup,
							parent_ref_.Fields.Name
						);
				}

				Current = _current;
			}

			SC0_Group _serialize_out = new SC0_Group();
			_serialize_out.SO0_Group = _serialisableobject;
			return _serialize_out;
		}
		#endregion
		#region public void Open(SC0_Group serialisablecollection_in);
		public void Open(SC0_Group serialisablecollection_in) {
			Open(serialisablecollection_in.SO0_Group);
		}
		#endregion
		#region public void Open(SO0_Group[] serialisableobject_in);
		public void Open(SO0_Group[] serialisableobject_in) {
			DataTable _datatable = new DataTable();
			_datatable.Columns.Add(new DataColumn("codProfissao", typeof(int)));
			_datatable.Columns.Add(new DataColumn("descProfissao", typeof(string)));

			DataRow _datarow;
			for (int i = 0; i < serialisableobject_in.Length; i++) {
			    _datarow = _datatable.NewRow();
				_datarow["IDGroup"] = serialisableobject_in[i].IDGroup;
				_datarow["Name"] = serialisableobject_in[i].Name;

			    _datatable.Rows.Add(_datarow);
			}

			Open(true, _datatable);
		}
		#endregion
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate Group DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate Group DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {
					if (base.Record.Rows[Current]["IDGroup"] == System.DBNull.Value) {
						parent_ref_.Fields.idgroup_ = 0L;
					} else {
						parent_ref_.Fields.idgroup_ = (long)base.Record.Rows[Current]["IDGroup"];
					}
					if (base.Record.Rows[Current]["Name"] == System.DBNull.Value) {
						parent_ref_.Fields.name_ = string.Empty;
					} else {
						parent_ref_.Fields.name_ = (string)base.Record.Rows[Current]["Name"];
					}

					parent_ref_.Fields.haschanges_ = false;
				} else {
					parent_ref_.Fields.IDGroup = (long)((base.Record.Rows[Current]["IDGroup"] == System.DBNull.Value) ? 0L : base.Record.Rows[Current]["IDGroup"]);

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