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
using System.Collections;
using System.Reflection;
using OGen.lib.collections;

namespace OGen.Doc.lib.metadata {
	public class CodeSample : cClaSSe {
		public CodeSample(
			CodeSamples aggregateloopback_ref_in, 
			string idCodeSample_in
		) : base (
			aggregateloopback_ref_in
		) {
			//#region ClaSSe...
			idcodesample_ = idCodeSample_in;
			code_ = string.Empty;
			//#endregion
		}

		#region Implementing - iClaSSe...
		#region public override object Property_new(string name_in);
		public override object Property_new(string name_in) {
			switch (name_in) {
				default:
					throw new Exception(string.Format(
						"invalid Name: {0}", 
						name_in
					));
			}
		}
		#endregion
		#region public PropertyInfo[] Properties { get; }
		private static PropertyInfo[] properties__ = null;
		public override PropertyInfo[] Properties {
			get {
				if (properties__ == null) {
					InitializeStaticFields(
						ref properties__, 
						ref attributes__
					);
				}
				return properties__;
			}
		}
		#endregion
		#region public ClaSSPropertyAttribute[] Attributes { get; }
		private static ClaSSPropertyAttribute[] attributes__ = null;
		public override ClaSSPropertyAttribute[] Attributes {
			get {
				if (attributes__ == null) {
					InitializeStaticFields(
						ref properties__, 
						ref attributes__
					);
				}
				return attributes__;
			}
		}
		#endregion
		#endregion

		#region public Properties - ClaSSe...
		#region public string IDCodeSample { get; set; }
		private string idcodesample_;

		[ClaSSPropertyAttribute("idCodeSample", ClaSSPropertyAttribute.eType.standard, true)]
		public string IDCodeSample {
			get { return idcodesample_; }
			set { idcodesample_ = value; }
		}
		#endregion
		#region public string Code { get; set; }
		private string code_;

		[ClaSSPropertyAttribute("codeSample", ClaSSPropertyAttribute.eType.standard, true)]
		public string Code {
			get { return code_; }
			set { code_ = value; }
		}
		#endregion
		#endregion
		#region public Properties...
		#region public CodeSamples Parent_ref { get; }
		public CodeSamples Parent_ref {
			get {
				return (CodeSamples)base.AggregateLoopback_ref;
			}
		}
		#endregion
		#endregion
	}
}