#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
			Mode = eMode.Create_doNotReplace;
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
//#if PostgreSQL
			PostgreSQL_Function = 1,
			PostgreSQL_StoredProcedure = 2,
			PostgreSQL_View = 3, 
//#endif
			SQLServer_Function = 4, 
			SQLServer_StoredProcedure = 5, 
			SQLServer_View = 6,
//#if MySQL
			MySQL_Function = 7,
			MySQL_StoredProcedure = 8,
			MySQL_View = 9, 
//#endif

			invalid = 10
		}
		#endregion
		#region public enum eMode;
		public enum eMode {
			Create_doNotReplace = 0,
			Replace = 1, 
			Append = 2, 

			invalid = 3
		}
		#endregion
		#endregion

		#region Properties - ClaSS_noR...
		#region public string To { get; set; }
		public string To {
			get { return base.Property_standard["to"]; }
			set { base.Property_standard["to"] = value; }
		}
		#endregion

		#region public eType Type { get; set; }
		public eType Type {
			get { return OGen.lib.templates.utils.OutputType.Parse_NEW(base.Property_standard["type"]); }
			set { base.Property_standard["type"] = value.ToString(); }
		}
		#endregion
		#region public eMode Mode { get; set; }
		public eMode Mode {
			get { return OGen.lib.templates.utils.OutputMode.Parse_NEW(base.Property_standard["mode"]); }
			set { base.Property_standard["mode"] = value.ToString(); }
		}
		#endregion
		#endregion
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