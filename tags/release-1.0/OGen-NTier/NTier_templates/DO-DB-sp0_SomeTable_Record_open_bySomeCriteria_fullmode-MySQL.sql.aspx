<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
string _arg_SearchName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SearchName"]);
#endregion

#region varaux...
DBServerTypes _aux_dbservertype = DBServerTypes.MySQL;

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
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE `sp0_<%=_aux_table.Name%>_Record_open_<%=_aux_search.Name%>_fullmode`(<%
	for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
		//_aux_field = er.Tables[_aux_search.SearchParameters[f].TableIndex].Fields[_aux_search.SearchParameters[f].FieldIndex];
		_aux_field = _aux_search.SearchParameters[f].Field;
		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%>
	IN `<%=_aux_field_name%>_search_` <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? "(" + _aux_field.Size + ")" : ""%><%=(f != _aux_search.SearchParameters.Count - 1) ? ", " : ""%><%
	}%>
)
	NOT DETERMINISTIC
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	CREATE TEMPORARY TABLE `#Table_temp` (<%
	for (int k = 0; k < _aux_table.Fields_onlyPK.Count; k++) {
		_aux_field = _aux_table.Fields_onlyPK[k];%>
		`<%=_aux_field.Name%>` <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? "(" + _aux_field.Size + ")" : ""%><%=(k != _aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
	}%>
	);
	
	INSERT INTO `#Table_temp` (<%
		for (int k = 0; k < _aux_table.Fields_onlyPK.Count; k++) {
			_aux_field = _aux_table.Fields_onlyPK[k];%>
		`<%=_aux_field.Name%>`<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
		}%>
	);
	CALL `sp_<%=_aux_table.Name%>_Record_open_<%=_aux_search.Name%>`(<%
	for (int f = 0; f < _aux_search.SearchParameters.Count; f++) {
		_aux_field = _aux_search.SearchParameters[f].Field;
		_aux_field_name = _aux_search.SearchParameters[f].ParamName;
		%>`<%=_aux_field_name%>_search_`<%=(f != _aux_search.SearchParameters.Count - 1) ? ", " : ""%><%
	}%>);

	SELECT<%
	for (int f = 0; f < _aux_table.Fields.Count; f++) {
		_aux_field = _aux_table.Fields[f];%>
		t1.`<%=_aux_field.Name%>`<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
	}%>
	FROM `<%=_aux_table.Name%>` t1
		INNER JOIN `#Table_temp` t2 ON (<%
		for (int k = 0; k < _aux_table.Fields_onlyPK.Count; k++) {
			_aux_field = _aux_table.Fields_onlyPK[k];%>
			(t2.`<%=_aux_field.Name%>` = t1.`<%=_aux_field.Name%>`)<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? "AND " : ""%><%
		}%>
		);

	-- CHANGE where CONDITION IN: `fnc_<%=_aux_table.Name%>_Record_open_<%=_aux_search.Name%>`
	-- NOT HERE!

	-- CHANGE order by IN: `sp_<%=_aux_table.Name%>_Record_open_<%=_aux_search.Name%>`
	-- NOT HERE!

	DROP TABLE `#Table_temp`;
END;

<%
//-----------------------------------------------------------------------------------------
%>