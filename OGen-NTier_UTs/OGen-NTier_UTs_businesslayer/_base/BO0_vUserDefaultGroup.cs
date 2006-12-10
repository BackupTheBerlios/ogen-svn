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
	/// vUserDefaultGroup BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_vUserDefaultGroup">DO_vUserDefaultGroup</see> for the Business Layer.
	/// </summary>
	[DOClassAttribute("vUserDefaultGroup", "", "", "", true, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		BO_vUserDefaultGroup 
#else
		BO0_vUserDefaultGroup 
#endif
		: BO__base {
		#region public BO_vUserDefaultGroup(...);
#if !NET20
		internal BO0_vUserDefaultGroup() {}
#endif

		///
#if NET20
		~BO_vUserDefaultGroup
#else
		~BO0_vUserDefaultGroup
#endif
		() {
			if (mainaggregate__ != null) {
				mainaggregate__.Dispose(); mainaggregate__ = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_vUserDefaultGroup mainaggregate__;

		///
#if NET20
		private 
#else
		protected 
#endif
		DO_vUserDefaultGroup mainAggregate {
			get {
				if (mainaggregate__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate__ = new DO_vUserDefaultGroup();
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

		public SO0_vUserDefaultGroup Fields {
			get { return mainAggregate.Fields; }
		}
		#region public long IDUser { get; set; }
		/// <summary>
		/// vUserDefaultGroup's IDUser.
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
		#region public string Login { get; set; }
		/// <summary>
		/// vUserDefaultGroup's Login.
		/// </summary>
		[DOPropertyAttribute(
			"Login", 
			"", 
			"", 
			false, 
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
			false, 
			false, 
			true, 
			false, 
			false, 
			50, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		string Login {
			get { return mainAggregate.Fields.Login; }
			set { mainAggregate.Fields.Login = value; }
		}
		#endregion
		#region public long IDGroup { get; set; }
		/// <summary>
		/// vUserDefaultGroup's IDGroup.
		/// </summary>
		[DOPropertyAttribute(
			"IDGroup", 
			"", 
			"", 
			false, 
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
		#region public string Name { get; set; }
		/// <summary>
		/// vUserDefaultGroup's Name.
		/// </summary>
		[DOPropertyAttribute(
			"Name", 
			"", 
			"", 
			false, 
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
			false, 
			false, 
			true, 
			false, 
			false, 
			50, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		string Name {
			get { return mainAggregate.Fields.Name; }
			set { mainAggregate.Fields.Name = value; }
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		/// <summary>
		/// vUserDefaultGroup's Relationdate.
		/// </summary>
		[DOPropertyAttribute(
			"Relationdate", 
			"", 
			"", 
			false, 
			false, 
			false, 
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
		#endregion

		#region public Methods...
		#region public SC0_vUserDefaultGroup Serialize();
		public SO0_vUserDefaultGroup Serialize() {
			return mainAggregate.Serialize();
		}
		#endregion
		#region public void Deserialize(SO0_vUserDefaultGroup vUserDefaultGroup_in);
		public void Deserialize(SO0_vUserDefaultGroup vUserDefaultGroup_in) {
			mainAggregate.Fields = vUserDefaultGroup_in;
		}
		#endregion
		#region public SC0_vUserDefaultGroup Record_Serialize();
		public SC0_vUserDefaultGroup Record_Serialize() {
			return mainAggregate.Record.Serialize();
		}
		#endregion
		#endregion
	}
}