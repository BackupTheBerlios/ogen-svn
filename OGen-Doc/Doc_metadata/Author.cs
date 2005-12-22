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
	public class Author : cClaSSe {
		public Author(
			Authors aggregateloopback_ref_in, 
			string idauthor_in
		) : base (
			aggregateloopback_ref_in
		) {
			//#region ClaSSe...
			idauthor_ = idauthor_in;
			name_ = string.Empty;
			copyrighttext_ = string.Empty;
			feedbackemailaddress_ = string.Empty;
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
		#region public string IDAuthor { get; set; }
		private string idauthor_;

		[ClaSSPropertyAttribute("idAuthor", ClaSSPropertyAttribute.eType.standard, true)]
		public string IDAuthor {
			get { return idauthor_; }
			set { idauthor_ = value; }
		}
		#endregion
		#region public string Name { get; set; }
		private string name_;

		[ClaSSPropertyAttribute("name", ClaSSPropertyAttribute.eType.standard, true)]
		public string Name {
			get { return name_; }
			set { name_ = value; }
		}
		#endregion
		#region public string CopyrightText { get; set; }
		private string copyrighttext_;

		[ClaSSPropertyAttribute("copyrightText", ClaSSPropertyAttribute.eType.standard, true)]
		public string CopyrightText {
			get { return copyrighttext_; }
			set { copyrighttext_ = value; }
		}
		#endregion
		#region public string FeedbackEmailAddress { get; set; }
		private string feedbackemailaddress_;

		[ClaSSPropertyAttribute("feedbackEmailAddress", ClaSSPropertyAttribute.eType.standard, true)]
		public string FeedbackEmailAddress {
			get { return feedbackemailaddress_; }
			set { feedbackemailaddress_ = value; }
		}
		#endregion
		#endregion
		#region public Properties...
		#region public Authors Parent_ref { get; }
		public Authors Parent_ref {
			get {
				return (Authors)base.AggregateLoopback_ref;
			}
		}
		#endregion
		#endregion
	}
}
