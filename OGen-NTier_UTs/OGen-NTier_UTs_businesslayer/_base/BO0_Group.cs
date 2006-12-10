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
	/// Group BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_Group">DO_Group</see> for the Business Layer.
	/// </summary>
	[DOClassAttribute("Group", "", "", "", false, false)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		BO_Group 
#else
		BO0_Group 
#endif
		: BO__base {
		#region public BO_Group(...);
#if !NET20
		internal BO0_Group() {}
#endif

		///
#if NET20
		~BO_Group
#else
		~BO0_Group
#endif
		() {
			if (mainaggregate__ != null) {
				mainaggregate__.Dispose(); mainaggregate__ = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_Group mainaggregate__;

		///
#if NET20
		private 
#else
		protected 
#endif
		DO_Group mainAggregate {
			get {
				if (mainaggregate__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate__ = new DO_Group();
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

		public SO0_Group Fields {
			get { return mainAggregate.Fields; }
		}
		#region public long IDGroup { get; set; }
		/// <summary>
		/// Group's IDGroup.
		/// </summary>
		[DOPropertyAttribute(
			"IDGroup", 
			"", 
			"", 
			true, 
			true, 
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
		/// Group's Name.
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
		#endregion

		#region public Methods...
		#region public SC0_Group Serialize();
		public SO0_Group Serialize() {
			return mainAggregate.Serialize();
		}
		#endregion
		#region public void Deserialize(SO0_Group Group_in);
		public void Deserialize(SO0_Group Group_in) {
			mainAggregate.Fields = Group_in;
		}
		#endregion
		#region public SC0_Group Record_Serialize();
		public SC0_Group Record_Serialize() {
			return mainAggregate.Record.Serialize();
		}
		#endregion
		#endregion
	}
}