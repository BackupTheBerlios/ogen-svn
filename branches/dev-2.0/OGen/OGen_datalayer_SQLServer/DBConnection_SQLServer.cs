#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace OGen.lib.datalayer.SQLServer {
	public sealed class DBConnection_SQLServer : DBConnection {
		//#region public DBConnection_SQLServer(...);
		public DBConnection_SQLServer(
			string connectionstring_in
		) : base (
//			DBServerTypes.SQLServer, 
			connectionstring_in, 
			string.Empty
		) {
		}
		public DBConnection_SQLServer(
			string connectionstring_in,
			string logfile_in
		) : base (
//			DBServerTypes.SQLServer, 
			connectionstring_in,
			logfile_in
		) {
		}
		//#endregion

		//#region public static properties...
		#region public static DBUtils Utils { get; }
		private static DBUtils utils__ = null;

		public static DBUtils Utils {
			get {
				if (utils__ == null) {
					utils__ = new DBUtils_SQLServer();
				}
				return utils__;
			}
		}
		#endregion
		//#endregion
		//#region public properties...
		#region public abstract string DBServerType { get; }
		public const string DBSERVERTYPE = "SQLServer";

		public override string DBServerType {
			get {
				return DBSERVERTYPE;
			}
		}
		#endregion
		#region public override DBUtils utils { get; }
		public override DBUtils utils {
			get {
				return Utils;
			}
		}
		#endregion
		#region public override IDbConnection exposeConnection { get; }
		public override IDbConnection exposeConnection {
			get {
				if (connection__ == null) {
					connection__ = new SqlConnection(Connectionstring);
				}

				return connection__;
			}
		}
		#endregion
		//#endregion

		//#region private Methods...
		#region protected override IDbCommand newDBCommand(string command_in, IDbConnection connection_in);
		protected override IDbCommand newDBCommand(string command_in, IDbConnection connection_in) {
			IDbCommand _newdbcommand_out;

			if ((transaction__ != null) && (transaction__.inTransaction)) {
			    _newdbcommand_out = new SqlCommand(
			        command_in, 
			        (SqlConnection)connection_in, 
			        (SqlTransaction)Transaction.exposeTransaction
			    );
			} else {
				_newdbcommand_out = new SqlCommand(
					command_in, 
					(SqlConnection)connection_in
				);
			}

			_newdbcommand_out.CommandTimeout = connection_in.ConnectionTimeout;

			return _newdbcommand_out;
		}
		#endregion
		#region protected override IDbDataAdapter newDBDataAdapter(string query_in, IDbConnection connection_in, bool isQuery_notProcedure_in);
		protected override IDbDataAdapter newDBDataAdapter(string query_in, IDbConnection connection_in, bool isQuery_notProcedure_in) {
			IDbDataAdapter _newdbdataadapter_out = new SqlDataAdapter(
				query_in,
				(SqlConnection)connection_in
			);

			if ((transaction__ != null) && (transaction__.inTransaction)) {
				_newdbdataadapter_out.SelectCommand.Transaction 
					= (SqlTransaction)transaction__.exposeTransaction;
			}

			return _newdbdataadapter_out;
		}
		#endregion
		//#endregion
		//#region public Methods...
		#region public override IDbDataParameter newDBDataParameter(...);
		public override IDbDataParameter newDBDataParameter(
			string name_in, 
			DbType dbType_in, 
			ParameterDirection parameterDirection_in, 
			object value_in, 
			int size_in, 
			byte precision_in, 
			byte scale_in
		) {
			IDbDataParameter _newdbdataparameter_out;

			_newdbdataparameter_out = new SqlParameter();
			_newdbdataparameter_out.ParameterName =
				(name_in[0] == '@') ?
			name_in :
				string.Format("@{0}", name_in);

			_newdbdataparameter_out.DbType = dbType_in;
			_newdbdataparameter_out.Direction = parameterDirection_in;
			if ((value_in == null) || (value_in == DBNull.Value)) {
				((SqlParameter)_newdbdataparameter_out).IsNullable = true;
				_newdbdataparameter_out.Value = DBNull.Value;
			} else {
				_newdbdataparameter_out.Value = value_in;
			}
			if (size_in != 0) {
				_newdbdataparameter_out.Size = size_in;
			} else if (dbType_in == DbType.AnsiString) {
				// length can't be 0 for text and ntext, hence:
				_newdbdataparameter_out.Size = 1;
			}
			if (precision_in != 0) {
				_newdbdataparameter_out.Precision = precision_in;
			}
			if (scale_in != 0) {
				_newdbdataparameter_out.Scale = scale_in;
			}

			return _newdbdataparameter_out;
		}
		#endregion
		//#endregion




//		#region protected override object Execute_SQLFunction(...);
		protected override object Execute_SQLFunction(
			string function_in, 
			IDbDataParameter[] dataParameters_in, 
			IDbCommand command_in, 
			DbType returnValue_DbType_in, 
			int returnValue_Size_in
		) {
			if (Logenabled) {
				Log("sql function", function_in, dataParameters_in);
			}

			object Execute_SQLFunction_out = null;
			#region command_.Parameters = dataParameters_in;
			for (int i = 0; i < dataParameters_in.Length; i++) {
				command_in.Parameters.Add(dataParameters_in[i]);
			}
			#endregion

			command_in.CommandText = function_in;

			command_in.CommandType = CommandType.StoredProcedure;
			try {
				if (returnValue_Size_in >= 0) {
					command_in.Parameters.Add(
						newDBDataParameter(
							"SomeOutput",
							(DbType)returnValue_DbType_in,
							ParameterDirection.ReturnValue,
							null,
							returnValue_Size_in
						)
					);
					command_in.ExecuteNonQuery();
					Execute_SQLFunction_out
						= ((IDbDataParameter)command_in.Parameters[
							command_in.Parameters.Count - 1
						]).Value;
				} else {
					command_in.ExecuteNonQuery();
					//Execute_SQLFunction_out = null;
				}
			} catch (Exception _ex) {
				throw new Exception(
					string.Format(
						"Stored Procedure: {0}\nConnectionString: {1}|{2}\nexception: {3}\ninner-exception: {4}\n",
						function_in,
						DBServerType, 
#if DEBUG
						connectionstring_, 
#else
						"- not available -", 
#endif
						_ex.Message, 
						_ex.InnerException
					)
				);
			}

			return Execute_SQLFunction_out;
		}
//		#endregion




		//---
		#region public override string SQLFunction_exists_query(...);
		public override string SQLFunction_exists_query(string name_in) {
			return string.Format(
				#region "SELECT ...", 
@"
SELECT null
FROM INFORMATION_SCHEMA.ROUTINES
WHERE
	(routine_type = 'FUNCTION')
	AND
	(routine_name = '{0}')
", 
				#endregion
				name_in
			);
		}
		#endregion
		#region public override string SQLFunction_delete_query(...);
		public override string SQLFunction_delete_query(string name_in) {
			return string.Format(
				"DROP FUNCTION {0}",
				name_in
			);
		}
		#endregion
		#region public override string SQLStoredProcedure_exists_query(...);
		public override string SQLStoredProcedure_exists_query(string name_in) {
			return string.Format(
				#region "SELECT ...",
@"
SELECT null
FROM INFORMATION_SCHEMA.ROUTINES
WHERE
	(routine_type = 'PROCEDURE')
	AND
	(routine_name = '{0}')
",
				name_in
				#endregion
			);
		}
		#endregion
		#region public override string SQLStoredProcedure_delete_query(...);
		public override string SQLStoredProcedure_delete_query(string name_in) {
			return string.Format(
				"DROP PROCEDURE {0}",
				name_in
			);
		}
		#endregion
		#region public override string SQLView_exists_query(...);
		public override string SQLView_exists_query(string name_in) {
			return string.Format(
				#region "SELECT ...",
@"
SELECT null
FROM INFORMATION_SCHEMA.TABLES
WHERE
	(TABLE_TYPE = 'VIEW')
	AND
	(TABLE_NAME = '{0}')
",
				name_in
				#endregion
			);
		}
		#endregion
		#region public override string SQLView_delete_query(...);
		public override string SQLView_delete_query(string name_in) {
			return string.Format(
				"DROP VIEW {0}",
				name_in
			);
		}
		#endregion
		//---
		#region public override string getDBs_query();
		public override string getDBs_query() {
			return
@"
SELECT CATALOG_NAME 
FROM INFORMATION_SCHEMA.SCHEMATA 
WHERE
	(CATALOG_NAME != 'master') 
	AND
	(CATALOG_NAME != 'tempdb') 
	AND 
	(CATALOG_NAME != 'model') 
	AND 
	(CATALOG_NAME != 'msdb') 
	AND 
	(CATALOG_NAME != 'pubs') 
GROUP BY CATALOG_NAME 
ORDER BY CATALOG_NAME
"
			;
		}
		#endregion
		#region public override string getTables_query(string subAppName_in);
		public override string getTables_query(
			string dbName_in, 
			string subAppName_in
		) {
			StringBuilder _query = new StringBuilder(string.Empty);
			#region _query.Append(@"SELECT ...");
			_query.Append(string.Format(
@"
SELECT
	_table.table_name,
	CASE
		WHEN (_table.table_type = 'VIEW') THEN
			CAST(1 AS INT)
		ELSE
			CAST(0 AS INT)
	END
	AS is_view, 
	_prop.value AS table_description 
FROM information_schema.tables _table
LEFT JOIN sys.extended_properties _prop ON (
	(_prop.major_id = object_id(_table.table_name))
	AND 
	(_prop.name = 'MS_Description')
)
WHERE
	(
		(_table.table_type = 'BASE TABLE')
		OR
		(_table.table_type = 'VIEW')
	)

	-- <PostgreSQL>
	AND
	(
		(_table.table_type != 'VIEW')
		OR
		(
			(_table.table_type = 'VIEW')
			AND
			(_table.table_name NOT LIKE 'v0_%')
		)
	)
	-- </PostgreSQL>

	-- <PostgreSQL>
	AND
	(_table.table_schema NOT IN (
		'information_schema', 
		'pg_catalog'
	))
	-- </PostgreSQL>

	-- <SQLServer>
	AND
	(_table.table_name NOT IN (
		'sysconstraints', 
		'syssegments', 
		'dtproperties', 
		'sysdiagrams'
	))
	-- </SQLServer>

	AND
	(_table.table_catalog = '{0}')
",
				dbName_in
			));
			#endregion
			if (subAppName_in != "") {
				_query.Append("AND (");
				string[] _subAppNames = subAppName_in.Split('|');
				for (int i = 0; i < _subAppNames.Length; i++) {
					_query.Append(string.Format(
						"(_table.table_name {0} '{1}'){2}",
						(_subAppNames[i].IndexOf('%') >= 0) ? "LIKE" : "=",
						_subAppNames[i],
						(i == _subAppNames.Length - 1) ? "" : " OR "
					));
				}
				_query.Append(") ");
			}
			_query.Append("ORDER BY _table.table_name");

			return _query.ToString();
		}
		#endregion
		#region public override string getTableFields_query(...);
		public override string getTableFields_query(
			string tableName_in
		) {
			#region return "SELECT ...";
			return string.Format(
@"
SELECT
	_field.table_name,
	_field.column_name,

	CASE
		WHEN (_table.table_type = 'VIEW') THEN
			CAST(0 AS INT)
		WHEN _field.is_nullable = 'YES' THEN
			CAST(1 AS INT)
		ELSE
			CAST(0 AS INT)
	END
	AS is_nullable,

	_field.data_type
	AS data_type,

	_field.character_maximum_length
	AS character_maximum_length,

	CASE
		WHEN (_table.table_type = 'VIEW') THEN
			CAST(0 AS INT)
		WHEN (_field.column_name = _pk.column_name) THEN
			CAST(1 AS INT)
		ELSE
			CAST(0 AS INT)
	END
	AS is_pk,

	CASE
		WHEN (_table.table_type = 'VIEW') THEN
			CAST(0 AS INT)
		ELSE
			CAST(COLUMNPROPERTY(OBJECT_ID(_field.table_name), _field.column_name, 'IsIdentity') AS INT)
	END
	AS is_identity,

	_fk.fk_table_name AS fk_table_name,

	_fk.fk_column_name AS fk_column_name,

	_field.column_default,

	_field.collation_name,

	_field.numeric_precision,

	_field.numeric_scale, 

	_prop.value AS column_description

FROM information_schema.columns AS _field

	LEFT JOIN sys.extended_properties _prop ON (
		(_prop.major_id = Object_id(_field.table_name))
		and
		(_prop.minor_id = _field.ordinal_position)
		and 
		(_prop.name = 'MS_Description')
	)

	LEFT JOIN information_schema.tables _table ON (
		(_table.table_catalog = _field.table_catalog)
		AND
		(_table.table_schema = _field.table_schema)
		AND
		(_table.table_name = _field.table_name)
	)

	LEFT JOIN (
		SELECT
			_kcu.table_name,
			_kcu.column_name,
			_kcu.table_catalog,
			_kcu.table_schema
		FROM information_schema.table_constraints _tc
		INNER JOIN information_schema.key_column_usage _kcu ON
			(_kcu.constraint_catalog = _tc.constraint_catalog)
			AND
			(_kcu.constraint_schema = _tc.constraint_schema)
			AND
			(_kcu.constraint_name = _tc.constraint_name)
			AND
			(_tc.constraint_type = 'PRIMARY KEY')
	) _pk ON
		(_pk.table_catalog = _field.table_catalog)
		AND
		(_pk.table_schema = _field.table_schema)
		AND
		(_pk.table_name = _field.table_name)
		AND
		(_pk.column_name = _field.column_name)

	LEFT JOIN (
		SELECT
			_pk.table_name AS fk_table_name,
			_pk.column_name AS fk_column_name,

			_fks.table_name,
			_fks.column_name,
			_fks.table_catalog,
			_fks.table_schema
		FROM information_schema.referential_constraints _rc
		INNER JOIN information_schema.key_column_usage _fks ON
			(_fks.constraint_catalog = _rc.constraint_catalog)
			AND
			(_fks.constraint_schema = _rc.constraint_schema)
			AND
			(_fks.constraint_name = _rc.constraint_name)
		INNER JOIN information_schema.key_column_usage _pk ON
			(_pk.constraint_catalog = _rc.constraint_catalog)
			AND
			(_pk.constraint_schema = _rc.constraint_schema)
			AND
			(_pk.constraint_name = _rc.unique_constraint_name)
	) _fk ON
		(_fk.table_catalog = _field.table_catalog)
		AND
		(_fk.table_schema = _field.table_schema)
		AND
		(_fk.table_name = _field.table_name)
		AND
		(_fk.column_name = _field.column_name)

WHERE
	(_field.table_name NOT IN (
		'sysconstraints', 
		'syssegments', 
		'dtproperties', 
		'sysdiagrams'
	))
	AND
	(_field.table_catalog = '{0}')
	AND
	(
		('' = '{1}')
		OR
		(_field.table_name = '{1}')
	)
ORDER BY
	_field.table_name,
--	_field.column_name,
	_field.ordinal_position
",
				Connectionstring_DBName, 
				tableName_in
			);
			#endregion
		}
		#endregion
	}
}
