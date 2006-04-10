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

using OGen.lib.collections;

namespace OGen.lib.templates {
	public class cOutput : cClaSS_noR, iClaSS_noR {
		#region public cOutput(...);
		public cOutput(cOutputs parent_ref_in, string to_in) {
			parent_ref_ = parent_ref_in;

			//#region ClaSS_noR...
			To = to_in;
			Type = eType.invalid;
			Replace = false;
			//#endregion
		}
		#endregion

		#region Implementing - iClaSS_noR...
		public override object Property_new(string name_in) {
			switch (name_in) {
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

		#region enums...
		#region public enum eType;
		public enum eType {
			File = 0,
			PostgreSQL_Function = 1,
			PostgreSQL_StoredProcedure = 2,
			PostgreSQL_View = 3, 
			SQLServer_Function = 4, 
			SQLServer_StoredProcedure = 5, 
			SQLServer_View = 6,
			MySQL_Function = 7,
			MySQL_StoredProcedure = 8,
			MySQL_View = 9, 

			invalid = 10
		}
		#endregion
		#endregion

//		#region Properties - ClaSS_noR...
		#region public string To { get; set; }
		public string To {
			get { return base.Property_standard["to"]; }
			set { base.Property_standard["to"] = value; }
		}
		#endregion

//		#region public eType Type { get; set; }
		public eType Type {
			get { return OGen.lib.templates.utils.OutputType.Parse_NEW(base.Property_standard["type"]); }
			set { base.Property_standard["type"] = value.ToString(); }
		}
//		#endregion
		#region public bool Replace { get; set; }
		public bool Replace {
			get { return bool.Parse(base.Property_standard["replace"]); }
			set { base.Property_standard["replace"] = value.ToString(); }
		}
		#endregion

//		#endregion
		#region Properties...
		private cOutputs parent_ref_;
		#endregion

		#region Methods...
		#region public override string ToString();
		public override string ToString() {
			return To;
		}
		#endregion
		#endregion
	}
}