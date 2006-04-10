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
string arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);
cDBMetadata_Table aux_table = aux_metadata.Tables[arg_TableName];

cDBMetadata_Table_Field aux_field;
#endregion
//-----------------------------------------------------------------------------------------
if ((aux_metadata.CopyrightText != string.Empty) && (aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%=aux_metadata.CopyrightText%>
/*

<%=aux_metadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;

using <%=aux_metadata.Namespace%>.lib.datalayer;

namespace <%=aux_metadata.Namespace%>.lib.businesslayer {
	/// <summary>
	/// <%=aux_table.Name%> BusinessObject which provides access to <see cref="<%=aux_metadata.Namespace%>.lib.datalayer.DO_<%=aux_table.Name%>">DO_<%=aux_table.Name%></see> for the Business Layer.
	/// </summary>
	public sealed class BO_<%=aux_table.Name%> : BO0_<%=aux_table.Name%> {
		#region public BO_<%=aux_table.Name%>(...);
		///
		public BO_<%=aux_table.Name%>() {
		}
		#endregion

		#region private Properties...
		#endregion
		#region public Properties...
		#endregion

		#region private Methods...
		#endregion
		#region public Methods...
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>