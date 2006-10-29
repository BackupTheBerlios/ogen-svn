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
	/// Config BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_Config">DO_Config</see> for the Business Layer.
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_Config">BO_Config</see>.
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
		BO_Config 
#else
		BO0_Config 
#endif
		: BO__base {
		#region public BO_Config(...);
#if NET20
		public BO_Config
#else
		internal BO0_Config
#endif
		() {}

		///
#if NET20
		~BO_Config
#else
		~BO0_Config
#endif
		() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_Config mainaggregate;

		///
		protected DO_Config mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_Config();
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
		#region public string Name { get; set; }
		/// <summary>
		/// Config's Name.
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
		#region public string Config { get; set; }
		/// <summary>
		/// Config's Config.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string Config {
			get { return mainAggregate.Config; }
			set { mainAggregate.Config = value; }
		}
		#endregion
		#region public int Type { get; set; }
		/// <summary>
		/// Config's Type.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			int Type {
			get { return mainAggregate.Type; }
			set { mainAggregate.Type = value; }
		}
		#endregion
		#region public bool Description_isNull { get; set; }
		public 
#if !NET20
			virtual 
#endif
			bool Description_isNull {
			get { return mainAggregate.Description_isNull; }
			set { mainAggregate.Description_isNull = value; }
		}
		#endregion
		#region public string Description { get; set; }
		/// <summary>
		/// Config's Description.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string Description {
			get { return mainAggregate.Description; }
			set { mainAggregate.Description = value; }
		}
		#endregion
		#endregion
	}
}