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
using Npgsql;
using System.Text;

namespace OGen.lib.datalayer.PostgreSQL {
	public sealed class cDBConnection_PostgreSQL : cDBConnection {
		//#region public cDBConnection_PostgreSQL(...);
		public cDBConnection_PostgreSQL(
			string connectionstring_in
		) : base (
//			eDBServerTypes.PostgreSQL, 
			connectionstring_in,
			string.Empty
		) {
		}
		public cDBConnection_PostgreSQL(
			string connectionstring_in,
			string logfile_in
		) : base (
//			eDBServerTypes.PostgreSQL, 
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
					utils__ = new DBUtils_PostgreSQL();
				}
				return utils__;
			}
		}
		#endregion
		//#endregion
		//#region public properties...
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
					connection__ = new NpgsqlConnection(Connectionstring);
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
				_newdbcommand_out = new NpgsqlCommand(
					command_in, 
					(NpgsqlConnection)connection_in, 
					(NpgsqlTransaction)Transaction.exposeTransaction
				);
			} else {
				_newdbcommand_out = new NpgsqlCommand(
					command_in, 
					(NpgsqlConnection)connection_in
				);
			}

			_newdbcommand_out.CommandTimeout = connection_in.ConnectionTimeout;

			return _newdbcommand_out;
		}
		#endregion
		#region protected override IDbDataAdapter newDBDataAdapter(string query_in, IDbConnection connection_in, bool isQuery_notProcedure_in);
		protected override IDbDataAdapter newDBDataAdapter(string query_in, IDbConnection connection_in, bool isQuery_notProcedure_in) {
			IDbDataAdapter _newdbdataadapter_out = new NpgsqlDataAdapter(
				(isQuery_notProcedure_in) ? query_in : "\"" + query_in + "\"",
				(NpgsqlConnection)connection_in
			);

			if ((transaction__ != null) && (transaction__.inTransaction)) {
				_newdbdataadapter_out.SelectCommand.Transaction 
					= (NpgsqlTransaction)transaction__.exposeTransaction;
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

			_newdbdataparameter_out = new NpgsqlParameter();
			_newdbdataparameter_out.ParameterName = ":\"" + name_in + "\"";

			// fmonteiro: by default npgsql assumes any datetime 
			// to be time zoned
			if (dbType_in == DbType.DateTime) {
				_newdbdataparameter_out.DbType = dbType_in;
				// EXPLICITLY assuming datetime without time zone
				((NpgsqlParameter)_newdbdataparameter_out).NpgsqlDbType = NpgsqlTypes.NpgsqlDbType.Timestamp;
			} else {
				_newdbdataparameter_out.DbType = dbType_in;
			}

			_newdbdataparameter_out.Direction = parameterDirection_in;
			if ((value_in == null) || (value_in == DBNull.Value)) {
				_newdbdataparameter_out.Value = DBNull.Value;
			} else {
				_newdbdataparameter_out.Value = value_in;
			}
			if (size_in != 0) {
				_newdbdataparameter_out.Size = size_in;
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

			command_in.CommandText = string.Format(
				"\"{0}\"", 
				function_in
			);

			command_in.CommandType = CommandType.StoredProcedure;
			try {
				if (returnValue_Size_in >= 0) {
					Execute_SQLFunction_out =
						command_in.ExecuteScalar();
				} else {
					command_in.ExecuteNonQuery();
					//Execute_SQLFunction_out = null;
				}
			} catch (Exception e) {
				throw new Exception(
					string.Format(
						"Stored Procedure: {0}\nConnectionString: {1}\nexception: {2}\n",
						function_in,
						connectionstring_,
						e.ToString()
					)
				);
			}

			return Execute_SQLFunction_out;
		}
//		#endregion




		//---
		#region protected override string sqlfunction_exists(...);
		protected override string sqlfunction_exists(string name_in) {
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
		#region protected override string sqlfunction_delete(...);
		protected override string sqlfunction_delete(string name_in) {
			// ToDos: here! not implemented
			// NOTES: It's not as easy as it is for SQLServer and MySQL. PostgreSQL 
			// allows you to create diferent signatures for the same function, so in 
			// order to drop a function we need to know the parameters for such 
			// function.
			// To overcome such probleme, remember that in PostgreSQL you can use:
			// CREATE OR REPLACE FUNCTION "some_function"

			throw new Exception("- not implemented!");
		}
		#endregion
		#region protected override string sqlstoredprocedure_exists(...);
		protected override string sqlstoredprocedure_exists(string name_in) {
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
		#region protected override string sqlstoredprocedure_delete(...);
		protected override string sqlstoredprocedure_delete(string name_in) {
			// ToDos: here! not implemented
			// NOTES: It's not as easy as it is for SQLServer and MySQL. PostgreSQL 
			// allows you to create diferent signatures for the same procedure, so in 
			// order to drop a procedure we need to know the parameters for such 
			// procedure.
			// To overcome such probleme, remember that in PostgreSQL you can use:
			// CREATE OR REPLACE PROCEDURE "some_procedure"
			// PostgreSQL supports Stored Procedures.

			throw new Exception("- not implemented!");
		}
		#endregion
		#region protected override string sqlview_exists(...);
		protected override string sqlview_exists(string name_in) {
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
		#region protected override string sqlview_delete(...);
		protected override string sqlview_delete(string name_in) {
			// ToDos: here! not implemented, needed if droping, 
			// no need when replacing, you can use:
			// CREATE OR REPLACE VIEW "some_view"

			throw new Exception("- not implemented!");
		}
		#endregion
		//---
		#region protected override string getdbs(...);
		protected override string getdbs() {
			return
@"
SELECT CATALOG_NAME 
FROM INFORMATION_SCHEMA.SCHEMATA 
WHERE
	(CATALOG_NAME != 'postgres') 
GROUP BY CATALOG_NAME 
ORDER BY CATALOG_NAME
"
			;
		}
		#endregion
		#region protected override string gettables(...);
		protected override string gettables(string subAppName_in) {
			StringBuilder _query = new StringBuilder(string.Empty);
			#region _query.Append(@"SELECT ...");
			_query.Append(@"
SELECT
	TABLE_NAME AS ""Name"",
	CASE
		WHEN (TABLE_TYPE = 'VIEW') THEN
			CAST(1 AS Int)
		ELSE
			CAST(0 AS Int)
	END AS ""isVT""
FROM INFORMATION_SCHEMA.TABLES
WHERE
	(
		(TABLE_TYPE = 'BASE TABLE')
		OR
		(TABLE_TYPE = 'VIEW')
	)
	AND
	(
		(TABLE_TYPE != 'VIEW')
		OR
		(
			(TABLE_TYPE = 'VIEW')
			AND
			(TABLE_NAME NOT LIKE 'v0_%')
		)
	)
	AND
	(TABLE_NAME != 'dtproperties')
	AND
	(TABLE_NAME NOT LIKE 'sql_%')
	AND
	(TABLE_NAME NOT LIKE 'pg_%')
	AND
	(TABLE_NAME NOT LIKE 'sys%')
	AND
	(TABLE_NAME NOT LIKE '%__base')
	AND
	(TABLE_SCHEMA NOT LIKE 'information_schema')
"
			);
			#endregion
			if (subAppName_in != "") {
				_query.Append("AND (");
				string[] _subAppNames = subAppName_in.Split('|');
				for (int i = 0; i < _subAppNames.Length; i++) {
					_query.Append(string.Format(
						"(TABLE_NAME {0} '{1}'){2}",
						(_subAppNames[i].IndexOf('%') >= 0) ? "LIKE" : "=", 
						_subAppNames[i],
						(i == _subAppNames.Length - 1) ? "" : " OR "
					));
				}
				_query.Append(") ");
			}
			_query.Append(@"ORDER BY ""Name"" ");

			return _query.ToString();
		}
		#endregion
		#region protected override string gettablefields(...);
		protected override string gettablefields(
			string tableName_in
		) {
			#region return "SELECT ...";
			return string.Format(@"
SELECT
	_field.COLUMN_NAME AS ""Name"", 
	CASE
		WHEN _field.IS_NULLABLE = 'NO' THEN
			CAST(0 AS Int)
		ELSE
			CAST(1 AS Int)
	END 
	AS ""isNullable"", 
	_field.DATA_TYPE AS ""Type"", 
	_field.CHARACTER_MAXIMUM_LENGTH AS ""Size"", 
	CASE
		WHEN (_table.TABLE_TYPE = 'VIEW') THEN
			CAST(0 AS Int)
		WHEN (_field.COLUMN_NAME = _pk.COLUMN_NAME) THEN
			CAST(1 AS Int)
		ELSE
			CAST(0 AS Int)
	END
	AS ""isPK"", 
	CASE
		WHEN (_table.TABLE_TYPE = 'VIEW') THEN
			CAST(0 AS Int)
		ELSE
			CASE
				WHEN (_field.COLUMN_DEFAULT LIKE 'nextval(''%') THEN
					CAST(1 AS Int)
				ELSE
					CAST(0 AS Int)
			END
	END 
	AS ""isIdentity"", 
	_fk.FOREIGN_TABLE_NAME AS ""FK_TableName"", 
	_fk.FOREIGN_COLUMN_NAME AS ""FK_FieldName"", 
	_field.COLUMN_DEFAULT AS ""COLUMN_DEFAULT"", 
	_field.COLLATION_NAME AS ""COLLATION_NAME"", 
	_field.NUMERIC_PRECISION AS ""NUMERIC_PRECISION"", 
	_field.NUMERIC_SCALE AS ""NUMERIC_SCALE""
FROM INFORMATION_SCHEMA.COLUMNS AS _field
	LEFT JOIN INFORMATION_SCHEMA.TABLES _table ON (
		(_table.TABLE_NAME = _field.TABLE_NAME)
		and
		(_table.TABLE_CATALOG = _field.TABLE_CATALOG)
	)
	LEFT JOIN (
		SELECT
			_kcu.TABLE_NAME, 
			_kcu.COLUMN_NAME, 
			_kcu.TABLE_CATALOG
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE _kcu
		LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS _tc ON (
			(_tc.CONSTRAINT_CATALOG = _kcu.CONSTRAINT_CATALOG) 
			AND 
			(_tc.CONSTRAINT_SCHEMA = _kcu.CONSTRAINT_SCHEMA) 
			AND 
			(_tc.CONSTRAINT_NAME = _kcu.CONSTRAINT_NAME) 
		)
		WHERE
			(_tc.CONSTRAINT_TYPE = 'PRIMARY KEY')
	) _pk ON (
		(_pk.TABLE_CATALOG = _field.TABLE_CATALOG)
		and
		(_pk.TABLE_NAME = _field.TABLE_NAME)
		and
		(_pk.COLUMN_NAME = _field.COLUMN_NAME)
	)
	LEFT JOIN (
		SELECT
			_tc2.TABLE_NAME,
			_kcu2.COLUMN_NAME ,
			_ccu2.TABLE_NAME AS FOREIGN_TABLE_NAME ,
			_ccu2.COLUMN_NAME AS FOREIGN_COLUMN_NAME, 
			_tc2.TABLE_CATALOG
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS _tc2
		JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE _ccu2 ON
			(_ccu2.CONSTRAINT_CATALOG = _tc2.CONSTRAINT_CATALOG) 
			AND 
			(_ccu2.CONSTRAINT_NAME = _tc2.CONSTRAINT_NAME)
		JOIN  INFORMATION_SCHEMA.KEY_COLUMN_USAGE _kcu2 ON
			(_kcu2.CONSTRAINT_CATALOG = _ccu2.CONSTRAINT_CATALOG) 
			AND 
			(_kcu2.CONSTRAINT_NAME = _ccu2.CONSTRAINT_NAME)
		WHERE
			_tc2.CONSTRAINT_TYPE = 'FOREIGN KEY'
	) _fk ON (
		(_field.TABLE_CATALOG = _fk.TABLE_CATALOG)
		and
		(_field.TABLE_NAME = _fk.TABLE_NAME)
		and
		(_field.COLUMN_NAME = _fk.COLUMN_NAME)
	)
WHERE (_field.TABLE_NAME = '{0}')
ORDER BY _field.ORDINAL_POSITION
",
				tableName_in
			);
			#endregion
		}
		#endregion
	}
}
