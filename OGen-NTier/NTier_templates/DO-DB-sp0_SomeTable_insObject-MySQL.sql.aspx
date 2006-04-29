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
#endregion

#region varaux...
eDBServerTypes _aux_dbservertype = eDBServerTypes.MySQL;

cDBMetadata _aux_metadata = new cDBMetadata();
_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
cDBMetadata_Table _aux_table = _aux_metadata.Tables[_arg_TableName];
int _aux_table_hasidentitykey = _aux_table.hasIdentityKey();
bool _aux_table_searches_hasexplicituniqueindex = _aux_table.Searches.hasExplicitUniqueIndex();

cDBMetadata_Table_Field _aux_field;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE `sp0_<%=_aux_table.Name%>_insObject`(<%
	for (int f = 0; f < _aux_table.Fields.Count; f++) {
		_aux_field = _aux_table.Fields[f];%><%=""%>
	<%=(_aux_field.isIdentity) ? "OUT" : "IN"%> `<%=_aux_field.Name%>_` <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? "(" + _aux_field.Size + ")" : ""%>, <%
	}%>
	IN `SelectIdentity_` BOOLEAN
)
	NOT DETERMINISTIC
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN<%
	if (_aux_table_searches_hasexplicituniqueindex) {%>
	DECLARE `ConstraintExist` BOOLEAN;
	SET `ConstraintExist` = `fnc0_<%=_aux_table.Name%>__ConstraintExist`(<%
		for (int f = 0; f < _aux_table.Fields.Count; f++) {
			_aux_field = _aux_table.Fields[f];%><%=""%>
		<%=(_aux_field.isPK) ? _aux_field.DBs[_aux_dbservertype].DBType_generic_DBEmptyValue() : "`" + _aux_field.Name + "_`"%><%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
		}%>
	);
	IF (NOT `ConstraintExist`) THEN<%
	}%>
		INSERT INTO `<%=_aux_table.Name%>` (<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				if (_aux_table_hasidentitykey != f) {
					_aux_field = _aux_table.Fields[f];%>
			`<%=_aux_field.Name%>`<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
				}
			}%>
		) VALUES (<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				if (_aux_table_hasidentitykey != f) {
					_aux_field = _aux_table.Fields[f];%>
			`<%=_aux_field.Name%>_`<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
				}
			}%>
		);
		IF (`SelectIdentity_`) THEN
			SET `<%=_aux_table.Fields[_aux_table_hasidentitykey]%>_` = @@IDENTITY;
		ELSE
			SET `<%=_aux_table.Fields[_aux_table_hasidentitykey]%>_` = CAST(0 AS SIGNED INTEGER/*<%=_aux_table.Fields[_aux_table_hasidentitykey].DBs[_aux_dbservertype].DBType_inDB_name%>*/);
		END IF;<%
	if (_aux_table_searches_hasexplicituniqueindex) {%>
	ELSE
		SET `<%=_aux_table.Fields[_aux_table_hasidentitykey]%>_` = CAST(-1 AS SIGNED INTEGER/*<%=_aux_table.Fields[_aux_table_hasidentitykey].DBs[_aux_dbservertype].DBType_inDB_name%>*/);
	END IF;<%
	}%>
END;<%
//-----------------------------------------------------------------------------------------
%>