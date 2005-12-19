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
%>CREATE OR REPLACE FUNCTION "fnc0_<%=aux_table.Name%>__ConstraintExist"(<%
	for (int f = 0; f < aux_table.Fields.Count; f++) {
		aux_field = aux_table.Fields[f];
	%>"<%=aux_field.Name%>_" <%=aux_field.DBType_inDB_name%><%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
	}
%>)
RETURNS boolean
AS '
	DECLARE
		-- nothing to declare!
	BEGIN<%
		for (int s = 0; s < aux_table.Searches.Count; s++) {
			if (aux_table.Searches[s].isExplicitUniqueIndex) {%>
		IF EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_<%=aux_table.Name%>_isObject_<%=aux_table.Searches[s].Name%>"(<%
			for (int p = 0; p < aux_table.Searches[s].SearchParameters.Count; p++) {%>
				$<%=aux_table.Fields.Search(aux_table.Searches[s].SearchParameters[p].FieldName) + 1%><%=(p != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
			)
			WHERE NOT (<%
				for (int f = 0; f < aux_table.Fields_onlyPK.Count; f++) {
					aux_field = aux_table.Fields_onlyPK[f];%>
				("<%=aux_field.Name%>" = $<%=aux_table.Fields.Search(aux_field.Name) + 1%>)<%=(f != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
				}%>
			)
		) THEN
			RETURN true;
		END IF;<%
			}
		}%>

		RETURN false;
	END;
'
LANGUAGE 'plpgsql' STABLE;<%
//-----------------------------------------------------------------------------------------
%>