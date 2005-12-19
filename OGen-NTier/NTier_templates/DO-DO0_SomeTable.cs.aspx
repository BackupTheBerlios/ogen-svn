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
%>#region <%=aux_metadata.CopyrightText%>
/*

<%=aux_metadata.CopyrightTextLong%>

*/
#endregion
using System;
using System.Data;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace <%=aux_metadata.Namespace%>.lib.datalayer {
	/// <summary>
	/// <%=aux_table.Name%> DataObject which provides access to <%=aux_table.Name%> <%=(aux_table.isVirtualTable) ? "view" : "table"%> at Database.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO_<%=aux_table.Name%>">DO_<%=aux_table.Name%></see>.
	/// </note>
	/// </summary>
	[DOClassAttribute("<%=aux_table.Name%>", <%=aux_table.isVirtualTable.ToString().ToLower()%>, <%=aux_table.isConfig.ToString().ToLower()%>)]
	public abstract class DO0_<%=aux_table.Name%> : DO__base {
		#region internal DO0_<%=aux_table.Name%>();
		internal DO0_<%=aux_table.Name%>(
		) : base(
			DO0__utils.DBServerType, 
			DO0__utils.DBConnectionstring
		) {
			clrObject();
			haschanges_ = false;
		}
		internal DO0_<%=aux_table.Name%>(
			cDBConnection connection_in
		) : base(
			connection_in
		) {
			clrObject();
			haschanges_ = false;
		}
		#endregion

		#region Properties...<%
		if (aux_metadata.PseudoReflectionable) {%>
		public static pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%> pReflection;<%
		}%>
		#region public RO0_<%=aux_table.Name%> Record { get; }
		private RO0_<%=aux_table.Name%> record__;

		/// <summary>
		/// Exposes RecordObject.
		/// </summary>
		public RO0_<%=aux_table.Name%> Record {
			get {
				if (record__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					record__ = new RO0_<%=aux_table.Name%>(this);
				}
				return record__;
			}
		}
		#endregion
		#region public bool hasChanges { get; }
		internal bool haschanges_;
		/// <summary>
		/// Indicates if changes have been made to DO0_<%=aux_table.Name%> properties since last time getObject method was run.
		/// </summary>
		public virtual bool hasChanges {
			get { return haschanges_; }
		}
		#endregion
		//---<%
		for (int f = 0; f < aux_table.Fields.Count; f++) {
			aux_field = aux_table.Fields[f];%>
		#region public virtual <%=aux_field.DBType_generic.FWType%> <%=aux_field.Name%> { get; set; }
		internal <%=aux_field.DBType_generic.FWType%> <%=aux_field.Name.ToLower()%>_;// = <%=aux_field.DBType_generic.FWEmptyValue%>;
		
		/// <summary>
		/// <%=aux_table.Name%>'s <%=aux_field.Name%>.
		/// </summary>
		[DOPropertyAttribute("<%=aux_field.Name%>", <%=aux_field.isPK.ToString().ToLower()%>, <%=aux_field.isIdentity.ToString().ToLower()%>, <%=aux_field.isNullable.ToString().ToLower()%>, <%=(aux_field.DefaultValue == string.Empty) ? "\"\"" : aux_field.DefaultValue%>, "<%=aux_field.FK_TableName%>", "<%=aux_field.FK_FieldName%>", <%=aux_field.isConfig_Name.ToString().ToLower()%>, <%=aux_field.isConfig_Config.ToString().ToLower()%>, <%=aux_field.isConfig_Datatype.ToString().ToLower()%>, <%=aux_field.isBool.ToString().ToLower()%>, <%=aux_field.isDateTime.ToString().ToLower()%>, <%=aux_field.isInt.ToString().ToLower()%>, <%=aux_field.isDecimal.ToString().ToLower()%>, <%=aux_field.isText.ToString().ToLower()%>)]
		public virtual <%=aux_field.DBType_generic.FWType%> <%=aux_field.Name%> {
			get {
				return <%=aux_field.Name.ToLower()%>_;
			}
			set {
				if (<%=aux_field.Name.ToLower()%>_ != value) {
					<%=aux_field.Name.ToLower()%>_ = value;
					haschanges_ = true;
				}
			}
		}
		#endregion<%
		}%>
		#endregion

		#region Methods...
		#region public virtual void clrObject();
		/// <summary>
		/// Clears all DO0_<%=aux_table.Name%> properties, assigning them with their appropriate default property value.
		/// </summary>
		public virtual void clrObject() {<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%><%=""%>
			<%=aux_field.Name%> = <%=(aux_field.DefaultValue == "") ? aux_field.DBType_generic.FWEmptyValue : aux_field.DefaultValue%>;<%
			}%>
		}
		#endregion
		#region public virtual bool getObject(...);
		/// <summary>
		/// Selects <%=aux_table.Name%> values from Database and assigns them to the appropriate DO0_<%=aux_table.Name%> property.
		/// </summary>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public virtual bool getObject() {
			return getObject(<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
				<%=aux_field.Name.ToLower()%>_<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
				}%>
			);
		}
		/// <summary>
		/// Selects <%=aux_table.Name%> values from Database and assigns them to the appropriate DO0_<%=aux_table.Name%> property.
		/// </summary><%
		for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
			aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
		/// <param name="<%=aux_field.Name%>_in"><%=aux_field.Name%></param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public virtual bool getObject(<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field.Name%>_in<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
			}%>
		) {<%
			if (aux_table_hasidentitykey != -1) {
				aux_field = aux_table.Fields[aux_table_hasidentitykey];%>
			if (<%=aux_field.Name%>_in != <%=aux_field.DBType_generic.FWEmptyValue%>) {<%
			}%>
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
					for (int f = 0; f < aux_table.Fields.Count; f++) {
						aux_field = aux_table.Fields[f];%>
					base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.<%=(aux_field.isPK) ? "Input" : ""%>Output, <%=(aux_field.isPK) ? aux_field.Name + "_in" : "null"%>, <%=aux_field.Size%>)<%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
					}%>
				};
				base.Connection.Execute_SQLFunction("sp0_<%=aux_table.Name%>_getObject", _dataparameters);

				if (_dataparameters[<%=firstKey%>].Value != DBNull.Value) {
					<%for (int f = 0; f < aux_table.Fields.Count; f++) {
						aux_field = aux_table.Fields[f];
					%><%=aux_field.Name.ToLower()%>_ = (_dataparameters[<%=f%>].Value == System.DBNull.Value) ? <%=aux_field.DBType_generic.FWEmptyValue%> : (<%=aux_field.DBType_generic.FWType%>)_dataparameters[<%=f%>].Value;
					<%}%>
					haschanges_ = false;
					return true;
				}<%
			if (aux_table_hasidentitykey != -1) {%>
			}<%
			}%>

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion<%
		if (!aux_table.isVirtualTable) {%>
		#region public virtual void delObject(...);
		/// <summary>
		/// Deletes <%=aux_table.Name%> from Database.
		/// </summary>
		public virtual void delObject() {
			delObject(<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
				<%=aux_field.Name.ToLower()%>_<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
				}%>
			);
		}
		/// <summary>
		/// Deletes <%=aux_table.Name%> from Database.
		/// </summary><%
		for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
			aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
		/// <param name="<%=aux_field.Name%>_in"><%=aux_field.Name%></param><%
		}%>
		public virtual void delObject(<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field.Name%>_in<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%>
				base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name%>_in, <%=aux_field.Size%>)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
				}%>
			};
			base.Connection.Execute_SQLFunction("sp0_<%=aux_table.Name%>_delObject", _dataparameters);

			clrObject();
		}
		#endregion<%
		}%>
		#region public virtual bool isObject(...);
		/// <summary>
		/// Checks to see if <%=aux_table.Name%> exists at Database
		/// </summary>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public virtual bool isObject() {
			return isObject(<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
				<%=aux_field.Name.ToLower()%>_<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
				}%>
			);
		}
		/// <summary>
		/// Checks to see if <%=aux_table.Name%> exists at Database
		/// </summary><%
		for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
			aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
		/// <param name="<%=aux_field.Name%>_in"><%=aux_field.Name%></param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public virtual bool isObject(<%
			for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
				aux_field = aux_table.Fields_onlyPK[k];%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field.Name%>_in<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int k = 0; k < aux_table.Fields_onlyPK.Count; k++) {
					aux_field = aux_table.Fields_onlyPK[k];%>
				base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name%>_in, <%=aux_field.Size%>)<%=(k != aux_table.Fields_onlyPK.Count - 1) ? ", " : "" %><%
				}%>
			};

			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_<%=aux_table.Name%>_isObject", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion<%
		if (!aux_table.isVirtualTable) {
		if (aux_table_hasidentitykey == -1) {%>
		#region public virtual bool setObject(...);
		/// <summary>
		/// Inserts/Updates <%=aux_table.Name%> values into/on Database. Inserts if <%=aux_table.Name%> doesn't exist or Updates if <%=aux_table.Name%> already exists.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param>
		/// <returns>True if it didn't exist (INSERT), and False if it did exist (UPDATE)</returns>
		public virtual bool setObject(bool forceUpdate_in<%=(aux_table_searches_hasexplicituniqueindex) ? ", out bool ConstraintExist_out" : ""%>) {
			<%if (!aux_table_searches_hasexplicituniqueindex) {
				%>bool ConstraintExist_out;
			<%}
			%>if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
					for (int f = 0; f < aux_table.Fields.Count; f++) {
						aux_field = aux_table.Fields[f];%>
					base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.<%=(aux_field.isIdentity) ? "Out" : "In"%>put, <%=(aux_field.isIdentity) ? "null" : aux_field.Name.ToLower() + "_"%>, <%=aux_field.Size%>), <%
					}%>

					//base.Connection.newDBDataParameter("Exists", DbType.Boolean, ParameterDirection.Output, 0, 1)<%
					if (aux_table_searches_hasexplicituniqueindex) {%>, 
					//base.Connection.newDBDataParameter("ConstraintExist", DbType.Boolean, ParameterDirection.Output, 0, 1)<%
					}%>
					base.Connection.newDBDataParameter("Output_", DbType.Int32, ParameterDirection.Output, null, 0)
				};
				base.Connection.Execute_SQLFunction(
					"sp0_<%=aux_table.Name%>_setObject", 
					_dataparameters
				);

				ConstraintExist_out = (((int)_dataparameters[<%=aux_table.Fields.Count%>].Value & 2) == 1);
				if (!ConstraintExist_out) {
					haschanges_ = false;<%



					if (aux_table.isConfig) { %>

					#region DO0__utils...._REFRESH();<%
						string NameField;
						string ConfigField;
						string DatatypeField;
						System.Data.DataTable ConfigTable;
						//for (int t = 0; t < aux_metadata.Tables.Count; t++) {
						//	aux_table = aux_metadata.Tables[t];
						//	if (aux_table.isConfig) {
								NameField = "";
								ConfigField = "";
								DatatypeField = "";
								for (int f = 0; f < aux_table.Fields.Count; f++) {
									aux_field = aux_table.Fields[f];
									if (aux_field.isConfig_Name) {
										NameField = aux_field.Name;
										continue;
									}
									if (aux_field.isConfig_Config) {
										ConfigField = aux_field.Name;
										continue;
									}
									if (aux_field.isConfig_Datatype) {
										DatatypeField = aux_field.Name;
										continue;
									}
								}
								cDBConnection connection = new cDBConnection(
									aux_metadata.DBs.Default.DBServerType, 
									aux_metadata.DBs.Default.Connectionstring
								);
								ConfigTable = connection.Execute_SQLQuery_returnDataTable(
									string.Format(
										"SELECT \"{0}\", \"{1}\", \"{2}\" FROM \"{3}\" ORDER BY \"{0}\"",
										NameField, 
										ConfigField, 
										DatatypeField, 
										aux_table.Name
									)
								);%>
					switch (<%=NameField.ToLower()%>_) {<%
								for (int r = 0; r < ConfigTable.Rows.Count; r++) {%>
						case "<%=ConfigTable.Rows[r][NameField]%>": {
							DO0__utils.<%=ConfigTable.Rows[r][NameField]%>_REFRESH();
							break;
						}<%
								}%>
					}<%
						//	}
						//}%>
					#endregion<%



					}%>
				}

				return (((int)_dataparameters[<%=aux_table.Fields.Count%>].Value & 1) != 1);
			} else {
				ConstraintExist_out = false;

				return  false;
			}
		}
		#endregion<%
		} else {%>
		#region public virtual <%=aux_table.Fields[aux_table_hasidentitykey].DBType_generic.FWType%> insObject(...);
		/// <summary>
		/// Inserts <%=aux_table.Name%> values into Database.
		/// </summary>
		/// <param name="selectIdentity_in">assign with True if you wish to retrieve insertion sequence/identity seed and with False if not</param><%
		if (aux_table_searches_hasexplicituniqueindex) { %>
		/// <param name="constraintExist_out">returns True if constraint exists and insertion failed, and False if no constraint and insertion was successful</param><%
		}%>
		/// <returns>insertion sequence/identity seed</returns>
		public virtual <%=aux_table.Fields[aux_table_hasidentitykey].DBType_generic.FWType%> insObject(
			bool selectIdentity_in<%
			if (aux_table_searches_hasexplicituniqueindex) { %>, 
			out bool constraintExist_out<%
			} %>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Fields.Count; f++) {
					aux_field = aux_table.Fields[f];%>
				base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.<%=(aux_field.isIdentity) ? "Out" : "In"%>put, <%=(aux_field.isIdentity) ? "null" : aux_field.Name%>, <%=aux_field.Size%>), <%
				}%>

				base.Connection.newDBDataParameter("SelectIdentity_", DbType.Boolean, ParameterDirection.Input, selectIdentity_in, 1)
			};
			base.Connection.Execute_SQLFunction(
				"sp0_<%=aux_table.Name%>_insObject", 
				_dataparameters
			);

			<%aux_field = aux_table.Fields[aux_table_hasidentitykey];
			%><%=aux_field.Name%> = (<%=aux_field.DBType_generic.FWType%>)_dataparameters[<%=aux_table_hasidentitykey%>].Value;<%
			if (aux_table_searches_hasexplicituniqueindex) {%>
			constraintExist_out = (<%=aux_field.Name%> == -1L);<%
			}%>

			return <%=aux_field.Name%>;
		}
		#endregion
		#region public virtual void updObject(...);
		/// <summary>
		/// Updates <%=aux_table.Name%> values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param><%
		if (aux_table_searches_hasexplicituniqueindex) { %>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param><%
		}%>
		public virtual void updObject(bool forceUpdate_in<%=(aux_table_searches_hasexplicituniqueindex) ? ", out bool constraintExist_out" : ""%>) {
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
					for (int f = 0; f < aux_table.Fields.Count; f++) { aux_field = aux_table.Fields[f];%>
					base.Connection.newDBDataParameter("<%=aux_field.Name%>_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name%>, <%=aux_field.Size%>)<%=((f != aux_table.Fields.Count - 1) || (aux_table_searches_hasexplicituniqueindex)) ? ", " : ""%><%
					}%><%
					if (aux_table_searches_hasexplicituniqueindex) {%>

					base.Connection.newDBDataParameter("ConstraintExist_", DbType.Boolean, ParameterDirection.Output, null, 1)<%
					}%>
				};
				base.Connection.Execute_SQLFunction(
					"sp0_<%=aux_table.Name%>_updObject", 
					_dataparameters
				);
				<%if (aux_table_searches_hasexplicituniqueindex) {%>
				constraintExist_out = <%=(aux_table_searches_hasexplicituniqueindex) ? "(bool)_dataparameters[" + (aux_table.Fields.Count) + "].Value" : "false"%>;
				if (!constraintExist_out) {
					haschanges_ = false;
				}<%
				} else {
				%>haschanges_ = false;<%
				}%>
			<%if (aux_table_searches_hasexplicituniqueindex) {%>
			} else {
				constraintExist_out = false;<%
			}%>
			}
		}
		#endregion<%
		}
		}%>
		#endregion
		#region Methods - Search...<%









		for (int s = 0; s < aux_table.Searches.Count; s++) {
			if (!aux_table.Searches[s].isRange) {%>
		#region public void ???Object_<%=aux_table.Searches[s].Name%>
		#region public bool getObject_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Selects <%=aux_table.Name%> values from Database (based on the search condition) and assigns them to the appropriate DO0_<%=aux_table.Name%> property.
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public bool getObject_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				base.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>), <%
				}
				for (int f = 0; f < aux_table.Fields.Count; f++) {
					aux_field = aux_table.Fields[f];%>
				base.Connection.newDBDataParameter("<%=aux_field.Name%>", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Output, null, <%=aux_field.Size%>)<%=(f != aux_table.Fields.Count - 1) ? ", " : ""%><%
				}%>
			};
			base.Connection.Execute_SQLFunction(
				"sp0_<%=aux_table.Name%>_getObject_<%=aux_table.Searches[s].Name%>", 
				_dataparameters
			);

			if (_dataparameters[<%=aux_table.Searches[s].SearchParameters.Count + firstKey%>].Value != DBNull.Value) {
				<%for (int f = 0; f < aux_table.Fields.Count; f++) {
					aux_field = aux_table.Fields[f];
				%><%=aux_field.Name.ToLower()%>_ = (_dataparameters[<%=aux_table.Searches[s].SearchParameters.Count + f%>].Value == System.DBNull.Value) ? <%=aux_field.DBType_generic.FWEmptyValue%> : (<%=aux_field.DBType_generic.FWType%>)_dataparameters[<%=aux_table.Searches[s].SearchParameters.Count + f%>].Value;
				<%}%>
				haschanges_ = false;
				return true;
			}

			//clrObject();
			//haschanges_ = false;

			return false;
		}
		#endregion<%
		if (!aux_table.isVirtualTable) {%>
		#region public bool delObject_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Deletes <%=aux_table.Name%> from Database (based on the search condition).
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"> <%=aux_field_name%> search condition</param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> existed and was Deleted at Database, False if it didn't exist</returns>
		public bool delObject_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				base.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>), <%
				}%>

				base.Connection.newDBDataParameter("Exists_", DbType.Boolean, ParameterDirection.Output, null, 1)
			};
			base.Connection.Execute_SQLFunction("sp0_<%=aux_table.Name%>_delObject_<%=aux_table.Searches[s].Name%>", _dataparameters);

			return ((bool)_dataparameters[<%=aux_table.Searches[s].SearchParameters.Count%>].Value);
		}
		#endregion<%
		}%>
		#region public bool isObject_<%=aux_table.Searches[s].Name%>(...);
		/// <summary>
		/// Checks to see if <%=aux_table.Name%> exists at Database (based on the search condition).
		/// </summary><%
		for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
			aux_field = aux_table.Searches[s].SearchParameters[f].Field;
			aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
		/// <param name="<%=aux_field_name%>_search_in"><%=aux_field_name%> search condition</param><%
		}%>
		/// <returns>True if <%=aux_table.Name%> exists at Database, False if not</returns>
		public bool isObject_<%=aux_table.Searches[s].Name%>(<%
			for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
				aux_field = aux_table.Searches[s].SearchParameters[f].Field;
				aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%><%=""%>
			<%=aux_field.DBType_generic.FWType%> <%=aux_field_name%>_search_in<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
			}%>
		) {
			IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
				for (int f = 0; f < aux_table.Searches[s].SearchParameters.Count; f++) {
					aux_field = aux_table.Searches[s].SearchParameters[f].Field;
					aux_field_name = aux_table.Searches[s].SearchParameters[f].ParamName;%>
				base.Connection.newDBDataParameter("<%=aux_field_name%>_search_", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field_name%>_search_in, <%=aux_field.Size%>)<%=(f != aux_table.Searches[s].SearchParameters.Count - 1) ? ", " : ""%><%
				}%>
			};
			return (bool)base.Connection.Execute_SQLFunction(
				"fnc0_<%=aux_table.Name%>_isObject_<%=aux_table.Searches[s].Name%>", 
				_dataparameters, 
				DbType.Boolean, 
				0
			);
		}
		#endregion
		#endregion<%
			}
		}









%>
		#endregion
		#region Methods - Updates...<%
		for (int u = 0; u < aux_table.Updates.Count; u++) {
			aux_update = aux_table.Updates[u];%>
		#region public virtual void updObject_<%=aux_update.Name%>(...);
		/// <summary>
		/// Updates <%=aux_table.Name%> specific(only) values on Database.
		/// </summary>
		/// <param name="forceUpdate_in">assign with True if you wish to force an Update (even if no changes have been made since last time getObject method was run) and False if not</param><%
		if (aux_table_searches_hasexplicituniqueindex) { %>
		/// <param name="constraintExist_out">returns True if constraint exists and Update failed, and False if no constraint and Update was successful</param><%
		} %>
		public virtual void updObject_<%=aux_update.Name%>(bool forceUpdate_in<%=(aux_table_searches_hasexplicituniqueindex) ? ", out bool constraintExist_out" : ""%>) {
			if (forceUpdate_in || haschanges_) {
				IDbDataParameter[] _dataparameters = new IDbDataParameter[] {<%
					for (int f = 0; f < aux_table.Fields_onlyPK.Count; f++) { aux_field = aux_table.Fields_onlyPK[f];%>
					base.Connection.newDBDataParameter("<%=aux_field.Name%>", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name.ToLower()%>_, <%=aux_field.Size%>), <%
					}
					for (int f = 0; f < aux_update.UpdateParameters.Count; f++) { aux_field = aux_update.UpdateParameters[f].Field;%>
					base.Connection.newDBDataParameter("<%=aux_field.Name%>_update", DbType.<%=aux_field.DBType_generic.Value.ToString()%>, ParameterDirection.Input, <%=aux_field.Name.ToLower()%>_, <%=aux_field.Size%>)<%=((f != aux_update.UpdateParameters.Count - 1) || (aux_table_searches_hasexplicituniqueindex)) ? ", " : ""%><%
					}
					if (aux_table_searches_hasexplicituniqueindex) {%>

					base.Connection.newDBDataParameter("ConstraintExist", DbType.Boolean, ParameterDirection.Output, null, 1)<%
					}%>
				};
				base.Connection.Execute_SQLFunction(
					"sp0_<%=aux_table.Name%>_updObject_<%=aux_update.Name%>", 
					_dataparameters
				);
				<%if (aux_table_searches_hasexplicituniqueindex) {%>
				constraintExist_out = <%=(aux_table_searches_hasexplicituniqueindex) ? "(bool)_dataparameters[" + (aux_table.Fields.Count) + "].Value" : "false"%>;
				if (!constraintExist_out) {
					haschanges_ = false;
				}<%
				} else {
				%>haschanges_ = false;<%
				}%>
			<%if (aux_table_searches_hasexplicituniqueindex) {%>
			} else {
				constraintExist_out = false;<%
			}%>
			}
		}
		#endregion<%
		}%>
		#endregion
	}
}<%
//-----------------------------------------------------------------------------------------
%>