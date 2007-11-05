<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataExtended" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataDB" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
DBServerTypes _aux_dbservertype = DBServerTypes.SQLServer;

XS__RootMetadata _aux_root_metadata = XS__RootMetadata.Load_fromFile(
	_arg_MetadataFilepath, 
	true
);
XS__metadataDB _aux_db_metadata = _aux_root_metadata.MetadataDBCollection[0];
XS__metadataExtended _aux_ex_metadata = _aux_root_metadata.MetadataExtendedCollection[0];

OGen.NTier.lib.metadata.metadataDB.XS_tableType _aux_db_table
	= _aux_db_metadata.Tables.TableCollection[
		_arg_TableName
	];
OGen.NTier.lib.metadata.metadataExtended.XS_tableType _aux_ex_table
	= _aux_db_table.parallel_ref;

OGen.NTier.lib.metadata.metadataDB.XS_tableFieldType _aux_db_field;
OGen.NTier.lib.metadata.metadataExtended.XS_tableFieldType _aux_ex_field;

#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE [dbo].[sp0_<%=_aux_db_table.Name%>_setObject]<%
	for (int f = 0; f < _aux_table.Fields.Count; f++) {
		_aux_field = _aux_table.Fields[f];%>
	@<%=_aux_field.Name%>_ <%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%><%=(_aux_field.isText) ? " (" + _aux_field.Size + ")" : ""%><%=(_aux_field.isDecimal && (_aux_field.Numeric_Scale > 0)) ? " (" + _aux_field.Numeric_Precision + ", " + _aux_field.Numeric_Scale + ")" : ""%>, <%
	}%>

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[<%=_aux_table.Fields[0].Name%>]
		FROM [<%=_aux_db_table.Name%>]
		WHERE<%
			for (int k = 0; k < _aux_db_table.TableFields_onlyPK.TableFieldCollection.Count; k++) {
				_aux_db_field = _aux_db_table.TableFields_onlyPK.TableFieldCollection[k];%>
			([<%=_aux_field.Name%>] = @<%=_aux_field.Name%>_)<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
			}%>
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = <%
		if (_aux_ex_table.TableSearches.hasExplicitUniqueIndex) {
			%>"dbo"."fnc0_<%=_aux_db_table.Name%>__ConstraintExist"(<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				_aux_field = _aux_table.Fields[f];%><%=""%>
			<%=(_aux_field.isPK) ? _aux_field.DBs[_aux_dbservertype].DBType_generic_DBEmptyValue() : "@" + _aux_field.Name + "_"%><%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
		)<%
		} else {
			%>0<%
		}%>
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [<%=_aux_db_table.Name%>] (<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				_aux_field = _aux_table.Fields[f];%>
				[<%=_aux_field.Name%>]<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
			) VALUES (<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				_aux_field = _aux_table.Fields[f];%>
				@<%=_aux_field.Name%>_<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
			)
		END
	END ELSE BEGIN
		SET @Exists = 1<%

	// Comment: no need to update if table has only (it's) keys,
	// no other fields to update
	if (_aux_table.Fields.Count == _aux_table.Fields.Count_onlyPK()) {%>
		SET @ConstraintExist = 0<%
	} else {%>
		SET @ConstraintExist = <%
		if (_aux_ex_table.TableSearches.hasExplicitUniqueIndex) {
			%>"dbo"."fnc0_<%=_aux_db_table.Name%>__ConstraintExist"(<%
			for (int f = 0; f < _aux_table.Fields.Count; f++) {
				_aux_field = _aux_table.Fields[f];%>
			@<%=_aux_field.Name%>_<%=(f != _aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
		)<%
		} else {
			%>0<%
		}
		if (_aux_table.Fields_noPK.Count == 0) {%>
		/* no need!<%
		}%>
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [<%=_aux_db_table.Name%>]
			SET<%
				for (int nk = 0; nk < _aux_table.Fields_noPK.Count; nk++) {
					_aux_field = _aux_table.Fields_noPK[nk];%>
				[<%=_aux_field.Name%>] = @<%=_aux_field.Name%>_<%=(nk != _aux_table.Fields_noPK.Count - 1) ? ", " : ""%><%
				}%>
			WHERE<%
				for (int k = 0; k < _aux_db_table.TableFields_onlyPK.TableFieldCollection.Count; k++) {
					_aux_db_field = _aux_db_table.TableFields_onlyPK.TableFieldCollection[k];%>
				([<%=_aux_field.Name%>] = @<%=_aux_field.Name%>_)<%=(k != _aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
				}%>
		END<%
		if (_aux_table.Fields_noPK.Count == 0) {
		%>
		*/<%
		}
	}%>
	END

	SET @Output_ = 0
	IF (@Exists = 1) BEGIN
		SET @Output_ = @Output_ + 1
	END
	IF (@ConstraintExist = 1) BEGIN
		SET @Output_ = @Output_ + 2
	END
--GO


<%
//-----------------------------------------------------------------------------------------
%>
