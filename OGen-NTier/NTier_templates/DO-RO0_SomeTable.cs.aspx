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
string aux_field_name;
cDBMetadata_Update aux_update;
int firstKey = aux_table.firstKey();
#endregion
//-----------------------------------------------------------------------------------------
if ((aux_metadata.CopyrightText != string.Empty) && (aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%=aux_metadata.CopyrightText%>
/*

<%=aux_metadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;
using System.Data;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace <%=aux_metadata.Namespace%>.lib.datalayer {
	/// <summary>
	/// <%=aux_table.Name%> RecordObject which provides access to searches defined for <%=aux_table.Name%> table at Database.
	/// </summary>
	public sealed class RO0_<%=aux_table.Name%> : RO__base {
		#region internal RO0_<%=aux_table.Name%>();
		internal RO0_<%=aux_table.Name%>(
			DO0_<%=aux_table.Name%> parent_ref_in
		) : base(
			parent_ref_in
		) {
			parent_ref_ = parent_ref_in;
		}
		#endregion

		#region private Properties...
		private DO0_<%=aux_table.Name%> parent_ref_;
		#endregion

		#region public Methods...
		#region public override bool Read();
		/// <summary>
		/// Reads values from Record, assigns them to the appropriate <%=aux_table.Name%> DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read() {
			return Read(false);
		}

		/// <summary>
		/// Reads values from Record, assigns them to the appropriate <%=aux_table.Name%> DataObject property, finally it steps current iteration at the Record forward and returns a bool value indicating if End Of Record has been reached.
		/// </summary>
		/// <param name="doNOTgetObject_in">do NOT get object: - if set to true, only PKs will be available for reading, you should be carefull (updates aren't advisable, other issues may occur)</param>
		/// <returns>False if End Of Record has been reached, True if not</returns>
		public override bool Read(bool doNOTgetObject_in) {
			if (base.read()) {
				if (base.Fullmode) {<%
					for (int f = 0; f < aux_table.Fields.Count; f++) {
						aux_field = aux_table.Fields[f];%><%=""%>
					if (base.Record.Rows[Current]["<%=aux_field.Name%>"] == System.DBNull.Value) {<%
					    if (aux_field.isNullable && !aux_table.isVirtualTable) {%><%=""%><%
					    // parent_ref_.< %=aux_field.Name.ToLower()% >_ = null;%>
					    parent_ref_.<%=aux_field.Name%>_isNull = true;<%
                        } else {%><%=""%>
					    parent_ref_.<%=aux_field.Name.ToLower()%>_ = <%=aux_field.DBType_generic.FWEmptyValue%>;<%
                        }%>
					} else {
					    parent_ref_.<%=aux_field.Name.ToLower()%>_ = (<%=aux_field.DBType_generic.FWType%>)base.Record.Rows[Current]["<%=aux_field.Name%>"];
					}<%
					//parent_ref_.< %=aux_field.Name.ToLower()% >_ = (< %=aux_field.DBType_generic.FWType% >)base.Record.Rows[Current]["< %=aux_field.Name% >"];
					//parent_ref_.< %=aux_field.Name.ToLower()% >_ = (base.Record.Rows[Current]["< %=aux_field.Name% >"] == System.DBNull.Value) ? < %=aux_field.DBType_generic.FWEmptyValue% > : (< %=aux_field.DBType_generic.FWType% >)base.Record.Rows[Current]["< %=aux_field.Name% >"];
					}%>

					parent_ref_.haschanges_ = false;
				} else {<%
					for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
						aux_field = aux_table.Fields[k];
					//parent_ref_.< %=aux_field.Name.ToLower()% >_ = (< %=aux_field.DBType_generic.FWType% >)base.Record.Rows[Current]["< %=aux_field.Name% >"];
					%>
					parent_ref_.<%=aux_field.Name.ToLower()%>_ = (base.Record.Rows[Current]["<%=aux_field.Name%>"] == System.DBNull.Value) ? <%=aux_field.DBType_generic.FWEmptyValue%> : (<%=aux_field.DBType_generic.FWType%>)base.Record.Rows[Current]["<%=aux_field.Name%>"];<%
					}%>

					if (!doNOTgetObject_in) {
						parent_ref_.getObject();
					}
				}

				return true;
			} else {
				parent_ref_.clrObject();

				return false;
			}
		}
		#endregion
		//---<%
		for (int s = 0; s < aux_table.Searches.Count; s++) {
			if (aux_table.Searches[s].isRange) {%>
		#region public void ????_<%=aux_table.Searches[s].Name%>
		#region public void Open_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Opens Record, based on '<%=aux_table.Searches[s].Name%>' search. It selects <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search and assigns them to the Record, opening it.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		public void Open_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			Open_<%=aux_table.Searches[s].Name%>(<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
				<%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}
				%><%=(aux_table.Searches[s].SearchParameters.Count != 0) ? ", " : ""%>
				true
			);
		}

		/// <summary>
		/// Opens Record, based on '<%=aux_table.Searches[s].Name%>' search. It selects <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search and assigns them to the Record, opening it.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		public void Open_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%><%=(aux_table.Searches[s].SearchParameters.Count != 0) ? ", " : ""%>
			bool fullmode_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>)<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}%>
			};
			base.Open(
				string.Format(
					"sp{0}_<%=aux_table.Name%>_Record_open_<%=aux_table.Searches[s].Name%>{1}", 
					fullmode_in ? "0" : "", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}

		/// <summary>
		/// Opens Record, based on '<%=aux_table.Searches[s].Name%>' search. It selects <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search and assigns them to the Record, opening it.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}
			%><%=(aux_table.Searches[s].SearchParameters.Count != 0) ? ", " : ""%>
			int page_in, 
			int page_numRecords_in
		) {
			Open_<%=aux_table.Searches[s].Name%>(<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
				<%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}
				%><%=(aux_table.Searches[s].SearchParameters.Count != 0) ? ", " : ""%>
				true, 
				page_in, 
				page_numRecords_in
			);
		}

		/// <summary>
		/// Opens Record, based on '<%=aux_table.Searches[s].Name%>' search. It selects <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search and assigns them to the Record, opening it.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <param name="fullmode_in">Sets Record mode to Fullmode if True, or Not if False</param>
		/// <param name="page_in">page number</param>
		/// <param name="page_numRecords_in">number of records per page</param>
		public void Open_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}
			%><%=(aux_table.Searches[s].SearchParameters.Count != 0) ? ", " : ""%>
			bool fullmode_in, 
			int page_in, 
			int page_numRecords_in
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>), <%
				}%>
				parent_ref_.Connection.newDBDataParameter("page_", DbType.Int32, ParameterDirection.Input, page_in, 0), 
				parent_ref_.Connection.newDBDataParameter("page_numRecords_", DbType.Int32, ParameterDirection.Input, page_numRecords_in, 0)
			};
			base.Open(
				string.Format(
					"sp0_<%=aux_table.Name%>_Record_open_<%=aux_table.Searches[s].Name%>_page{0}", 
					fullmode_in ? "_fullmode" : ""
				), 
				_dataparameters, 
				fullmode_in
			);
		}
		#endregion<%
		if (!aux_table.isVirtualTable) {
			for (int u = 0; u < aux_table.Searches[s].Updates.Count; u++) {
		%>
		#region public bool Update_<%=aux_table.Searches[s].Updates[u].Name%>_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Updates (some) <%=aux_table.Name%> values on Database based on the '<%=aux_table.Searches[s].Name%>' search.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}
		for (int f = 0; f < aux_table.Searches[s].Updates[u].UpdateParameters.Count; f++) {
			aux_field = aux_table.Searches[s].Updates[u].UpdateParameters[f].Field;%><%=""%>
		/// <param name="<%=aux_field.Name%>_update_in"><%=aux_field.Name%> update value</param><%
		}%>
		public void Update_<%=aux_table.Searches[s].Updates[u].Name%>_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in, <%
			}
			for (int f = 0; f < aux_table.Searches[s].Updates[u].UpdateParameters.Count; f++) {
				aux_field = aux_table.Searches[s].Updates[u].UpdateParameters[f].Field;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field.Name%>_update_in<%=(f != aux_table.Searches[s].Updates[u].UpdateParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>), <%
				}
				for (int f = 0; f < aux_table.Searches[s].Updates[u].UpdateParameters.Count; f++) {
					aux_field = aux_table.Searches[s].Updates[u].UpdateParameters[f].Field;%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field.Name%>_update_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name%>_update_in, <%=aux_field.Size%>)<%=(f != aux_table.Searches[s].Updates[u].UpdateParameters.Count - 1) ? ", " : ""%><%
				}%>
			};
			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_<%=aux_table.Name%>_Record_update_<%=aux_table.Searches[s].Updates[u].Name%>_<%=aux_table.Searches[s].Name%>", 
				_dataparameters
			);
		}
		#endregion<%
			}
		}
		%>
		#region public bool hasObject_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// It selects <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search and checks to see if <%=aux_table.Name%> Keys(passed as parameters) are met.
		/// </summary><%
		for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
			aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
		/// <param name="<%=aux_field.Name%>_in"><%=aux_table.Name%>'s <%=aux_field.Name%> Key used for checking</param><%
		}
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> Keys are met in the '<%=aux_table.Searches[s].Name%>' search, False if not</returns>
		public bool hasObject_<%=aux_table.Searches[s].Name%>(<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field.Name%>_in<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
			}
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;
			%>, 
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name%>_in, <%=aux_field.Size%>)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
			}
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;
				%>, 
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>)<%
			}%>
			};
			return (bool)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_<%=aux_table.Name%>_Record_hasObject_<%=aux_table.Searches[s].Name%>", 
				_dataparameters, 
				DbType.Boolean,
				0
			);
		}
		#endregion
		#region public long Count_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Count's number of search results from <%=aux_table.Name%> at Database based on the '<%=aux_table.Searches[s].Name%>' search.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <returns>number of existing Records for the '<%=aux_table.Searches[s].Name%>' search</returns>
		public long Count_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>)<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}%>
			};

			return (long)parent_ref_.Connection.Execute_SQLFunction(
				"fnc0_<%=aux_table.Name%>_Record_count_<%=aux_table.Searches[s].Name%>", 
				_dataparameters, 
				DbType.Int64,
				0
			);
		}
		#endregion<%
		if (!aux_table.isVirtualTable) {%>
		#region public void Delete_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Deletes <%=aux_table.Name%> values from Database based on the '<%=aux_table.Searches[s].Name%>' search.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		public void Delete_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=(aux_field.isNullable && !aux_table.isVirtualTable) ? "object" : aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				parent_ref_.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>)<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}%>
			};

			parent_ref_.Connection.Execute_SQLFunction(
				"sp0_<%=aux_table.Name%>_Record_delete_<%=aux_table.Searches[s].Name%>", 
				_dataparameters
			);
		}
		#endregion<%
		}%>
		#endregion<%
			}
		}%>
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>