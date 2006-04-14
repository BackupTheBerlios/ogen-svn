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
string arg_UpdateName = System.Web.HttpUtility.UrlDecode(Request.QueryString["UpdateName"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);
cDBMetadata_Table aux_table = aux_metadata.Tables[arg_TableName];
cDBMetadata_Update aux_update = aux_table.Updates[arg_UpdateName];
int aux_table_hasidentitykey = aux_table.hasIdentityKey();
bool aux_table_searches_hasexplicituniqueindex = aux_table.Searches.hasExplicitUniqueIndex();

cDBMetadata_Table_Field aux_field;
string aux_string;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE [dbo].[sp0_<%=aux_table.Name%>_updObject_<%=aux_update.Name%>]<%
for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
	aux_field = aux_table.Fields_onlyPK[k];%>
	@<%=aux_field.Name%>_ <%=aux_field.DBType_inDB_name%><%=(aux_field.isText) ? " (" + aux_field.Size + ")" : ""%>, <%
}
for (int f = 0; f < aux_update.UpdateParameters.Count; f++) {
	aux_field = aux_update.UpdateParameters[f].Field;%>
	@<%=aux_field.Name%>_update_ <%=aux_field.DBType_inDB_name%><%=(aux_field.isText) ? " (" + aux_field.Size + ")" : ""%><%=(f != aux_update.UpdateParameters.Count - 1) ? ", " : ""%><%
}
if (aux_table_searches_hasexplicituniqueindex) {%>, 
	@ConstraintExist_ Bit OUT<%
}%>
AS<%
if (aux_table_searches_hasexplicituniqueindex) {%>
	SET @ConstraintExist_ = [dbo].[fnc0_<%=aux_table.Name%>__ConstraintExist](<%
	for (int f = 0; f < aux_table.Fields.Count; f++) {
		aux_field = aux_table.Fields[f];

		if (aux_field.isPK) {
			aux_string = "@" + aux_field.Name + "_";
		} else {
			aux_string = "NULL";
			for (int uf = 0; uf < aux_update.UpdateParameters.Count; uf++) {
				if (aux_field.Name == aux_update.UpdateParameters[uf].Field.Name) {
					aux_string = "@" + aux_field.Name + "_update_";
				}
			}
		}%><%=""%>
		<%=aux_string%><%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
	}%>
	)

	IF (@ConstraintExist_ = 0) BEGIN<%
}%>
		UPDATE [<%=aux_table.Name%>]
		SET<%
		for (int f = 0; f < aux_update.UpdateParameters.Count; f++) {
			aux_field = aux_update.UpdateParameters[f].Field;%>
			[<%=aux_field.Name%>] = @<%=aux_field.Name%>_update_<%=(f != aux_update.UpdateParameters.Count - 1) ? ", " : ""%><%
		}%>
		WHERE<%
		for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
			aux_field = aux_table.Fields_onlyPK[k];%>
			([<%=aux_field.Name%>] = @<%=aux_field.Name%>_)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
		}
if (aux_table_searches_hasexplicituniqueindex) {%>
	END<%
}
//-----------------------------------------------------------------------------------------
%>