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
bool aux_table_searches_hasexplicituniqueindex = aux_table.Searches.hasExplicitUniqueIndex();

cDBMetadata_Table_Field aux_field;
string aux_field_name;
cDBMetadata_Update aux_update;
int firstKey = aux_table.firstKey();
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
using NUnit.Framework;

using <%=aux_metadata.Namespace%>.lib.businesslayer;

namespace <%=aux_metadata.Namespace%>.lib.businesslayer.UTs {
	public class UT0_<%=aux_table.Name%> { public UT0_<%=aux_table.Name%>() {}

		#region protected Properties...
		#endregion

//		[Test]
//		public void UT_SomeTest() {
//			//ToDos: here!
//		}
	}
}<%
//-----------------------------------------------------------------------------------------
%>