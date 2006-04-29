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
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
string _arg_SearchName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SearchName"]);
#endregion

#region varaux...
eDBServerTypes _aux_dbservertype = eDBServerTypes.SQLServer;

cDBMetadata _aux_metadata = new cDBMetadata();
_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
int _aux_table_index = _aux_metadata.Tables.Search(_arg_TableName);
cDBMetadata_Table _aux_table = _aux_metadata.Tables[_aux_table_index];
cDBMetadata_Table_Search _aux_search = _aux_table.Searches[_arg_SearchName];
int _aux_table_hasidentitykey = _aux_table.hasIdentityKey();

cDBMetadata_Table_Field _aux_field;
string _aux_field_name;
bool isFirst;
bool makeItAComment = false;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE FUNCTION [dbo].[fnc_<%=_aux_table.Name%>_isObject_<%=_aux_search.Name%>](<%
for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
	if (_aux_search.SearchParameters[f].TableIndex() != _aux_table_index) makeItAComment = true;
	_aux_field = _aux_search.SearchParameters[f].Field;
	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%>
	@<%=_aux_field_name%>_search_ <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? " (" + _aux_field.DBs[_aux_dbservertype].Size + ")" : ""%><%=(f != _aux_search.SearchParameters.Count - 1) ? ", " : ""%><%
}%>
)
RETURNS @finalresult TABLE (<%
	for (int f = 0; f < _aux_table.Fields_onlyPK.Count; f++) {
		_aux_field = _aux_table.Fields_onlyPK[f];%>
	[<%=_aux_field.Name%>] <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? " (" + _aux_field.DBs[_aux_dbservertype].Size + ")" : ""%><%=(f != _aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
	}%>
)
AS
BEGIN
	INSERT INTO @finalresult
	SELECT<%
	for (int k = 0; k < _aux_table.Fields_onlyPK.Count; k++) {
		_aux_field = _aux_table.Fields_onlyPK[k];%>
		[<%=_aux_field.Name%>]<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
	}%>
	FROM [<%=_aux_table.Name%>]<%=(makeItAComment) ? "/*" : ""%>
	WHERE<%
	for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
		_aux_field = _aux_search.SearchParameters[f].Field;
		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%>
		([<%=_aux_field.Name%>] <%=(_aux_field.isText) ? "LIKE '%' +" : "="%> @<%=_aux_field_name%>_search_<%=(_aux_field.isText) ? " + '%' COLLATE SQL_Latin1_General_CP1_CI_AI" : ""%>)<%=(f != _aux_search.SearchParameters.Count - 1) ? " AND" : ""%><%
	}%><%=(makeItAComment) ? "*/" : ""%>

	RETURN
END<%
//-----------------------------------------------------------------------------------------
%>