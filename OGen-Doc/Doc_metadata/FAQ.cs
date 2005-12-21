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
	public class FAQ : cClaSSe {
		public FAQ(
			FAQSubject aggregateloopback_ref_in
		) : base (
			aggregateloopback_ref_in
		) {
			//#region ClaSSe...
			idfaq_ = string.Empty;
			question_ = string.Empty;
			//---
			faqanswers_ = new ArrayList();
			//#endregion
		}

		#region Implementing - iClaSSe...
		#region public override object Property_new(string name_in);
		public override object Property_new(string name_in) {
			switch (name_in) {
				case "answer":
					return new FAQAnswer(
						this
						//, string.Empty
					);
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
		#region public string IDFAQ { get; set; }
		private string idfaq_;

		[ClaSSPropertyAttribute("idFAQ", ClaSSPropertyAttribute.eType.standard, true)]
		public string IDFAQ {
			get { return idfaq_; }
			set { idfaq_ = value; }
		}
		#endregion
		#region public string Question { get; set; }
		private string question_;

		[ClaSSPropertyAttribute("question", ClaSSPropertyAttribute.eType.standard, true)]
		public string Question {
			get { return question_; }
			set { question_ = value; }
		}
		#endregion
		//---
		#region private ArrayList faqanswers_ { get; set; }
		private ArrayList faqanswers_;

		[ClaSSPropertyAttribute("answer", ClaSSPropertyAttribute.eType.aggregate_collection, true)]
		private ArrayList faqanswers__reflection {
			get { return faqanswers_; }
			set { faqanswers_ = value; }
		}
		#endregion
		#endregion
		#region public Properties...
		#region public FAQSubject Parent_ref { get; }
		public FAQSubject Parent_ref {
			get {
				return (FAQSubject)base.AggregateLoopback_ref;
			}
		}
		#endregion
		//---
		#region public int Count { get; }
		public int Count {
			get { return faqanswers_.Count; }
		}
		#endregion
		#region public FAQAnswer this[...] { get; set; }
		public FAQAnswer this[int index_in] {
			get {
				return (FAQAnswer)faqanswers_[index_in];
			}
		}
		//public FAQAnswer this[string question_in] {
		//	get {
		//		int _ti = Search(question_in);
		//		return (_ti >= 0) ?
		//			(FAQAnswer)faqanswers_[_ti] :
		//			null;
		//	}
		//}
		#endregion
		#endregion

		#region public Methods...
		#region public void Clear(...);
		public void Clear() {
			faqanswers_.Clear();
		}
		#endregion
		#region public int Add(...)
		public int Add(/*string question_in, bool verifyExistenz_in*/) {
			int _ti;

			//if (verifyExistenz_in) {
			//	_ti = Search(question_in);
			//	if (_ti != -1)
			//		return _ti;
			//}

			_ti = faqanswers_.Add(
				new FAQAnswer(
					this
					//, question_in
				)
			);
			return _ti; // returns it's position
		}
		#endregion
		#region //public int Search(...)
		//public int Search(string question_in) {
		//	for (int t = 0; t < faqanswers_.Count; t++)
		//		if (((FAQAnswer)faqanswers_[t]).Question == question_in) // already exists!
		//			return t; // returns it's position
		//
		//	return -1;
		//}
		#endregion
		#endregion
	}
}