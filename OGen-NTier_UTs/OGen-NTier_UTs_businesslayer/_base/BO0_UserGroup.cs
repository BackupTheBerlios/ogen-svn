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
using System.Xml.Serialization;

using OGen.NTier.lib.datalayer;
using OGen.NTier.lib.businesslayer;

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.businesslayer {
	/// <summary>
	/// UserGroup BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_UserGroup">DO_UserGroup</see> for the Business Layer.
	/// </summary>
	[DOClassAttribute("UserGroup", "", "", "", false, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		BO_UserGroup 
#else
		BO0_UserGroup 
#endif
		: BO__base {
		#region public BO_UserGroup(...);
#if !NET20
		internal BO0_UserGroup() {}
#endif

		///
#if NET20
		~BO_UserGroup
#else
		~BO0_UserGroup
#endif
		() {
			if (mainaggregate__ != null) {
				mainaggregate__.Dispose(); mainaggregate__ = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_UserGroup mainaggregate__;

		///
#if NET20
		private 
#else
		protected 
#endif
		DO_UserGroup mainAggregate {
			get {
				if (mainaggregate__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate__ = new DO_UserGroup();
				}
				return mainaggregate__;
			}
		}
		#endregion
		#region public Properties...
		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public override iRecordObject Record {
			get { return mainAggregate.Record; }
		}

		public SO0_UserGroup Fields {
			get { return mainAggregate.Fields; }
		}
		#region public long IDUser { get; set; }
		/// <summary>
		/// UserGroup's IDUser.
		/// </summary>
		[DOPropertyAttribute(
			"IDUser", 
			"", 
			"", 
			true, 
			false, 
			false, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		long IDUser {
			get { return mainAggregate.Fields.IDUser; }
			set { mainAggregate.Fields.IDUser = value; }
		}
		#endregion
		#region public long IDGroup { get; set; }
		/// <summary>
		/// UserGroup's IDGroup.
		/// </summary>
		[DOPropertyAttribute(
			"IDGroup", 
			"", 
			"", 
			true, 
			false, 
			false, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		long IDGroup {
			get { return mainAggregate.Fields.IDGroup; }
			set { mainAggregate.Fields.IDGroup = value; }
		}
		#endregion
		#region public bool Relationdate_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at UserGroup's Relationdate.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		bool Relationdate_isNull {
			get { return mainAggregate.Fields.Relationdate_isNull; }
			set { mainAggregate.Fields.Relationdate_isNull = value; }
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		/// <summary>
		/// UserGroup's Relationdate.
		/// </summary>
		[DOPropertyAttribute(
			"Relationdate", 
			"", 
			"", 
			false, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		DateTime Relationdate {
			get { return mainAggregate.Fields.Relationdate; }
			set { mainAggregate.Fields.Relationdate = value; }
		}
		#endregion
		#region public bool Defaultrelation_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at UserGroup's Defaultrelation.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		bool Defaultrelation_isNull {
			get { return mainAggregate.Fields.Defaultrelation_isNull; }
			set { mainAggregate.Fields.Defaultrelation_isNull = value; }
		}
		#endregion
		#region public bool Defaultrelation { get; set; }
		/// <summary>
		/// UserGroup's Defaultrelation.
		/// </summary>
		[DOPropertyAttribute(
			"Defaultrelation", 
			"", 
			"", 
			false, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		bool Defaultrelation {
			get { return mainAggregate.Fields.Defaultrelation; }
			set { mainAggregate.Fields.Defaultrelation = value; }
		}
		#endregion
		#endregion

		#region public Methods...
		#region public SC0_UserGroup Serialize();
		public SO0_UserGroup Serialize() {
			return mainAggregate.Serialize();
		}
		#endregion
		#region public void Deserialize(SO0_UserGroup UserGroup_in);
		public void Deserialize(SO0_UserGroup UserGroup_in) {
			mainAggregate.Fields = UserGroup_in;
		}
		#endregion
		#region public SC0_UserGroup Record_Serialize();
		public SC0_UserGroup Record_Serialize() {
			return mainAggregate.Record.Serialize();
		}
		#endregion
		#endregion
	}
}