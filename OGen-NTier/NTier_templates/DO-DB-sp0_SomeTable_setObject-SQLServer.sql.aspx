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
bool aux_table_searches_hasexplicituniqueindex = aux_table.Searches.hasExplicitUniqueIndex();

cDBMetadata_Table_Field aux_field;
bool isFirst;
#endregion
//-----------------------------------------------------------------------------------------
%>CREATE PROCEDURE dbo."sp0_<%=aux_table.Name%>_setObject"<%
	for (int f = 0; f < aux_table.Fields.Count; f++) {
		aux_field = aux_table.Fields[f];%>
	@<%=aux_field.Name%>_ <%=aux_field.DBType_inDB_name%><%=(aux_field.isText) ? " (" + aux_field.Size + ")" : ""%>, <%
	}%>

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[<%=aux_table.Fields[0].Name%>]
		FROM [<%=aux_table.Name%>]
		WHERE<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%>
			([<%=aux_field.Name%>] = @<%=aux_field.Name%>_)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
			}%>
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = <%
		if (aux_table_searches_hasexplicituniqueindex) {
			%>"dbo"."fnc0_<%=aux_table.Name%>__ConstraintExist"(<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%><%=""%>
			<%=(aux_field.isPK) ? aux_field.DBType_generic.DBEmptyValue : "@" + aux_field.Name + "_"%><%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
		)<%
		} else {
			%>0<%
		}%>
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [<%=aux_table.Name%>] (<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
				[<%=aux_field.Name%>]<%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
			) VALUES (<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
				@<%=aux_field.Name%>_<%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
			)
		END
	END ELSE BEGIN
		SET @Exists = 1<%

	// Comment: no need to update if table has only (it's) keys,
	// no other fields to update
	if (aux_table.Fields.Count == aux_table.Fields.Count_onlyPK()) {%>
		SET @ConstraintExist = 0<%
	} else {%>
		SET @ConstraintExist = <%
		if (aux_table_searches_hasexplicituniqueindex) {
			%>"dbo"."fnc0_<%=aux_table.Name%>__ConstraintExist"(<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
			@<%=aux_field.Name%>_<%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
			}%>
		)<%
		} else {
			%>0<%
		}
		if (aux_table.Fields_noPK.Count == 0) {%>
		/* no need!<%
		}%>
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [<%=aux_table.Name%>]
			SET<%
				for (int nk = 0; nk < aux_table.Fields_noPK.Count; nk++) {
					aux_field = aux_table.Fields_noPK[nk];%>
				[<%=aux_field.Name%>] = @<%=aux_field.Name%>_<%=(nk != aux_table.Fields_noPK.Count - 1) ? ", " : ""%><%
				}%>
			WHERE<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%>
				([<%=aux_field.Name%>] = @<%=aux_field.Name%>_)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? " AND" : ""%><%
				}%>
		END<%
		if (aux_table.Fields_noPK.Count == 0) {
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
	END<%
//-----------------------------------------------------------------------------------------
%>