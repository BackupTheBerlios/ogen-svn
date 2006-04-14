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
	/// Group BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_Group">DO_Group</see> for the Business Layer.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_Group">BO_Group</see>.
	/// </note>
	/// </summary>
	public abstract class BO0_Group : BO__base {
		#region internal BO0_Group(...);
		internal BO0_Group() {}

		///
		~BO0_Group() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_Group mainaggregate;

		///
		protected DO_Group mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_Group();
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
		#region public virtual long IDGroup { get; set; }
		/// <summary>
		/// Group's IDGroup.
		/// </summary>
		public virtual long IDGroup {
			get { return mainAggregate.IDGroup; }
			set { mainAggregate.IDGroup = value; }
		}
		#endregion
		#region public virtual string Name { get; set; }
		/// <summary>
		/// Group's Name.
		/// </summary>
		public virtual string Name {
			get { return mainAggregate.Name; }
			set { mainAggregate.Name = value; }
		}
		#endregion
		#endregion
	}
}