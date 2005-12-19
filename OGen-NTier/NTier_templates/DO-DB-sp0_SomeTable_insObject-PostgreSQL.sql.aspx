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
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE OR REPLACE FUNCTION "sp0_<%=aux_table.Name%>_insObject"(<%
	for (int f = 0; f < aux_table.Fields_noPK.Count; f++) {
		aux_field = aux_table.Fields_noPK[f];
		%>"<%=aux_field.Name%>_" <%=aux_field.DBType_inDB_name%>, <%
	}
%> "SelectIdentity_" boolean)
RETURNS <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%>
AS '
	/**********************************
	 *  returns                       *
	 *   -1: constraint exists        *
	 *    0: no need to get Identity  *
	 *   >0: Identity                 *
	 **********************************/

	DECLARE
		IdentityKey <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%> = CAST(0 AS <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%>);
	BEGIN<%
		if (aux_table_searches_hasexplicituniqueindex) {%>
		IF ("fnc0_<%=aux_table.Name%>__ConstraintExist"(
			CAST(0 AS <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%>), <%
			for (int f = 0; f < aux_table.Fields_noPK.Count; f++) {
				aux_field = aux_table.Fields_noPK[f];%>
			"<%=aux_field.Name%>_"<%=(f != aux_table.Fields_noPK.Count - 1) ? ", " : ""%><%
			}%>
		)) THEN
			IdentityKey := CAST(-1 AS <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%>);
		ELSE<%
		}%>
			INSERT INTO "<%=aux_table.Name%>" (<%
				for (int f = 0; f < aux_table.Fields_noPK.Count; f++) {
					aux_field = aux_table.Fields_noPK[f];%>
				"<%=aux_field.Name%>"<%=(f != aux_table.Fields_noPK.Count - 1) ? ", " : ""%><%
				}%>
			) VALUES (<%
				for (int f = 0; f < aux_table.Fields_noPK.Count; f++) {
					aux_field = aux_table.Fields_noPK[f];%>
				"<%=aux_field.Name%>_"<%=(f != aux_table.Fields_noPK.Count - 1) ? ", " : ""%><%
				}%>
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"<%=aux_table.Fields[aux_table_hasidentitykey].Name%>"
				INTO
					IdentityKey
				FROM "<%=aux_table.Name%>"
				ORDER BY "<%=aux_table.Fields[aux_table_hasidentitykey].Name%>" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS <%=aux_table.Fields[aux_table_hasidentitykey].DBType_inDB_name%>);
			END IF;<%
		if (aux_table_searches_hasexplicituniqueindex) {%>
		END IF;<%
		}%>

		RETURN IdentityKey AS "<%=aux_table.Fields[aux_table_hasidentitykey].Name%>_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;<%
//-----------------------------------------------------------------------------------------
%>