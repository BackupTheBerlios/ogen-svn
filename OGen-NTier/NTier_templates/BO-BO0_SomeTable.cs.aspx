<%/*

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

*/%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
cDBMetadata _aux_metadata = new cDBMetadata();
_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
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

using OGen.NTier.lib.datalayer;
using OGen.NTier.lib.businesslayer;

using <%=_aux_metadata.Namespace%>.lib.datalayer;

namespace <%=_aux_metadata.Namespace%>.lib.businesslayer {
	/// <summary>
	/// <%=_aux_table.Name%> BusinessObject which provides access to <see cref="<%=_aux_metadata.Namespace%>.lib.datalayer.DO_<%=_aux_table.Name%>">DO_<%=_aux_table.Name%></see> for the Business Layer.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="BO_<%=_aux_table.Name%>">BO_<%=_aux_table.Name%></see>.
	/// </note>
	/// </summary>
	public abstract class BO0_<%=_aux_table.Name%> : BO__base<%=(isListItem) ? ", iListItem" : ""%> {
		#region internal BO0_<%=_aux_table.Name%>(...);
		internal BO0_<%=_aux_table.Name%>() {}

		///
		~BO0_<%=_aux_table.Name%>() {
			if (mainaggregate != null) {
				mainaggregate.Dispose(); mainaggregate = null;
			}
		}
		#endregion

		#region private Properties...
		private DO_<%=_aux_table.Name%> mainaggregate;

		///
		protected DO_<%=_aux_table.Name%> mainAggregate {
			get {
				if (mainaggregate == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					mainaggregate = new DO_<%=_aux_table.Name%>();
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
		#region public Properties...<%
		if (isListItem) { %>
		#region public virtual string ListItemValue { get; set; }
		/// <summary>
		/// List Item Value.
		/// </summary>
		public virtual string ListItemValue {
			get { return <%=_aux_table.ListItemValue.Name%><%=(_aux_table.ListItemValue.DBType_generic.FWType != "string") ? ".ToString()" : ""%>; }
		}
		#endregion
		#region public virtual string ListItemText { get; }
		/// <summary>
		/// List Item Text.
		/// </summary>
		public virtual string ListItemText {
			get { return <%=_aux_table.ListItemText.Name%><%=(_aux_table.ListItemText.DBType_generic.FWType != "string") ? ".ToString()" : ""%>; }
		}
		#endregion<%
		}
		for (int f = 0; f < _aux_table.Fields.Count; f++) {
			_aux_field = _aux_table.Fields[f];

            if (_aux_field.isNullable && !_aux_table.isVirtualTable) {%>
        #region public virtual bool <%=_aux_field.Name%>_isNull { get; set; }
		public virtual bool <%=_aux_field.Name%>_isNull {
			get { return mainAggregate.<%=_aux_field.Name%>_isNull; }
			set { mainAggregate.<%=_aux_field.Name%>_isNull = value; }
		}
        #endregion<%
	        }%>
		#region public virtual <%=_aux_field.DBType_generic.FWType%> <%=_aux_field.Name%> { get; set; }
		/// <summary>
		/// <%=_aux_table.Name%>'s <%=_aux_field.Name%>.
		/// </summary>
		public virtual <%=_aux_field.DBType_generic.FWType%> <%=_aux_field.Name%> {
			get { return mainAggregate.<%=_aux_field.Name%>; }
			set { mainAggregate.<%=_aux_field.Name%> = value; }
		}
		#endregion<%
		}%>
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>