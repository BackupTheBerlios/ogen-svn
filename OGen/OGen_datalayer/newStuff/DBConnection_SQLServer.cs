#region Copyright (C) 2002 Francisco Monteiro
/*

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

*/
#endregion
using System;
using System.Data;
using System.Data.SqlClient;

namespace OGen.lib.datalayer.newStuff {
	public sealed class cDBConnection_SQLServer : cDBConnection {
		//#region public cDBConnection_SQLServer(...);
		public cDBConnection_SQLServer(
			string connectionstring_in
		) : base (
			eDBServerTypes.SQLServer, 
			connectionstring_in, 
			string.Empty
		) {
		}
		public cDBConnection_SQLServer(
			string connectionstring_in,
			string logfile_in
		) : base (
			eDBServerTypes.SQLServer, 
			connectionstring_in,
			logfile_in
		) {
		}
		//#endregion

		//#region public properties...
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
				_newdbdataadapter_out.SelectCommand.Transaction = (SqlTransaction)transaction__.exposeTransaction;
			}

			return _newdbdataadapter_out;
		}
		#endregion
		//#endregion
		//#region public Methods...
		#region public override IDbDataParameter newDBDataParameter(...);
		public override IDbDataParameter newDBDataParameter(string name_in, DbType dbType_in, ParameterDirection parameterDirection_in, object value_in, int size_in) {
			IDbDataParameter _newdbdataparameter_out;

			_newdbdataparameter_out = new SqlParameter();
			_newdbdataparameter_out.ParameterName =
				(name_in.Substring(0, 1) == "@") ?
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
			#region command_in.CommandText = function_in;
			switch (dbservertype_) {
				case eDBServerTypes.PostgreSQL: {
						command_in.CommandText =
							string.Format("\"{0}\"", function_in);
						break;
					}
				case eDBServerTypes.SQLServer:
				case eDBServerTypes.MySQL:
				default: {
						command_in.CommandText = function_in;
						break;
					}
			}
			#endregion
			command_in.CommandType = CommandType.StoredProcedure;
			try {
				if (returnValue_Size_in >= 0) {
					switch (dbservertype_) {
						case eDBServerTypes.SQLServer:
						case eDBServerTypes.MySQL: {
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
								break;
							}
						case eDBServerTypes.PostgreSQL: {
								Execute_SQLFunction_out =
									command_in.ExecuteScalar();
								break;
							}
						default:
							throw new Exception("invalid DBServerType");
					}
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
			return string.Format(
				"DROP FUNCTION {0}",
				name_in
			);
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
			return string.Format(
				"DROP PROCEDURE {0}",
				name_in
			);
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
			return string.Format(
				"DROP VIEW {0}",
				name_in
			);
		}
		#endregion
		//---
		#region protected override string getdbs();
		protected override string getdbs() {
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
	}
}