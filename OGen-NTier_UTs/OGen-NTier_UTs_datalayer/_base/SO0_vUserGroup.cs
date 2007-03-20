#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.NTier.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer {
	/// <summary>
	/// vUserGroup SerializableObject which provides fields access at vUserGroup view at Database.
	/// </summary>
	public class SO0_vUserGroup {
		#region public SO0_vUserGroup();
		public SO0_vUserGroup(
		) : this (
			0L, 
			string.Empty, 
			0L, 
			string.Empty, 
			new DateTime(1900, 1, 1)
		) {
		}
		public SO0_vUserGroup(
			long IDUser_in, 
			string Login_in, 
			long IDGroup_in, 
			string Name_in, 
			DateTime Relationdate_in
		) {
			haschanges_ = false;
			//---
			iduser_ = IDUser_in;
			login_ = Login_in;
			idgroup_ = IDGroup_in;
			name_ = Name_in;
			relationdate_ = Relationdate_in;
		}
		#endregion

		#region Properties...
		#region public bool hasChanges { get; }
		internal bool haschanges_;

		/// <summary>
		/// Indicates if changes have been made to FO0_vUserGroup properties since last time getObject method was run.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---
		#region public long IDUser { get; set; }
		internal long iduser_;// = 0L;
		
		/// <summary>
		/// vUserGroup's IDUser.
		/// </summary>
		[XmlElement("IDUser")]
		[DOPropertyAttribute(
			"IDUser", 
			"", 
			"", 
			true, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		long IDUser {
			get {
				return iduser_;
			}
			set {
				if (
					(!value.Equals(iduser_))
				) {
					iduser_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Login_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at vUserGroup's Login.
		/// </summary>
		[XmlIgnore]
		public 
#if !NET20
			virtual 
#endif
		bool Login_isNull {
			get { return (login_ == null); }
			set {
				//if (value) login_ = null;

				if ((value) && (login_ != null)) {
					login_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public string Login { get; set; }
		internal object login_;// = string.Empty;
		
		/// <summary>
		/// vUserGroup's Login.
		/// </summary>
		[XmlElement("Login")]
		[DOPropertyAttribute(
			"Login", 
			"", 
			"", 
			false, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			50, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		string Login {
			get {
				return (string)((login_ == null) ? string.Empty : login_);
			}
			set {
				if (
					(value != null)
					&&
					(!value.Equals(login_))
				) {
					login_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public long IDGroup { get; set; }
		internal long idgroup_;// = 0L;
		
		/// <summary>
		/// vUserGroup's IDGroup.
		/// </summary>
		[XmlElement("IDGroup")]
		[DOPropertyAttribute(
			"IDGroup", 
			"", 
			"", 
			true, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		long IDGroup {
			get {
				return idgroup_;
			}
			set {
				if (
					(!value.Equals(idgroup_))
				) {
					idgroup_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Name_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at vUserGroup's Name.
		/// </summary>
		[XmlIgnore]
		public 
#if !NET20
			virtual 
#endif
		bool Name_isNull {
			get { return (name_ == null); }
			set {
				//if (value) name_ = null;

				if ((value) && (name_ != null)) {
					name_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public string Name { get; set; }
		internal object name_;// = string.Empty;
		
		/// <summary>
		/// vUserGroup's Name.
		/// </summary>
		[XmlElement("Name")]
		[DOPropertyAttribute(
			"Name", 
			"", 
			"", 
			false, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			50, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		string Name {
			get {
				return (string)((name_ == null) ? string.Empty : name_);
			}
			set {
				if (
					(value != null)
					&&
					(!value.Equals(name_))
				) {
					name_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public bool Relationdate_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at vUserGroup's Relationdate.
		/// </summary>
		[XmlIgnore]
		public 
#if !NET20
			virtual 
#endif
		bool Relationdate_isNull {
			get { return (relationdate_ == null); }
			set {
				//if (value) relationdate_ = null;

				if ((value) && (relationdate_ != null)) {
					relationdate_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public DateTime Relationdate { get; set; }
		internal object relationdate_;// = new DateTime(1900, 1, 1);
		
		/// <summary>
		/// vUserGroup's Relationdate.
		/// </summary>
		[XmlElement("Relationdate")]
		[DOPropertyAttribute(
			"Relationdate", 
			"", 
			"", 
			false, 
			false, 
			true, 
			"", 
			"", 
			"", 
			false, 
			false, 
			false, 
			false, 
			true, 
			false, 
			false, 
			false, 
			false, 
			false, 
			0, 
			""
		)]
		public 
#if !NET20
			virtual 
#endif
		DateTime Relationdate {
			get {
				return (DateTime)((relationdate_ == null) ? new DateTime(1900, 1, 1) : relationdate_);
			}
			set {
				if (
					(!value.Equals(relationdate_))
				) {
					relationdate_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#endregion
	}
}