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

using OGen.NTier.lib.datalayer;
using OGen.NTier.lib.businesslayer;

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.businesslayer {
	/// <summary>
	/// UserGroup BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_UserGroup">DO_UserGroup</see> for the Business Layer.
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_UserGroup">BO_UserGroup</see>.
	/// </note>
#endif
	/// </summary>
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
#if NET20
		public BO_UserGroup
#else
		internal BO0_UserGroup
#endif
		() {}

		///
#if NET20
		~BO_UserGroup
#else
		~BO0_UserGroup
#endif
		() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_UserGroup mainaggregate;

		///
		protected DO_UserGroup mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_UserGroup();
				}
				return mainaggregate;
			}
		}

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public override iRecordObject Record {
			get { return mainAggregate.Record; }
		}
		#endregion
		#region public Properties...
		#region public long IDUser { get; set; }
		/// <summary>
		/// UserGroup's IDUser.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			long IDUser {
			get { return mainAggregate.IDUser; }
			set { mainAggregate.IDUser = value; }
		}
		#endregion
		#region public long IDGroup { get; set; }
		/// <summary>
		/// UserGroup's IDGroup.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			long IDGroup {
			get { return mainAggregate.IDGroup; }
			set { mainAggregate.IDGroup = value; }
		}
		#endregion
		#region public bool Relationdate_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Relationdate_isNull {
			get { return mainAggregate.Relationdate_isNull; }
			set { mainAggregate.Relationdate_isNull = value; }
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		/// <summary>
		/// UserGroup's Relationdate.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			DateTime Relationdate {
			get { return mainAggregate.Relationdate; }
			set { mainAggregate.Relationdate = value; }
		}
		#endregion
		#region public bool Defaultrelation_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Defaultrelation_isNull {
			get { return mainAggregate.Defaultrelation_isNull; }
			set { mainAggregate.Defaultrelation_isNull = value; }
		}
		#endregion
		#region public bool Defaultrelation { get; set; }
		/// <summary>
		/// UserGroup's Defaultrelation.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			bool Defaultrelation {
			get { return mainAggregate.Defaultrelation; }
			set { mainAggregate.Defaultrelation = value; }
		}
		#endregion
		#endregion
	}
}