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
	/// User BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_User">DO_User</see> for the Business Layer.
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_User">BO_User</see>.
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
		BO_User 
#else
		BO0_User 
#endif
		: BO__base {
		#region public BO_User(...);
#if NET20
		public BO_User
#else
		internal BO0_User
#endif
		() {}

		///
#if NET20
		~BO_User
#else
		~BO0_User
#endif
		() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_User mainaggregate;

		///
		protected DO_User mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_User();
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
		/// User's IDUser.
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
		/// User's Login.
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
		#region public string Password { get; set; }
		/// <summary>
		/// User's Password.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string Password {
			get { return mainAggregate.Password; }
			set { mainAggregate.Password = value; }
		}
		#endregion
		#region public bool SomeNullValue_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool SomeNullValue_isNull {
			get { return mainAggregate.SomeNullValue_isNull; }
			set { mainAggregate.SomeNullValue_isNull = value; }
		}
		#endregion
		#region public int SomeNullValue { get; set; }
		/// <summary>
		/// User's SomeNullValue.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			int SomeNullValue {
			get { return mainAggregate.SomeNullValue; }
			set { mainAggregate.SomeNullValue = value; }
		}
		#endregion
		#endregion
	}
}