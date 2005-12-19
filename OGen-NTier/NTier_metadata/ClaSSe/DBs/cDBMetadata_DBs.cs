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
using System.Reflection;
using System.Collections;
using OGen.lib.collections;
using OGen.lib.datalayer;

namespace OGen.NTier.lib.metadata {
	public class cDBMetadata_DBs : cClaSSe, iDBMetadata_DBs {
		#region public cDBMetadata_DBs(...);
		public cDBMetadata_DBs(
			iClaSSe aggregateloopback_ref_in, 
			cDBMetadata root_ref_in
		) : base (
			aggregateloopback_ref_in
		) {
			root_ref_ = root_ref_in;

			//#region ClaSSe...
			dbs_ = new ArrayList();
			//#endregion
		}
		#endregion

		#region Implementing - iClaSSe...
		#region public override object Property_new(string name_in);
		public override object Property_new(string name_in) {
			switch (name_in) {
				case "db":
					return new cDBMetadata_DB(this, eDBServerTypes.invalid, "");
				default:
					throw new Exception(string.Format(
						"{0}.{1}.Property_new(): - invalid Name: {2}", 
						this.GetType().Namespace,
						this.GetType().Name,
						name_in
					));
			}
		}
		#endregion
		#region public PropertyInfo[] Properties { get; }
		private static PropertyInfo[] properties__ = null;
		public override PropertyInfo[] Properties {
			get {
				if (properties__ == null) {
					InitializeStaticFields(
						ref properties__, 
						ref attributes__
					);
				}
				return properties__;
			}
		}
		#endregion
		#region public ClaSSPropertyAttribute[] Attributes { get; }
		private static ClaSSPropertyAttribute[] attributes__ = null;
		public override ClaSSPropertyAttribute[] Attributes {
			get {
				if (attributes__ == null) {
					InitializeStaticFields(
						ref properties__, 
						ref attributes__
					);
				}
				return attributes__;
			}
		}
		#endregion
		#endregion

		#region Properties - ClaSSe...
		#region private ArrayList dbs_ { get; set; }
		private ArrayList dbs_;

		[ClaSSPropertyAttribute("db", ClaSSPropertyAttribute.eType.aggregate_collection, true)]
		private ArrayList dbs_reflection {
			get { return dbs_; }
			set { dbs_ = value; }
		}
		#endregion
		#endregion
		#region Properties...
		#region public cDBMetadata Root_ref;
		private cDBMetadata root_ref_;
		public cDBMetadata Root_ref {
			get { return root_ref_; }
		}
		#endregion
		//---
		#region public int Count { get; }
		public int Count {
			get { return dbs_.Count; }
		}
		#endregion
		#region public new cDBMetadata_DB this[...];
		public cDBMetadata_DB this[int index_in] {
			get {
				return (cDBMetadata_DB)dbs_[index_in];
			}
		}
		public cDBMetadata_DB this[eDBServerTypes dbservertype_in, string configMode_in] {
			get {
				int _ti = Search(dbservertype_in, configMode_in);
				return (_ti >= 0) ?
					(cDBMetadata_DB)dbs_[_ti] :
					null;
			}
		}
		#endregion
		#region public cDBMetadata_DB Default { get; set; }
		public cDBMetadata_DB Default {
			get {
				return this[
					root_ref_.default_dbservertype_, 
					root_ref_.default_configmode_
				];
			}
			set {
				root_ref_.default_dbservertype_ = value.DBServerType;
				root_ref_.default_configmode_ = value.ConfigMode;
			}
		}
		#endregion
		#endregion

		#region Methods...
		#region public void Clear(...);
		public void Clear() {
			dbs_.Clear();
		}
		#endregion
		#region public int Add(...)
		public int Add(eDBServerTypes dbservertype_in, string configMode_in, bool verifyExistenz_in) {
			int _ti;

			if (verifyExistenz_in) {
				_ti = Search(dbservertype_in, configMode_in);
				if (_ti != -1)
					return _ti;
			}

			_ti = dbs_.Add(
				new cDBMetadata_DB(
					this, 
					dbservertype_in, 
					configMode_in
				)
			);
			return _ti; // returns it's position
		}
		#endregion
		#region public int Search(...)
		public int Search(eDBServerTypes dbservertype_in, string configMode_in) {
			for (int t = 0; t < dbs_.Count; t++)
				if (
					(((cDBMetadata_DB)dbs_[t]).DBServerType == dbservertype_in)
					&&
					(((cDBMetadata_DB)dbs_[t]).ConfigMode == configMode_in)
				) // already exists!
					return t; // returns it's position

			return -1;
		}
		#endregion
		#region public void CopyFrom(...);
		public void CopyFrom(iDBMetadata_DBs dbMetadata_DBs_in) {
			Clear();
			for (int d = 0; d < dbMetadata_DBs_in.Count; d++) {
				int _AddedAt = Add(
					dbMetadata_DBs_in[d].DBServerType, 
					dbMetadata_DBs_in[d].ConfigMode, 
					true
				);
				this[_AddedAt].Connectionstring = 
					dbMetadata_DBs_in[d].Connectionstring;
			}
		}
		#endregion
		#endregion
	}
}