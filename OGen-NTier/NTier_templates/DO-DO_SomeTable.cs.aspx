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
int aux_table_hasidentitykey = aux_table.hasIdentityKey();

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
using System.Data;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace <%=aux_metadata.Namespace%>.lib.datalayer {
	/// <summary>
	/// <%=aux_table.Name%> DataObject which provides access to <%=aux_table.Name%> <%=(aux_table.isVirtualTable) ? "view" : "table"%> at Database.
	/// </summary>
	public sealed class DO_<%=aux_table.Name%> : DO0_<%=aux_table.Name%>, IDisposable {
		#region public DO_<%=aux_table.Name%>();
		///
		public DO_<%=aux_table.Name%>() : base() {
		}
		/// <summary>
		/// Making the use of Database Transactions possible on a sequence of operations across multiple DataObjects.
		/// </summary>
		/// <param name="connection_in">opened Database connection with an initiated Transaction</param>
		public DO_<%=aux_table.Name%>(cDBConnection connection_in) : base(connection_in) {
		}<%
		//~DO_< %=aux_table.Name% >() {
		//	cleanUp();
		//}
		//public new void Dispose() {
		//	System.GC.SuppressFinalize(this);
		//	cleanUp();
		//}
		//private void cleanUp() {
		//	base.Dispose();
		//}%>
		#endregion

		#region public Properties...
		#endregion
		#region public Methods...
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>