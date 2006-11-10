<%--

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

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
cDBMetadata _aux_metadata;
if (cDBMetadata.Metacache.Contains(_arg_MetadataFilepath)) {
	_aux_metadata = (cDBMetadata)cDBMetadata.Metacache[_arg_MetadataFilepath];
} else {
	_aux_metadata = new cDBMetadata();
	_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
	cDBMetadata.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
}

cDBMetadata_Table _aux_table = _aux_metadata.Tables[_arg_TableName];
bool isListItem = _aux_table.isListItem();

cDBMetadata_Table_Field _aux_field;
#endregion
//-----------------------------------------------------------------------------------------
if ((_aux_metadata.CopyrightText != string.Empty) && (_aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%=_aux_metadata.CopyrightText%>
/*

<%=_aux_metadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;
using System.Xml.Serialization;

using OGen.NTier.lib.datalayer;
using OGen.NTier.lib.businesslayer;

using <%=_aux_metadata.Namespace%>.lib.datalayer;

namespace <%=_aux_metadata.Namespace%>.lib.businesslayer {
	/// <summary>
	/// <%=_aux_table.Name%> BusinessObject which provides access to <see cref="<%=_aux_metadata.Namespace%>.lib.datalayer.DO_<%=_aux_table.Name%>">DO_<%=_aux_table.Name%></see> for the Business Layer.<%--
#if !NET20
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_<%=_aux_table.Name%>">BO_<%=_aux_table.Name%></see>.
	/// </note>
#endif--%>
	/// </summary>
	[DOClassAttribute("<%=_aux_table.Name%>", "<%=_aux_table.FriendlyName%>", "<%=_aux_table.DBDescription%>", "<%=_aux_table.ExtendedDescription%>", <%=_aux_table.isVirtualTable.ToString().ToLower()%>, <%=_aux_table.isConfig.ToString().ToLower()%>)]
	public 
#if NET20
		partial 
#else
		abstract 
#endif
		class 
#if NET20
		BO_<%=_aux_table.Name%> 
#else
		BO0_<%=_aux_table.Name%> 
#endif
		: BO__base<%=(isListItem) ? ", iListItem" : ""%> {
		#region public BO_<%=_aux_table.Name%>(...);
#if NET20
		///
		public BO_<%=_aux_table.Name%>
#else
		internal BO0_<%=_aux_table.Name%>
#endif
		() {}

		///
#if NET20
		~BO_<%=_aux_table.Name%>
#else
		~BO0_<%=_aux_table.Name%>
#endif
		() {
			if (mainaggregate__ != null) {
				mainaggregate__.Dispose(); mainaggregate__ = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_<%=_aux_table.Name%> mainaggregate__;

		///
#if NET20
		private 
#else
		protected 
#endif
		DO_<%=_aux_table.Name%> mainAggregate {
			get {
				if (mainaggregate__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate__ = new DO_<%=_aux_table.Name%>();
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

		public SO0_<%=_aux_table.Name%> Fields {
			get { return mainAggregate.Fields; }
		}<%
		if (isListItem) { %>
		#region public string ListItemValue { get; set; }
		/// <summary>
		/// List Item Value.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string ListItemValue {
			get { return <%=_aux_table.ListItemValue.Name%><%=(_aux_table.ListItemValue.DBType_generic.FWType != "string") ? ".ToString()" : ""%>; }
		}
		#endregion
		#region public string ListItemText { get; }
		/// <summary>
		/// List Item Text.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
			string ListItemText {
			get { return <%=_aux_table.ListItemText.Name%><%=(_aux_table.ListItemText.DBType_generic.FWType != "string") ? ".ToString()" : ""%>; }
		}
		#endregion
		//---<%
		}
		for (int f = 0; f < _aux_table.Fields.Count; f++) {
			_aux_field = _aux_table.Fields[f];

			if (_aux_field.isNullable && !_aux_field.isPK) {%>
		#region public bool <%=_aux_field.Name%>_isNull { get; set; }
		/// <summary>
		/// Allows assignement of null and check if null at <%=_aux_table.Name%>'s <%=_aux_field.Name%>.
		/// </summary>
		public 
#if !NET20
			virtual 
#endif
		bool <%=_aux_field.Name%>_isNull {
			get { return mainAggregate.Fields.<%=_aux_field.Name%>_isNull; }
			set { mainAggregate.Fields.<%=_aux_field.Name%>_isNull = value; }
		}
		#endregion<%
			}%>
		#region public <%=_aux_field.DBType_generic.FWType%> <%=_aux_field.Name%> { get; set; }
		/// <summary>
		/// <%=_aux_table.Name%>'s <%=_aux_field.Name%>.
		/// </summary>
		[DOPropertyAttribute("<%=_aux_field.Name%>", "<%=_aux_table.FriendlyName%>", "<%=_aux_table.DBDescription%>", "<%=_aux_table.ExtendedDescription%>", <%=_aux_field.isPK.ToString().ToLower()%>, <%=_aux_field.isIdentity.ToString().ToLower()%>, <%=_aux_field.isNullable.ToString().ToLower()%>, <%=(_aux_field.DefaultValue == string.Empty) ? "\"\"" : _aux_field.DefaultValue%>, "<%=_aux_field.FK_TableName%>", "<%=_aux_field.FK_FieldName%>", <%=_aux_field.isConfig_Name.ToString().ToLower()%>, <%=_aux_field.isConfig_Config.ToString().ToLower()%>, <%=_aux_field.isConfig_Datatype.ToString().ToLower()%>, <%=_aux_field.isBool.ToString().ToLower()%>, <%=_aux_field.isDateTime.ToString().ToLower()%>, <%=_aux_field.isInt.ToString().ToLower()%>, <%=_aux_field.isDecimal.ToString().ToLower()%>, <%=_aux_field.isText.ToString().ToLower()%>)]
		public 
#if !NET20
			virtual 
#endif
		<%=_aux_field.DBType_generic.FWType%> <%=_aux_field.Name%> {
			get { return mainAggregate.Fields.<%=_aux_field.Name%>; }
			set { mainAggregate.Fields.<%=_aux_field.Name%> = value; }
		}
		#endregion<%
		}%>
		#endregion

		#region public Methods...
		#region public SC0_<%=_aux_table.Name%> Serialize();
		public SO0_<%=_aux_table.Name%> Serialize() {
			return mainAggregate.Serialize();
		}
		#endregion
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>