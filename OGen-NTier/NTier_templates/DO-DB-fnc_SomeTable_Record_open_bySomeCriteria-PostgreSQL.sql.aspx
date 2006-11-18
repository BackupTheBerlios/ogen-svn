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
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
string _arg_SearchName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SearchName"]);
#endregion

#region varaux...
eDBServerTypes _aux_dbservertype = eDBServerTypes.PostgreSQL;

cDBMetadata _aux_metadata;
if (cDBMetadata.Metacache.Contains(_arg_MetadataFilepath)) {
	_aux_metadata = (cDBMetadata)cDBMetadata.Metacache[_arg_MetadataFilepath];
} else {
	_aux_metadata = new cDBMetadata();
	_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
	cDBMetadata.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
}
cDBMetadata_Table _aux_table = _aux_metadata.Tables[_arg_TableName];
cDBMetadata_Table_Search _aux_search = _aux_table.Searches[_arg_SearchName];
int _aux_table_hasidentitykey = _aux_table.hasIdentityKey();

cDBMetadata_Table_Field _aux_field;
string _aux_field_name;
bool isFirst;
bool makeItAComment = false;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE OR REPLACE FUNCTION "fnc_<%=_aux_table.Name%>_Record_open_<%=_aux_search.Name%>"(<%
	for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
		if (_aux_search.SearchParameters[f].TableName != _aux_table.Name)
			makeItAComment = true;
		_aux_field = _aux_search.SearchParameters[f].Field;
		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%>
	"<%=_aux_field_name%>_search_" <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(f != _aux_search.SearchParameters.Count - 1) ? ", " : ""%><%
	}%>
)
RETURNS SETOF "v0_<%=_aux_table.Name%>__onlyKeys"
AS '
	DECLARE
		_Output "v0_<%=_aux_table.Name%>__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT<%
				for (int k = 0; k < _aux_table.Fields_onlyPK.Count; k++) {
					_aux_field = _aux_table.Fields_onlyPK[k];%>
				"<%=_aux_field.Name%>"<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
				}%>
			FROM "<%=_aux_table.Name%>"<%=((makeItAComment) || (_aux_search.SearchParameters.Count == 0)) ? "/*" : ""%>
			WHERE<%
		for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
			_aux_field = _aux_search.SearchParameters[f].Field;
			_aux_field_name = _aux_search.SearchParameters[f].ParamName;
			if (_aux_field.isNullable && !_aux_table.isVirtualTable) {%>
				((
					("<%=_aux_field.Name%>_search_" IS NULL)
					AND
					("<%=_aux_field.Name%>" IS NULL)
				) OR (
					NOT ("<%=_aux_field.Name%>_search_" IS NULL)
					AND
					("<%=_aux_field.Name%>" <%=(_aux_field.isText) ? "LIKE ''%'' ||" : "="%> "<%=_aux_field.Name%>_search_"<%=(_aux_field.isText) ? " || ''%'' /*COLLATE " + _aux_field.DBCollationName + "*/" : ""%>)
				))<%=(f != _aux_search.SearchParameters.Count - 1) ? " AND" : ""%><%
			} else {%>
				("<%=_aux_field.Name%>" <%=(_aux_field.isText) ? "LIKE ''%'' ||" : "="%> "<%=_aux_field_name%>_search_"<%=(_aux_field.isText) ? " || ''%'' /*COLLATE " + _aux_field.DBCollationName + "*/" : ""%>)<%=(f != _aux_search.SearchParameters.Count - 1) ? " AND" : ""%><%
			}
		}%><%=((makeItAComment) || (_aux_search.SearchParameters.Count == 0)) ? "*/" : ""%>
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

<%
//-----------------------------------------------------------------------------------------
%>