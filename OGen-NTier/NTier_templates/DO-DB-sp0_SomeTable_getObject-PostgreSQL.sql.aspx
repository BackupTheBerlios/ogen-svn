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
%>CREATE OR REPLACE FUNCTION "sp0_<%=aux_table.Name%>_getObject"(<%
	for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
		aux_field = aux_table.Fields_onlyPK[k];
	%>"<%=aux_field.Name%>_" <%=aux_field.DBType_inDB_name%><%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
	}%>)
RETURNS "<%=aux_table.Name%>"
AS '
	DECLARE
		_Output "<%=aux_table.Name%>"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
			"<%=aux_field.Name%>", <%
			}%>
			true
		INTO<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
			_Output."<%=aux_field.Name%>", <%
			}%>
			_Exists
		FROM "<%=aux_table.Name%>"
		WHERE<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%>
			("<%=aux_field.Name%>" = "<%=aux_field.Name%>_")<%=(k != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
			}%>;

		IF NOT (_Exists) THEN<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
			_Output."<%=aux_field.Name%>" := NULL;<%
			}%>
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;<%
//-----------------------------------------------------------------------------------------
%>