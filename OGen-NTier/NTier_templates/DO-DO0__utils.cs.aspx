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
<%//@ assembly name="OGen.lib.datalayer, Version=0.1.2033.30004, Culture=neutral,PublicKeyToken=66a788813bfe4b51" %>
<%//@ assembly name="OGen.NTier.lib.metadata, Version=0.1.2033.30005, Culture=neutral,PublicKeyToken=66a788813bfe4b51" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);

cDBMetadata_Table aux_table;
cDBMetadata_Table_Field aux_field;
int aux_table_hasidentitykey;
string[] aux_configmodes = aux_metadata.ConfigModes();
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
	/// utils DataObject which works as a repository of useful Properties and Methods for DataObjects at <%=aux_metadata.Namespace%>.lib.datalayer namespace.
	/// <note type="implementnotes">
	/// Access must be made via <see cref="DO__utils">DO__utils</see>.
	/// </note>
	/// </summary>
	public abstract class DO0__utils {
		#region internal DO0__utils(...);
		internal DO0__utils() {
		}
		#endregion
		#region static DO0__utils();
		static DO0__utils() {
			dbservertype__ = eDBServerTypes.invalid;
			dbconnectionstring__ = null;
		}
		#endregion

		#region public static eDBServerTypes DBServerType { get; }
		private static eDBServerTypes dbservertype__;
		/// <summary>
		/// DB Server Type.
		/// </summary>
		public static eDBServerTypes DBServerType {
			get {
				if (dbservertype__ == eDBServerTypes.invalid) {
					dbservertype__ = OGen.lib.datalayer.utils.DBServerTypes.convert.FromName(
						System.Configuration.ConfigurationSettings.AppSettings["DBServerType"]
					);
				}
				return dbservertype__;
			}
		}
		#endregion
		#region public static string DBConnectionstring { get; }
		private static string dbconnectionstring__;
		/// <summary>
		/// Connection String.
		/// </summary>
		public static string DBConnectionstring {
			get {
				if (dbconnectionstring__ == null) {
					dbconnectionstring__ = OGen.lib.datalayer.utils.Connectionstring.Buildwith.AppSettings(<%
						for (int cm = 0; cm < aux_configmodes.Length; cm++) {%>
#<%=(cm == 0) ? "" : "el"%>if <%=aux_configmodes[cm]%>
						string.Format("<%=aux_metadata.ApplicationName%>-{0}-<%=aux_configmodes[cm]%>", DBServerType.ToString())<%
						}%>
#endif
					);
				}
				return dbconnectionstring__;
			}
		}
		#endregion<%
		if (aux_metadata.PseudoReflectionable) {%>

		public static pr<%=aux_metadata.ApplicationName%> pReflection;<%
		}%><%

		if (true) { // new scope!
			string NameField;
			string ConfigField;
			string DatatypeField;
			System.Data.DataTable ConfigTable;
			for (int t = 0; t < aux_metadata.Tables.Count; t++) {
				aux_table = aux_metadata.Tables[t];
				if (aux_table.isConfig) {%>

		#region static Methods - DB.<%=aux_table.Name%>...<%
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
					);
					for (int r = 0; r < ConfigTable.Rows.Count; r++) {
						switch ((int)ConfigTable.Rows[r][DatatypeField]) {
							case 1:
								%>
		#region public static bool <%=ConfigTable.Rows[r][NameField]%> { get; }
		private static bool <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = false;
		/// <summary>
		/// Forces <%=ConfigTable.Rows[r][NameField]%> config to be re-read from Database.
		/// </summary>
		public static void <%=ConfigTable.Rows[r][NameField]%>_REFRESH() { <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = false; }
		private static bool <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = true;
		/// <summary>
		/// <%=ConfigTable.Rows[r][NameField]%> config which provides access to table <%=aux_table.Name%> at Database.
		/// </summary>
		public static bool <%=ConfigTable.Rows[r][NameField]%> {
			get {
				if (!<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead) {
					#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
					<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = bool.Parse(<%=aux_table.Name.ToLower()%>.<%=ConfigField%>);
					<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;
					#endregion
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = true;
				}
				return <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>;
			}
			set {
				#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.<%=ConfigField%> = value;
				DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
				<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
				<%=aux_table.Name.ToLower()%>.<%=ConfigField%> = value.ToString();
				<%=aux_table.Name.ToLower()%>.setObject(false);
				<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;

				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = value;
				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = true;
				#endregion
			}
		}
		#endregion<%
								break;
							case 4:
								%>
		#region public static int <%=ConfigTable.Rows[r][NameField]%> { get; }
		private static int <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>;
		private static bool <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = false;
		/// <summary>
		/// Forces <%=ConfigTable.Rows[r][NameField]%> config to be re-read from Database.
		/// </summary>
		public static void <%=ConfigTable.Rows[r][NameField]%>_REFRESH() { <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = false; }
		/// <summary>
		/// <%=ConfigTable.Rows[r][NameField]%> config which provides access to table <%=aux_table.Name%> at Database.
		/// </summary>
		public static int <%=ConfigTable.Rows[r][NameField]%> {
			get {
				if (!<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead) {
					#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
					<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = int.Parse(<%=aux_table.Name.ToLower()%>.<%=ConfigField%>);
					<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;
					#endregion
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = true;
				}
				return <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>;
			}
			set {
				#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.<%=ConfigField%> = value;
				DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
				<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
				<%=aux_table.Name.ToLower()%>.<%=ConfigField%> = value.ToString();
				<%=aux_table.Name.ToLower()%>.setObject(false);
				<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;

				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = value;
				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>_beenRead = true;
				#endregion
			}
		}
		#endregion<%
								break;
							case 2:
								%>
		#region public static string <%=ConfigTable.Rows[r][NameField]%> { get; }
		private static string <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = null;
		/// <summary>
		/// Forces <%=ConfigTable.Rows[r][NameField]%> config to be re-read from Database.
		/// </summary>
		public static void <%=ConfigTable.Rows[r][NameField]%>_REFRESH() { <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = null; }
		/// <summary>
		/// <%=ConfigTable.Rows[r][NameField]%> config which provides access to table <%=aux_table.Name%> at Database.
		/// </summary>
		public static string <%=ConfigTable.Rows[r][NameField]%> {
			get {
				if (<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> == null) {
					#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
					<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = <%=aux_table.Name.ToLower()%>.<%=ConfigField%>;
					<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;
					#endregion
				}
				return <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>;
			}
			set {
				#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.<%=ConfigField%> = value;
				DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
				<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
				<%=aux_table.Name.ToLower()%>.<%=ConfigField%> = value;
				<%=aux_table.Name.ToLower()%>.setObject(false);
				<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;

				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = value;
				#endregion
			}
		}
		#endregion<%
								break;
							case 3:
								%>
		#region public static string[] <%=ConfigTable.Rows[r][NameField]%> { get; }
		private static string[] <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = null;
		/// <summary>
		/// Forces <%=ConfigTable.Rows[r][NameField]%> config to be re-read from Database.
		/// </summary>
		public static void <%=ConfigTable.Rows[r][NameField]%>_REFRESH() { <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = null; }
		/// <summary>
		/// <%=ConfigTable.Rows[r][NameField]%> config which provides access to table <%=aux_table.Name%> at Database.
		/// </summary>
		public static string[] <%=ConfigTable.Rows[r][NameField]%> {
			get {
				if (<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> == null) {
					#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
					<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");
					<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = <%=aux_table.Name.ToLower()%>.<%=ConfigField%>.Split((char)10);
					<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;
					#endregion
				}
				return <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%>;
			}
			set {
				#region <%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = DO_<%=aux_table.Name%>.<%=ConfigField%> = value;
				DO_<%=aux_table.Name%> <%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
				<%=aux_table.Name.ToLower()%>.getObject("<%=ConfigTable.Rows[r][NameField]%>");


				<%=aux_table.Name.ToLower()%>.<%=ConfigField%> = string.Empty;
				for (int i = 0; i < value.Length; i++) {
					<%=aux_table.Name.ToLower()%>.<%=ConfigField%> += string.Format(
						"{0}{1}",
						(i != 0) ? ((char)10).ToString() : string.Empty, 
						value[i]
					);
				}


				<%=aux_table.Name.ToLower()%>.setObject(false);
				<%=aux_table.Name.ToLower()%>.Dispose(); <%=aux_table.Name.ToLower()%> = null;

				<%=((string)ConfigTable.Rows[r][NameField]).ToLower()%> = value;
				#endregion
			}
		}
		#endregion<%
								break;
						}
					}
					connection.Dispose(); connection = null;%>
		#endregion<%
				}
			}
		}%>
	}
	<%
	if (aux_metadata.PseudoReflectionable) {
	for (int t = 0; t < aux_metadata.Tables.Count; t++) {
		aux_table = aux_metadata.Tables[t];
		aux_table_hasidentitykey = aux_table.hasIdentityKey();
		for (int f = 0; f < aux_table.Fields.Count; f++) {
			aux_field = aux_table.Fields[f];%>
	#region public struct pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%>_<%=aux_field.Name%> : ...;
	public struct pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%>_<%=aux_field.Name%> : iprField {
		public string Name { get { return "<%=aux_field.Name%>"; } }
		public int Size { get { return <%=aux_field.Size%>; } }
		public bool isNullable { get { return <%=aux_field.isNullable.ToString().ToLower()%>; } }

		public bool isIdentity { get { return <%=aux_field.isIdentity.ToString().ToLower()%>; } }
		public bool isPK { get { return <%=aux_field.isPK.ToString().ToLower()%>; } }

		public bool isBool { get { return <%=aux_field.isBool.ToString().ToLower()%>; } }
		public bool isDateTime { get { return <%=aux_field.isDateTime.ToString().ToLower()%>; } }
		public bool isInt { get { return <%=aux_field.isInt.ToString().ToLower()%>; } }
		public bool isDecimal { get { return <%=aux_field.isDecimal.ToString().ToLower()%>; } }
		public bool isText { get { return <%=aux_field.isText.ToString().ToLower()%>; } }

		public DbType DBType_generic { get { return DbType.<%=aux_field.DBType_generic.Value%>; } }
		public object DBType_inDB { get { return <%=aux_field.DBType_inDB%>; } }

		public iprTable FK_Table { get { return <%=(aux_field.FK.TableName == "") ? "null" : "DO__utils.pReflection.Tables[\"" + aux_field.FK.TableName + "\"]"%>; } }
		public iprField FK_Field { get { return <%=(aux_field.FK.TableName == "") ? "null" : "DO_" + aux_field.FK.TableName + ".pReflection.Fields[\"" + aux_field.FK.FieldName + "\"]"%>; } }

		public Type TypeOf { get { return typeof(<%=aux_field.DBType_generic.FWType%>); } }
		public /*<%=aux_field.DBType_generic.FWType%> */object EmptyValue { get { return <%=aux_field.DBType_generic.FWEmptyValue%>; } }
		//public /*<%=aux_field.DBType_generic.FWType%> */object DefaultValue { get { return <%=aux_field.DBType_generic.FWEmptyValue%>; } }

		//public <%=aux_field.DBType_generic.FWType%> getValueIn(DO_<%=aux_table.Name%> <%=aux_table.Name%>_) {
		//	return <%=aux_table.Name%>_.<%=aux_field.Name%>;
		//}
		//public void setValueIn(DO_<%=aux_table.Name%> <%=aux_table.Name%>_, <%=aux_field.DBType_generic.FWType%> Value_) {
		//	<%=aux_table.Name%>_.<%=aux_field.Name%> = Value_;
		//}
		//public void setObject_withEmptyValue(DO_<%=aux_table.Name%> <%=aux_table.Name%>_) {
		//	<%=aux_table.Name%>_.<%=aux_field.Name%> = <%=aux_field.DBType_generic.FWEmptyValue%>;
		//}
		////public void setObject_withDefaultValue(DO_<%=aux_table.Name%> <%=aux_table.Name%>_) {
		////	<%=aux_table.Name%>_.<%=aux_field.Name%> = <%=aux_field.DBType_generic.FWEmptyValue%>;
		////}
	}
	#endregion<%
		}%>
	#region public struct pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%>;
	public struct pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%> : iprTable {
		#region public sFields Fields { get; }
		#region public struct sFields;
		public struct sFields : iprFields {
			public int Count { get { return <%=aux_table.Fields.Count%>; } }<%
			for (int f = 0; f < aux_table.Fields.Count; f++) {
				aux_field = aux_table.Fields[f];%>
			public pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%>_<%=aux_field.Name%> <%=aux_field.Name%>;<%
			}
			%>

			#region public iprField this[int Index_] { get; }
			public iprField this[int Index_] {
				get {
					switch (Index_) {<%
						for (int f = 0; f < aux_table.Fields.Count; f++) {
							aux_field = aux_table.Fields[f];%>
						case <%=f%>:
							return <%=aux_field.Name%>;<%
						}%>
						default:
							return null;
					}
				}
			}
			#endregion
			#region public iprField this[string Name_] { get; }
			public iprField this[string Name_] {
				get {
					switch (Name_) {<%
						for (int f = 0; f < aux_table.Fields.Count; f++) {
							aux_field = aux_table.Fields[f];%>
						case "<%=aux_field.Name%>":
							return <%=aux_field.Name%>;<%
						}%>
						default:
							return null;
					}
				}
			}
			#endregion
		}
		#endregion

		private static sFields fields;
		public iprFields Fields {
			get { return fields; }
		}
		#endregion

		public string Name { get { return "<%=aux_table.Name%>"; } }
		#region public iprField IdentityKey { get; }
		public iprField IdentityKey {
			get { return <%=(aux_table_hasidentitykey == -1) ? "null" : "fields[" + aux_table.hasIdentityKey() + "]"%>; }
		}
		#endregion
	}
	#endregion<%
	}%>
	#region public struct pr<%=aux_metadata.ApplicationName%>;
	public struct pr<%=aux_metadata.ApplicationName%> {
		#region public sTables Tables { get; }
		#region public struct sTables;
		public struct sTables {
			<%for (int t = 0; t < aux_metadata.Tables.Count; t++) {
				aux_table = aux_metadata.Tables[t];%>
			public pr<%=aux_metadata.ApplicationName%>_<%=aux_table.Name%> <%=aux_table.Name%>;<%
			}%>

			public int Count { get { return <%=aux_metadata.Tables.Count%>; } }
			#region public iprTable this[int Index_] { get; }
			public iprTable this[int Index_] {
				get {
					switch (Index_) {<%
						for (int t = 0; t < aux_metadata.Tables.Count; t++) {
							aux_table = aux_metadata.Tables[t];%>
						case <%=t%>:
							return <%=aux_table.Name%>;<%
						}%>
						default:
							return null;
					}
				}
			}
			#endregion
			#region public iprTable this[string Name_] { get; }
			public iprTable this[string Name_] {
				get {
					switch (Name_) {<%
						for (int t = 0; t < aux_metadata.Tables.Count; t++) {
							aux_table = aux_metadata.Tables[t];%>
						case "<%=aux_table.Name%>":
							return <%=aux_table.Name%>;<%
						}%>
						default:
							return null;
					}
				}
			}
			#endregion
		}
		#endregion
		public sTables Tables;
		#endregion
	}
	#endregion<%
	}%>
}<%
//-----------------------------------------------------------------------------------------
%>