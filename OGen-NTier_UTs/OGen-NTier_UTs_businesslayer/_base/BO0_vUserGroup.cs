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
	/// vUserGroup BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_vUserGroup">DO_vUserGroup</see> for the Business Layer.
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_vUserGroup">BO_vUserGroup</see>.
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
		BO_vUserGroup 
#else
		BO0_vUserGroup 
#endif
		: BO__base {
		#region public BO_vUserGroup(...);
#if NET20
		public BO_vUserGroup
#else
		internal BO0_vUserGroup
#endif
		() {}

		///
#if NET20
		~BO_vUserGroup
#else
		~BO0_vUserGroup
#endif
		() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_vUserGroup mainaggregate;

		///
		protected DO_vUserGroup mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_vUserGroup();
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
		/// vUserGroup's IDUser.
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
		#region public string Login { get; set; }
		/// <summary>
		/// vUserGroup's Login.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string Login {
			get { return mainAggregate.Login; }
			set { mainAggregate.Login = value; }
		}
		#endregion
		#region public long IDGroup { get; set; }
		/// <summary>
		/// vUserGroup's IDGroup.
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
		#region public string Name { get; set; }
		/// <summary>
		/// vUserGroup's Name.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string Name {
			get { return mainAggregate.Name; }
			set { mainAggregate.Name = value; }
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		/// <summary>
		/// vUserGroup's Relationdate.
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
		#endregion
	}
}