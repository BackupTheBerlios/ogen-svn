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
	/// vUserDefaultGroup SerializableObject which provides fields access at vUserDefaultGroup view at Database.
	/// </summary>
	public class SO0_vUserDefaultGroup {
		#region public SO0_vUserDefaultGroup();
		public SO0_vUserDefaultGroup(
		) : this (
			0L, 
			string.Empty, 
			0L, 
			string.Empty, 
			new DateTime(1900, 1, 1)
		) {
		}
		public SO0_vUserDefaultGroup(
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
		/// Indicates if changes have been made to FO0_vUserDefaultGroup properties since last time getObject method was run.
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
		/// vUserDefaultGroup's IDUser.
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
		/// Allows assignement of null and check if null at vUserDefaultGroup's Login.
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
		/// vUserDefaultGroup's Login.
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
		#region public bool IDGroup_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at vUserDefaultGroup's IDGroup.
		/// </summary>
		[XmlIgnore]
		public 
#if !NET20
			virtual 
#endif
		bool IDGroup_isNull {
			get { return (idgroup_ == null); }
			set {
				//if (value) idgroup_ = null;

				if ((value) && (idgroup_ != null)) {
					idgroup_ = null;
					haschanges_ = true;
				}
			}
		}
		#endregion
		#region public long IDGroup { get; set; }
		internal object idgroup_;// = 0L;
		
		/// <summary>
		/// vUserDefaultGroup's IDGroup.
		/// </summary>
		[XmlElement("IDGroup")]
		[DOPropertyAttribute(
			"IDGroup", 
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
				return (long)((idgroup_ == null) ? 0L : idgroup_);
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
		/// Allows assignement of null and check if null at vUserDefaultGroup's Name.
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
		/// vUserDefaultGroup's Name.
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
		/// Allows assignement of null and check if null at vUserDefaultGroup's Relationdate.
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
		/// vUserDefaultGroup's Relationdate.
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