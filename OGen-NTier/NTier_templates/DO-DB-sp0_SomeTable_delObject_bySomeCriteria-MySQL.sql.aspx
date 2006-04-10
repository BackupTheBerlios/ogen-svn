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
string arg_SearchName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SearchName"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);
cDBMetadata_Table aux_table = aux_metadata.Tables[arg_TableName];
cDBMetadata_Table_Search aux_search = aux_table.Searches[arg_SearchName];
int aux_table_hasidentitykey = aux_table.hasIdentityKey();

cDBMetadata_Table_Field aux_field;
string aux_field_name;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE `sp0_<%=aux_table.Name%>_delObject_<%=aux_search.Name%>`(<%
	for (int f = 0; f < aux_search.SearchParameters.Count; f++) {
		aux_field = aux_search.SearchParameters[f].Field;
		aux_field_name = aux_search.SearchParameters[f].ParamName;%>
	IN `<%=aux_field_name%>_search_` <%=aux_field.DBType_inDB_name%><%=(aux_field.isText) ? "(" + aux_field.Size + ")" : ""%>, <%
	}%>

	OUT `Exists_` BOOLEAN
)
	NOT DETERMINISTIC
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN<%
	for (int f = 0; f < aux_table.Fields_onlyPK.Count; f++) {
		aux_field = aux_table.Fields_onlyPK[f];%>
	DECLARE `_<%=aux_field.Name%>` <%=aux_field.DBType_inDB_name%><%=(aux_field.isText) ? "(" + aux_field.Size + ")" : ""%>;<%
	}%>

	SET `Exists_` = false;

	SELECT<%
		for (int f = 0; f < aux_table.Fields_onlyPK.Count; f++) {
			aux_field = aux_table.Fields_onlyPK[f];%>
		`<%=aux_field.Name%>` INTO `_<%=aux_field.Name%>`, <%
		}%>
		true INTO `Exists_`
	FROM `fnc_<%=aux_table.Name%>_isObject_<%=aux_search.Name%>`(<%
		for (int f = 0; f < aux_search.SearchParameters.Count; f++) {
			aux_field = aux_search.SearchParameters[f].Field;
			aux_field_name = aux_search.SearchParameters[f].ParamName;%>
		`<%=aux_field_name%>_search_`<%=(f != aux_search.SearchParameters.Count - 1) ? ", " : ""%><%
		}%>
	);

	IF (`Exists_`) THEN
		DELETE
		FROM `<%=aux_table.Name%>`
		WHERE<%
			for (int f = 0; f < aux_table.Fields_onlyPK.Count; f++) {
				aux_field = aux_table.Fields_onlyPK[f];%>
			(`<%=aux_field.Name%>` = `_<%=aux_field.Name%>`)<%=(f != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
			}%>;
	END IF;
END<%
//-----------------------------------------------------------------------------------------
%>