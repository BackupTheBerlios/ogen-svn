#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;
using OGen.lib.datalayer;

namespace OGen.NTier.lib.metadata.metadataDB {
	[System.Xml.Serialization.XmlRootAttribute("metadataDB")]
	public class XS__metadataDB : XS0__metadataDB {
//		#region public static XS__metadataDB Load_fromDB(...);
		public delegate void Load_fromDBDelegate(
			string message_in, 
			bool onANewLine_in
		);

		public static XS__metadataDB Load_fromDB(
			XS__metadataDB.Load_fromDBDelegate notifyBack_in, 
			string subAppName_in, 

			params DBConnectionParam[] dbConnectionParam_in
		) {
			return Load_fromDB(
				notifyBack_in, 
				subAppName_in, 

				null,

				dbConnectionParam_in
			);
		}
		public static XS__metadataDB Load_fromDB(
			XS__metadataDB.Load_fromDBDelegate notifyBack_in, 
			string subAppName_in, 

			XS__RootMetadata root_ref_in, 

			params DBConnectionParam[] dbConnectionParam_in
		) {
			XS__metadataDB _output = new XS__metadataDB();

			bool _exist_getTables;
			bool _exist_getTableFields;
			DBConnection _connection;
			cDBTable[] _tables_aux;
			cDBTableField[] _fields_aux;
			XS_tableType _table;
			XS_tableFieldType _field;
			int _table_searchindex;
			const string OGEN_SP0__GETTABLEFIELDS = "OGen_sp0__getTableFields";
			const string OGEN_SP0__GETTABLES = "OGen_sp0__getTables";

			for (int _con_index = 0; _con_index < dbConnectionParam_in.Length; _con_index++) {
				_exist_getTables = false;
				_exist_getTableFields = false;

				_connection = DBConnectionsupport.CreateInstance(
					dbConnectionParam_in[_con_index].DBServerType,
					dbConnectionParam_in[_con_index].Connectionstring
				);
				_exist_getTables = _connection.SQLStoredProcedure_exists(OGEN_SP0__GETTABLES);
				_exist_getTableFields = _connection.SQLStoredProcedure_exists(OGEN_SP0__GETTABLEFIELDS);
				_tables_aux = _connection.getTables(
					subAppName_in,
					_exist_getTables 
						? OGEN_SP0__GETTABLES
						: string.Empty
				);
				_fields_aux = _connection.getTableFields(
					// _tables_aux[t].Name, // get's specific table fields
					string.Empty, // get's fields for all tables
					_exist_getTables 
						? OGEN_SP0__GETTABLEFIELDS
						: string.Empty
				);

				for (int t = 0; t < _tables_aux.Length; t++) {
					_table_searchindex = _output.Tables.TableCollection.Search(
						_tables_aux[t].Name
					);
					_table = (_table_searchindex >= 0) 
						? _output.Tables.TableCollection[_table_searchindex]
						: new XS_tableType();

					_table.Name = _tables_aux[t].Name;
					_table.isVirtualTable = _tables_aux[t].isVirtualTable;
					_table.DBDescription = _tables_aux[t].DBDescription;

					for (int f = 0; f < _fields_aux.Length; f++) {
						if (_tables_aux[t].Name != _fields_aux[f].TableName) {
							continue;
						}

						_field = new XS_tableFieldType();
						_field.Name = _fields_aux[f].Name;
						_field.isPK = _fields_aux[f].isPK;
						_field.isIdentity = _fields_aux[f].isIdentity;
						_field.isNullable = _fields_aux[f].isNullable;
						_field.NumericPrecision = _fields_aux[f].Numeric_Precision;
						_field.NumericScale = _fields_aux[f].Numeric_Scale;
						_field.Size = _fields_aux[f].Size;
						_field.FKTableName = _fields_aux[f].FK_TableName;
						_field.FKFieldName = _fields_aux[f].FK_FieldName;
//						_field.DBDescription = _fields_aux[f].DBDescription;
//						_field.DBDefaultValue = _fields_aux[f].DBDefaultValue;
//						_field.DBCollationName = _fields_aux[f].DBCollationName;

						_table.TableFields.TableFieldCollection.Add(
							_field
						);
					}
					_output.Tables.TableCollection.Add(
						_table
					);
				}
			}

			return _output;
		}
//		#endregion
	}
}
