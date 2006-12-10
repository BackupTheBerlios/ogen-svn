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
using System.Xml.Serialization;

using OGen.NTier.lib.datalayer;
using OGen.NTier.lib.businesslayer;

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.businesslayer {
	/// <summary>
	/// Config BusinessObject which provides access to <see cref="OGen.NTier.UTs.lib.datalayer.DO_Config">DO_Config</see> for the Business Layer.
	/// </summary>
	[DOClassAttribute("Config", "", "", "", false, true)]
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
#if !NET20
		internal BO0_Config() {}
#endif

		///
#if NET20
		~BO_Config
#else
		~BO0_Config
#endif
		() {
			if (mainaggregate__ != null) {
				mainaggregate__.Dispose(); mainaggregate__ = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_Config mainaggregate__;

		///
#if NET20
		private 
#else
		protected 
#endif
		DO_Config mainAggregate {
			get {
				if (mainaggregate__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate__ = new DO_Config();
				}
				return mainaggregate__;
			}
		}
		#endregion
		#region public Properties...
		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public override iRecordObject Record {
			get { return mainAggregate.Record; }
		}

		public SO0_Config Fields {
			get { return mainAggregate.Fields; }
		}
		#region public string Name { get; set; }
		/// <summary>
		/// Config's Name.
		/// </summary>
		[DOPropertyAttribute(
			"Name", 
			"", 
			"", 
			true, 
			false, 
			false, 
			"", 
			"", 
			"", 
			true, 
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
			get { return mainAggregate.Fields.Name; }
			set { mainAggregate.Fields.Name = value; }
		}
		#endregion
		#region public string Config { get; set; }
		/// <summary>
		/// Config's Config.
		/// </summary>
		[DOPropertyAttribute(
			"Config", 
			"", 
			"", 
			false, 
			false, 
			false, 
			"", 
			"", 
			"", 
			false, 
			true, 
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
		string Config {
			get { return mainAggregate.Fields.Config; }
			set { mainAggregate.Fields.Config = value; }
		}
		#endregion
		#region public int Type { get; set; }
		/// <summary>
		/// Config's Type.
		/// </summary>
		[DOPropertyAttribute(
			"Type", 
			"", 
			"", 
			false, 
			false, 
			false, 
			"", 
			"", 
			"", 
			false, 
			false, 
			true, 
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
		int Type {
			get { return mainAggregate.Fields.Type; }
			set { mainAggregate.Fields.Type = value; }
		}
		#endregion
		#region public bool Description_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at Config's Description.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		bool Description_isNull {
			get { return mainAggregate.Fields.Description_isNull; }
			set { mainAggregate.Fields.Description_isNull = value; }
		}
		#endregion
		#region public string Description { get; set; }
		/// <summary>
		/// Config's Description.
		/// </summary>
		[DOPropertyAttribute(
			"Description", 
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
		string Description {
			get { return mainAggregate.Fields.Description; }
			set { mainAggregate.Fields.Description = value; }
		}
		#endregion
		#endregion

		#region public Methods...
		#region public SC0_Config Serialize();
		public SO0_Config Serialize() {
			return mainAggregate.Serialize();
		}
		#endregion
		#region public void Deserialize(SO0_Config Config_in);
		public void Deserialize(SO0_Config Config_in) {
			mainAggregate.Fields = Config_in;
		}
		#endregion
		#region public SC0_Config Record_Serialize();
		public SC0_Config Record_Serialize() {
			return mainAggregate.Record.Serialize();
		}
		#endregion
		#endregion
	}
}