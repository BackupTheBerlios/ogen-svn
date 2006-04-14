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
	/// Group DataObject which provides access to Group table at Database.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_Group">DO_Group</see>.
	/// </note>
	/// </summary>
	[DOClassAttribute("Group", false, false)]
	public abstract class DO0_Group : DO__base {
		#region internal DO0_Group();
		internal DO0_Group(
		) : base(
			DO0__utils.DBServerType, 
			DO0__utils.DBConnectionstring
		) {
			clrObject();
			haschanges_ = false;
		}
		internal DO0_Group(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			haschanges_ = false;
		}
		#endregion

		#region Properties...
		#region public RO0_Group Record { get; }
		private RO0_Group record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_Group Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_Group(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_Group properties since last time getObject method was run.
		/// </summary>
		public virtual bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public virtual long IDGroup { get; set; }
		internal long idgroup_;// = 0L;
		
		/// <summary>
		/// Group's IDGroup.
		/// </summary>
		[DOPropertyAttribute("IDGroup", true, true, false, "", "", "", false, false, false, false, false, true, false, false)]
		public virtual long IDGroup {
			get {
				return idgroup_;
			}
			set {
				if (idgroup_ != value) {
					idgroup_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public virtual string Name { get; set; }
		internal string name_;// = string.Empty;
		
		/// <summary>
		/// Group's Name.
		/// </summary>
		[DOPropertyAttribute("Name", false, false, false, "", "", "", false, false, false, false, false, false, false, true)]
		public virtual string Name {
			get {
				return name_;
			}
			set {
				if (name_ != value) {
					name_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public virtual void clrObject();
		/// <summary>
		/// Clears all DO0_Group properties, assigning them with their appropriate default property value.
		/// </summary>
		public virtual void clrObject() {
			IDGroup = 0L;
			Name = string.Empty;
		}
		#endregion
		#region public virtual bool getObject(...);
		/// <summary>
		/// Selects Group values from Database and assigns them to the appropriate DO0_Group property.
		/// </summary>
		/// <returns>True if Group exists at Database, False if not</returns>
		public virtual bool getObject() {
			return getObject(
				idgroup_
			);
		}
		/// <summary>
		/// Selects Group values from Database and assigns them to the appropriate DO0_Group property.
		/// </summary>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if Group exists at Database, False if not</returns>
		public virtual bool getObject(
			long IDGroup_in
		) {
			if (IDGroup_in != 0L) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.InputOutput, IDGroup_in, 0), 
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Output, null, 50)
				};
				base.Connection.Execute_SQLFunction("sp0_Group_getObject", _dataparameters);

				if (_dataparameters[0].Value != DBNull.Value) {
					idgroup_ = (_dataparameters[0].Value == System.DBNull.Value) ? 0L : (long)_dataparameters[0].Value;
					name_ = (_dataparameters[1].Value == System.DBNull.Value) ? string.Empty : (string)_dataparameters[1].Value;
					
					haschanges_ = false;
					return true;
				}
			}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion
		#region public virtual void delObject(...);
		/// <summary>
		/// Deletes Group from Database.
		/// </summary>
		public virtual void delObject() {
			delObject(
				idgroup_
			);
		}
		/// <summary>
		/// Deletes Group from Database.
		/// </summary>
		/// <param name="IDGroup_in">IDGroup</param>
		public virtual void delObject(
			long IDGroup_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup_in, 0)
			};
			base.Connection.Execute_SQLFunction("sp0_Group_delObject", _dataparameters);

			clrObject();
		}
		#endregion
		#region public virtual bool isObject(...);
		/// <summary>
		/// Checks to see if Group exists at Database
		/// </summary>
		/// <returns>True if Group exists at Database, False if not</returns>
		public virtual bool isObject() {
			return isObject(
				idgroup_
			);
		}
		/// <summary>
		/// Checks to see if Group exists at Database
		/// </summary>
		/// <param name="IDGroup_in">IDGroup</param>
		/// <returns>True if Group exists at Database, False if not</returns>
		public virtual bool isObject(
			long IDGroup_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup_in, 0)
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_Group_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#region public virtual long insObject(...);
		/// <summary>
		/// Inserts Group values into Database.
		/// </summary>
		/// <param name="selectIdentity_in">assign with True if you wish to retrieve insertion sequence/identity seed and with False if not</param>
		/// <returns>insertion sequence/identity seed</returns>
		public virtual long insObject(
			bool selectIdentity_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
				base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Output, null, 0), 
				base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, Name, 50), 

				base.Connection.newDBDataParameter("SelectIdentity_", DbType.Boolean, ParameterDirection.Input, selectIdentity_in, 1)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_Group_insObject", 
				_dataparameters
			);

			IDGroup = (long)_dataparameters[0].Value;

			return IDGroup;
		}
		#endregion
		#region public virtual void updObject(...);
		/// <summary>
		/// Updates Group values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		public virtual void updObject(bool forceUpdate_in) {
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {
					base.Connection.newDBDataParameter("IDGroup_", DbType.Int64, ParameterDirection.Input, IDGroup, 0), 
					base.Connection.newDBDataParameter("Name_", DbType.String, ParameterDirection.Input, Name, 50)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_Group_updObject", 
					_dataparameters
				);
				haschanges_ = false;
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