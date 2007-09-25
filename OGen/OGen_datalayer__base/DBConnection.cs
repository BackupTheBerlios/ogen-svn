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
using System.Text;
using System.IO;

namespace OGen.lib.datalayer {
	#region /// <summary>...</summary>
	/// <summary>
	///	Provides access to supported DataBases like PostgreSQL and SQL Server, allowing the execution of SQL Queries and Functions retrieving their existing data if any. It also supports Transactions.
	/// </summary>
	/// <threadsafety static="true" instance="false"/>
	/// <remarks>
	/// There is no need to Open a Connection in order to execute an SQL Query or Function. Open and Close methods are usually used when working with the Transaction
	/// </remarks>
	/// <example>
	/// This sample shows how to execute an SQL Query and populate a DataTable with it's return Output
	/// <code>
	/// DBConnection _connection = new DBConnection(
	///		DBServerTypes.PostgreSQL, 
	///		OGen.lib.datalayer.utils.Connectionstring.Buildwith.Parameters(
	///			"127.0.0.1", 
	///			"postgres", 
	///			"password", 
	///			"TestDB", 
	///			DBServerTypes.PostgreSQL
	///		)
	///	);
	///	
	///	DataTable _datatable 
	///		= _connection.Execute_SQLQuery_returnDataTable("select * from \"User\"");
	///	// ...
	///	
	///	_connection.Dispose(); _connection = null;
	///	</code>
	/// This sample shows how to execute an SQL Function and populate a DataTable with it's return Output
	///	<code>
	/// DBConnection _connection = new DBConnection(
	///		DBServerTypes.PostgreSQL, 
	///		OGen.lib.datalayer.utils.Connectionstring.Buildwith.Parameters(
	///			"127.0.0.1", 
	///			"postgres", 
	///			"password", 
	///			"TestDB", 
	///			DBServerTypes.PostgreSQL
	///		)
	///	);
	///	
	///	IDbDataParameter[] _dbdataparameters = new IDbDataParameter[] {
	///		_connection.newDBDataParameter(
	///			"SomeParameter_", 
	///			DbType.String, 
	///			ParameterDirection.Output, 
	///			null, 
	///			50
	///		), 
	///		_connection.newDBDataParameter(
	///			"SomeOtherParameter_", 
	///			DbType.String, 
	///			ParameterDirection.Output, 
	///			null, 
	///			50
	///		)
	///	};
	///	
	///	DataTable _datatable 
	///		= _connection.Execute_SQLFunction_returnDataTable(
	///			"SomeSQLFunction", 
	///			_dbdataparameters
	///		);
	///	// ...
	///	
	///	_connection.Dispose(); _connection = null;
	///	</code>
	/// </example>
	#endregion
	public abstract class DBConnection : IDisposable {
		//#region public DBConnection(...);
		/// <param name="connectionstring_in">Connection String</param>
		public DBConnection(
			string connectionstring_in
		) :this (
			connectionstring_in,
			string.Empty
		) {
		}

		/// <param name="connectionstring_in">Connection String</param>
		/// <param name="logfile_in">Log File (null or empty string disables log)</param>
		public DBConnection(
			string connectionstring_in, 
			string logfile_in
		) {


// ToDos: here!
//if (connectionstring_.Trim() == string.Empty)
//	throw InvalidConnectionstringException_empty;
//if (dbServerType_in == DBServerTypes.invalid)
//	throw InvalidDBServerTypeException;


			connectionstring_ = connectionstring_in;

			logfile_ = (logfile_in != null)
				? logfile_in
				: string.Empty;
			logenabled_ = 
				(logfile_in != null) 
				&& 
				(logfile_in != string.Empty) 

				//// prefer to let exception be raised and let user know 
				//// he has to revise his config file, hence comment:
				//&& File.Exists(logfile_in)
			;
			isopen_ = false;
		}
		~DBConnection() {
			cleanUp();
		}

		#region public void Dispose();
		public void Dispose() {
			cleanUp();
			System.GC.SuppressFinalize(this);
		}
		#endregion
		#region private void cleanUp();
		private void cleanUp() {
#if !DEBUG
// ToDos: here!
			lock (isopen_) {
#endif
				if (transaction__ != null) {
					transaction__.Dispose(); transaction__ = null;
				}

				if ((bool)isopen_) Close();
				if (connection__ != null) {
					connection__.Dispose(); connection__ = null;
				}
#if !DEBUG
// ToDos: here!
			}
#endif
		}
		#endregion
		//#endregion

		#region Exceptions...
		#region //public static readonly Exception InvalidConnectionstringException_empty;
		///// <summary>
		///// Invalid Connection String Exception (empty).
		///// </summary>
		//public static readonly Exception InvalidConnectionstringException_empty
		//	= new Exception("invalid connection string (empty)");
		#endregion
		#region public static readonly Exception InvalidSQLQueryException_empty;
		/// <summary>
		/// Invalid SQL Query Exception (empty).
		/// </summary>
		public static readonly Exception InvalidSQLQueryException_empty
			= new Exception("invalid sql query (empty)");
		#endregion
		#region public static readonly Exception OpenException_alreadyOpened;
		/// <summary>
		/// Can't Open Connection Exception, Connection already opened.
		/// </summary>
		public static readonly Exception OpenException_alreadyOpened
			= new Exception("can't open, connection already opened");
		#endregion
		#region public static readonly Exception CloseException_alreadyClosed;
		/// <summary>
		/// Can't Close Connection Exception, Connection already Closed.
		/// </summary>
		public static readonly Exception CloseException_alreadyClosed 
			= new Exception("can't close, connection already closed");
		#endregion
		#region public static readonly Exception CloseException_unterminatedTransaction;
		/// <summary>
		/// Can't Close Connection Exception, unterminated Transaction initiated.
		/// </summary>
		public static readonly Exception CloseException_unterminatedTransaction 
			= new Exception("can't close, unterminated transaction initiated");
		#endregion
		#endregion

		#region public properties...
		#region public string Connectionstring { get; }
		protected string connectionstring_;

		/// <summary>
		/// Connection String.
		/// </summary>
		public string Connectionstring {
			get { return connectionstring_; }
		}
		#endregion
		#region public string Logfile { get; }
		protected string logfile_;

		public string Logfile {
			get { return logfile_; }
		}
		#endregion
		#region public bool Logenabled { get; }
		protected bool logenabled_;

		public bool Logenabled {
			get { return logenabled_; }
		}
		#endregion
		#region public bool isOpen { get; }
		protected object isopen_;

		/// <summary>
		/// Indicates DataBase Connection state, True if oppened, False if closed.
		/// </summary>
		public bool isOpen {
			get { return (bool)isopen_; }
		}
		#endregion
		#region public abstract IDbConnection exposeConnection { get; }
		/// <summary>
		/// DataBase Connection's access.
		/// <note type="caution">
		/// IMPORTANT! access should be made via exposeConnection instead
		/// </note>
		/// </summary>
		protected IDbConnection connection__ = null;

		/// <summary>
		/// Exposing real DataBase Connection as read only, should it be needed.
		/// </summary>
		public abstract IDbConnection exposeConnection { get; }
		#endregion
		#region public DBTransaction Transaction { get; }
		/// <summary>
		/// DataBase Connection's Transaction access.
		/// <note type="caution">
		/// IMPORTANT! access should be made via Transaction instead
		/// </note>
		/// </summary>
		protected DBTransaction transaction__;

		/// <summary>
		/// DataBase Connection's Transaction access.
		/// </summary>
		public DBTransaction Transaction {
			get {
				if (transaction__ == null) {
					// instantiating for the first time and
					// only because it became needed, otherwise
					// never instantiated...
					transaction__ = new DBTransaction(this);
				}
				return transaction__;
			}
		}
		#endregion
		public abstract DBUtils utils { get; }
		#endregion

		#region public static Methods...
		#endregion
		#region private Methods...
		#region protected void Log(...);
		protected void Log(
			string type_in, 
			string value_in
		) {
			Log(type_in, value_in, null);
		}

		protected void Log(
			string type_in, 
			string value_in, 
			IDbDataParameter[] dataParameters_in
		) {
			StringBuilder _parameters = new StringBuilder(string.Empty);
			if (dataParameters_in == null) {
			} else {
				_parameters.Append("(");
				for (int i = 0; i < dataParameters_in.Length; i++) {
					_parameters.Append(
						string.Format(
							"{0}:{1}{2}", 
							dataParameters_in[i].ParameterName, 
							(dataParameters_in[i].Value == null) ? 
								"null" : 
								dataParameters_in[i].Value.ToString(), 
							(i != (dataParameters_in.Length -1)) ? 
								", " : 
								string.Empty
						)
					);
				}
				_parameters.Append(")");
			}

			StreamWriter _writer = new StreamWriter(Logfile, true);
			_writer.WriteLine(string.Format(
				"{0} - {1}: {2}{3}", 
				DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), 
				type_in, 
				value_in, 
				_parameters.ToString()
			));
			_writer.Close(); //_writer.Dispose();
		}
		#endregion

		protected abstract IDbCommand newDBCommand(
			string command_in, 
			IDbConnection connection_in
		);
		protected abstract IDbDataAdapter newDBDataAdapter(
			string query_in, 
			IDbConnection connection_in, 
			bool isQuery_notProcedure_in
		);
		#endregion
		//#region public Methods...
		#region public void Open();
		/// <summary>
		/// Opens DataBase Connection.
		/// </summary>
		/// <exception cref="OpenException_alreadyOpened">
		/// Thrown when the Connection is already opened
		/// </exception>
		/// <remarks>
		/// There is no need to Open a Connection in order to execute an SQL Query or Function. Open and Close methods are usually used when working with the Transaction
		/// </remarks>
		public void Open() {
#if !DEBUG
// ToDos: here!
			lock (isopen_) {
#endif
				if ((bool)isopen_) {
					throw OpenException_alreadyOpened;
				} else {
#if !DEBUG
// ToDos: here!
					lock (exposeConnection) {
#endif
						exposeConnection.Open();

						isopen_ = true;
#if !DEBUG
// ToDos: here!
					}
#endif
				}
#if !DEBUG
// ToDos: here!
			}
#endif
		}
		#endregion
		#region public void Close();
		/// <summary>
		/// Closes DataBase Connection.
		/// </summary>
		/// <exception cref="CloseException_alreadyClosed">
		/// Thrown when the Connection is already closed
		/// </exception>
		/// <exception cref="CloseException_unterminatedTransaction">
		/// Thrown when the Connection has an unterminated Transaction initiated
		/// </exception>
		public void Close() {
#if !DEBUG
// ToDos: here!
			lock (isopen_) {
#endif
				if (!(bool)isopen_) {
					throw CloseException_alreadyClosed;
				} else if ((transaction__ != null) && transaction__.inTransaction) {
					throw CloseException_unterminatedTransaction;
				} else {
#if !DEBUG
// ToDos: here!
					lock (exposeConnection) {
#endif
						exposeConnection.Close();

						isopen_ = false;
#if !DEBUG
// ToDos: here!
					}
#endif
				}
#if !DEBUG
// ToDos: here!
			}
#endif
		}
		#endregion
		//---
		#region public abstract IDbDataParameter newDBDataParameter(...);
		/// <summary>
		/// Instantiates a new IDbDataParameter for the Connection's taking in consideration the appropriate DataBase Server Type.
		/// </summary>
		/// <param name="name_in">Parameter's Name</param>
		/// <param name="dbType_in">Parameter's DbType</param>
		/// <param name="parameterDirection_in">Parameter's Direction</param>
		/// <param name="value_in">Parameter's Value</param>
		/// <returns>new IDbDataParameter</returns>
		public IDbDataParameter newDBDataParameter(
			string name_in, 
			DbType dbType_in, 
			ParameterDirection parameterDirection_in, 
			object value_in
		) {
			return newDBDataParameter(
				name_in,
				dbType_in,
				parameterDirection_in,
				value_in,
				0, 
				(byte)0, 
				(byte)0
			);
		}

		/// <summary>
		/// Instantiates a new IDbDataParameter for the Connection's taking in consideration the appropriate DataBase Server Type.
		/// </summary>
		/// <param name="name_in">Parameter's Name</param>
		/// <param name="dbType_in">Parameter's DbType</param>
		/// <param name="parameterDirection_in">Parameter's Direction</param>
		/// <param name="value_in">Parameter's Value</param>
		/// <param name="size_in">Parameter's Size (the actual DataBase Parameter Size representation, if such exists for the Parameter)</param>
		/// <returns>new IDbDataParameter</returns>
		public IDbDataParameter newDBDataParameter(
			string name_in, 
			DbType dbType_in, 
			ParameterDirection parameterDirection_in, 
			object value_in, 
			int size_in
		) {
			return newDBDataParameter(
				name_in, 
				dbType_in, 
				parameterDirection_in, 
				value_in, 
				size_in, 
				(byte)0, 
				(byte)0
			);
		}

		/// <summary>
		/// Instantiates a new IDbDataParameter for the Connection's taking in consideration the appropriate DataBase Server Type.
		/// </summary>
		/// <param name="name_in">Parameter's Name</param>
		/// <param name="dbType_in">Parameter's DbType</param>
		/// <param name="parameterDirection_in">Parameter's Direction</param>
		/// <param name="value_in">Parameter's Value</param>
		/// <param name="size_in">Parameter's Size (the actual DataBase Parameter Size representation, if such exists for the Parameter)</param>
		/// <param name="precision_in">Parameter's Precision</param>
		/// <param name="scale_in">Parameter's Scale</param>
		/// <returns>new IDbDataParameter</returns>
		public abstract IDbDataParameter newDBDataParameter(
			string name_in, 
			DbType dbType_in, 
			ParameterDirection parameterDirection_in, 
			object value_in, 
			int size_in, 
			byte precision_in, 
			byte scale_in
		);
		#endregion
		//---
		#region public void Execute_SQLQuery(...);
		#region private void Execute_SQLQuery(...);
		private void Execute_SQLQuery(string query_in, IDbCommand command_in) {
			if (Logenabled) {
				Log("sql query", query_in);
			}

			command_in.CommandType = CommandType.Text;
			try {
				command_in.ExecuteNonQuery();
			} catch (Exception e) {
				#region throw new Exception("...");
				throw new Exception(
					string.Format(
						"--- query:\n{0}\n\n--- ConnectionString:\n{1}\n\n--- exception:\n{2}\n",
						query_in,
						connectionstring_, 
						e.ToString()
					)
				);
				#endregion
			}
		}
		#endregion

		#region public void Execute_SQLQuery(string query_in);
		/// <summary>
		/// Executes an SQL Query on DataBase.
		/// </summary>
		/// <param name="query_in">SQL Query</param>
		/// <exception cref="InvalidSQLQueryException_empty">
		/// Thrown when an empty SQL Query has been supplied
		/// </exception>
		public void Execute_SQLQuery(string query_in) {
			#region Checking...
			if (
				(query_in == null)
				||
				(query_in.Trim() == string.Empty)
			)
				throw InvalidSQLQueryException_empty;
			#endregion

#if !DEBUG
// ToDos: here!
			lock (connection__) {
				lock (isopen_) {
#endif
					if ((bool)isopen_) {
						#region Using Opened Connection...
						IDbCommand _command = newDBCommand(
							query_in, 
							exposeConnection
						);
						Execute_SQLQuery(query_in, _command);
						_command.Dispose(); _command = null;
						#endregion
					} else {
						#region Opening, Using and Closing Connection...
						exposeConnection.Open();

						IDbCommand _command = newDBCommand(
							query_in, 
							exposeConnection
						);
						Execute_SQLQuery(query_in, _command);
						_command.Dispose(); _command = null;

						exposeConnection.Close();
						#endregion
					}
#if !DEBUG
// ToDos: here!
				}
			}
#endif
		}
		#endregion
		#endregion
		#region public DataSet Execute_SQLQuery_returnDataSet(...);
		#region private DataSet Execute_SQLQuery_returnDataSet(...);
		private DataSet Execute_SQLQuery_returnDataSet(string query_in, IDbConnection connection_in) {
			DataSet Execute_SQLQuery_returnDataSet_out;

			if (Logenabled) {
				Log("sql query", query_in);
			}

			IDbDataAdapter _dataadapter  = newDBDataAdapter(
				query_in, 
				connection_in, 
				true
			);
			try {
				Execute_SQLQuery_returnDataSet_out = new DataSet();
				_dataadapter.Fill(Execute_SQLQuery_returnDataSet_out);
			} catch (Exception e) {
				#region throw new Exception("...");
				throw new Exception(
					string.Format(
						"query: {0}\nConnectionString: {1}\nexception: {2}\n",
						query_in,
						connectionstring_, 
						e.ToString()
					)
				);
				#endregion
			}
			//_dataadapter.Dispose(); // not implemented in IDbDataAdapter
			_dataadapter = null;

			return Execute_SQLQuery_returnDataSet_out;
		}
		#endregion

		#region public DataSet Execute_SQLQuery_returnDataSet(string query_in);
		/// <summary>
		/// Executes an SQL Query on DataBase.
		/// </summary>
		/// <exception cref="InvalidSQLQueryException_empty">
		/// Thrown when an empty SQL Query has been supplied
		/// </exception>
		/// <param name="query_in">SQL Query</param>
		/// <returns>populated DataSet with SQL Query's Output</returns>
		public DataSet Execute_SQLQuery_returnDataSet(string query_in) {
			DataSet Execute_SQLQuery_returnDataSet_out;

			#region Checking...
			if (
				(query_in == null)
				||
				(query_in.Trim() == string.Empty)
			)
				throw InvalidSQLQueryException_empty;
			#endregion

#if !DEBUG
// ToDos: here!
			lock (connection__) {
				lock (isopen_) {
#endif
					if ((bool)isopen_) {
						#region Using Opened Connection...
						Execute_SQLQuery_returnDataSet_out
							= Execute_SQLQuery_returnDataSet(
								query_in,
								exposeConnection
							);
						#endregion
					} else {
						#region Opening, Using and Closing Connection...
						exposeConnection.Open();

						Execute_SQLQuery_returnDataSet_out
							= Execute_SQLQuery_returnDataSet(
								query_in,
								exposeConnection
							);

						exposeConnection.Close();
						#endregion
					}
#if !DEBUG
// ToDos: here!
				}
			}
#endif

			return Execute_SQLQuery_returnDataSet_out;
		}
		#endregion
		#endregion
		#region public DataTable Execute_SQLQuery_returnDataTable(...);
		/// <summary>
		/// Executes an SQL Query on DataBase.
		/// </summary>
		/// <param name="query_in">SQL Query</param>
		/// <returns>populated DataTable with SQL Query's Output</returns>
		public DataTable Execute_SQLQuery_returnDataTable(string query_in) {
			DataTable Execute_SQLQuery_returnDataTable_out;

			#region Execute_SQLQuery_returnDataTable_out = Execute_SQLQuery_returnDataSet(query_in).Tables[0];
			DataSet _dataset = Execute_SQLQuery_returnDataSet(query_in);
			Execute_SQLQuery_returnDataTable_out = _dataset.Tables[0];
			_dataset.Dispose(); _dataset = null;
			#endregion

			return Execute_SQLQuery_returnDataTable_out;
		}
		#endregion
		//---
		#region public object Execute_SQLFunction(...);
		#region protected abstract object Execute_SQLFunction(...);
		protected abstract object Execute_SQLFunction(
			string function_in,
			IDbDataParameter[] dataParameters_in,
			IDbCommand command_in,
			DbType returnValue_DbType_in,
			int returnValue_Size_in
		);
		#endregion
		#region public object Execute_SQLFunction(string function_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <returns>populated Object with SQL Function's Output</returns>
		public object Execute_SQLFunction(string function_in) {
			return Execute_SQLFunction(
				function_in, 
				new IDbDataParameter[] { }, 
				DbType.Boolean, 
				-1
			);
		}
		#endregion
		#region public object Execute_SQLFunction(string function_in, DbType returnValue_DbType_in, int returnValue_Size_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <param name="returnValue_DbType_in">DbType for return value</param>
		/// <param name="returnValue_Size_in">Size for return value (the actual DataBase return value Size representation, if such exists)</param>
		/// <returns>populated Object with SQL Function's Output</returns>
		public object Execute_SQLFunction(
			string function_in, 
			DbType returnValue_DbType_in, 
			int returnValue_Size_in
		) {
			return Execute_SQLFunction(
				function_in, 
				new IDbDataParameter[] { }, 
				returnValue_DbType_in, 
				returnValue_Size_in
			);
		}
		#endregion
		#region public object Execute_SQLFunction(string function_in, IDbDataParameter[] dataParameters_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <param name="dataParameters_in">SQL Function parameters</param>
		/// <returns>populated Object with SQL Function's Output</returns>
		public object Execute_SQLFunction(
			string function_in, 
			IDbDataParameter[] dataParameters_in
		) {
			return Execute_SQLFunction(
				function_in, 
				dataParameters_in, 
				DbType.Boolean, 
				-1
			);
		}
		#endregion
		#region public object Execute_SQLFunction(string function_in, IDbDataParameter[] dataParameters_in, DbType returnValue_DbType_in, int returnValue_Size_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <param name="dataParameters_in">SQL Function parameters</param>
		/// <param name="returnValue_DbType_in">DbType for return value</param>
		/// <param name="returnValue_Size_in">Size for return value (the actual DataBase return value Size representation, if such exists)</param>
		/// <returns>populated Object with SQL Function's Output</returns>
		public object Execute_SQLFunction(
			string function_in,
			IDbDataParameter[] dataParameters_in,
			DbType returnValue_DbType_in,
			int returnValue_Size_in
		) {
			object Execute_SQLFunction_out;

#if !DEBUG
// ToDos: here!
			lock (connection__) {
				lock (isopen_) {
#endif
					if ((bool)isopen_) {
						#region Using Opened Connection...
						IDbCommand _command = newDBCommand(
							function_in,
							(IDbConnection)exposeConnection
						);
						if ((transaction__ != null) && transaction__.inTransaction) {
							_command.Transaction = transaction__.exposeTransaction;
						}
						Execute_SQLFunction_out
							= Execute_SQLFunction(
								function_in,
								dataParameters_in,
								_command,
								returnValue_DbType_in,
								returnValue_Size_in
							);
						_command.Dispose(); _command = null;
						#endregion
					} else {
						#region Opening, Using and Closing Connection...
						IDbCommand _command = newDBCommand(
							function_in,
							exposeConnection
						);

						exposeConnection.Open();
						Execute_SQLFunction_out = Execute_SQLFunction(
							function_in,
							dataParameters_in,
							_command,
							returnValue_DbType_in,
							returnValue_Size_in
						);
						exposeConnection.Close();

						_command.Dispose(); _command = null;
						#endregion
					}
#if !DEBUG
// ToDos: here!
				}
			}
#endif
			return Execute_SQLFunction_out;
		}
		#endregion
		#endregion
		#region public DataSet Execute_SQLFunction_returnDataSet(...);
		#region private DataSet Execute_SQLFunction_returnDataSet(...);
		private DataSet Execute_SQLFunction_returnDataSet(string function_in, IDbDataParameter[] dataParameters_in, IDbConnection connection_in) {
			if (Logenabled) {
				Log("sql function", function_in, dataParameters_in);
			}

			DataSet Execute_SQLFunction_returnDataSet_out;

			IDbDataAdapter _dataadapter = newDBDataAdapter(
				function_in,
				connection_in,
				false
			);
			_dataadapter.SelectCommand.CommandType = CommandType.StoredProcedure;
			#region _dataadapter.SelectCommand.Parameters = dataParameters_in;
			for (int i = 0; i < dataParameters_in.Length; i++)
				_dataadapter.SelectCommand.Parameters.Add(dataParameters_in[i]);
			#endregion
			try {
				Execute_SQLFunction_returnDataSet_out = new DataSet();
				_dataadapter.Fill(Execute_SQLFunction_returnDataSet_out);
			} catch (Exception e) {
				throw new Exception(
					string.Format(
						"Stored Procedure: {0}\nParameters: {1}\nConnectionString: {2}\nexception: {3}\n",
						function_in,
						dataParameters_in,
						connectionstring_,
						e.ToString()
					)
				);
			}

			//_dataadapter.Dispose(); // not implemented in IDbDataAdapter
			_dataadapter = null;

			return Execute_SQLFunction_returnDataSet_out;
		}
		#endregion
		#region public DataSet Execute_SQLFunction_returnDataSet(string function_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <returns>populated DataSet with SQL Function's Output</returns>
		public DataSet Execute_SQLFunction_returnDataSet(string function_in) {
			return Execute_SQLFunction_returnDataSet(
				function_in, 
				new IDbDataParameter[] { }
			);
		}
		#endregion
		#region public DataSet Execute_SQLFunction_returnDataSet(string function_in, IDbDataParameter[] dataParameters_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <param name="dataParameters_in">SQL Function parameters</param>
		/// <returns>populated DataSet with SQL Function's Output</returns>
		public DataSet Execute_SQLFunction_returnDataSet(
			string function_in, 
			IDbDataParameter[] dataParameters_in
		) {
			DataSet Execute_SQLFunction_returnDataSet_out;

#if !DEBUG
// ToDos: here!
			lock (connection__) {
				lock (isopen_) {
#endif
					if ((bool)isopen_) {
						#region Using Opened Connection...
						Execute_SQLFunction_returnDataSet_out
							= Execute_SQLFunction_returnDataSet(
								function_in,
								dataParameters_in,
								exposeConnection
							);
						#endregion
					} else {
						#region Opening, Using and Closing Connection...
						exposeConnection.Open();

						Execute_SQLFunction_returnDataSet_out
							= Execute_SQLFunction_returnDataSet(
								function_in,
								dataParameters_in,
								exposeConnection
							);

						exposeConnection.Close();
						#endregion
					}
#if !DEBUG
// ToDos: here!
				}
			}
#endif

			return Execute_SQLFunction_returnDataSet_out;
		}
		#endregion
		#endregion
		#region public DataTable Execute_SQLFunction_returnDataTable(...);
		#region public DataTable Execute_SQLFunction_returnDataTable(string function_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <returns>populated DataTable with SQL Function's Output</returns>
		public DataTable Execute_SQLFunction_returnDataTable(string function_in) {
			return Execute_SQLFunction_returnDataTable(
				function_in, 
				new IDbDataParameter[] { }
			);
		}
		#endregion
		#region public DataTable Execute_SQLFunction_returnDataTable(string function_in, IDbDataParameter[] dataParameters_in);
		/// <summary>
		/// Executes an SQL Function on DataBase.
		/// </summary>
		/// <param name="function_in">SQL Function name</param>
		/// <param name="dataParameters_in">SQL Function parameters</param>
		/// <returns>populated DataTable with SQL Function's Output</returns>
		public DataTable Execute_SQLFunction_returnDataTable(
			string function_in, 
			IDbDataParameter[] dataParameters_in
		) {
			DataTable Execute_SQLFunction_returnDataTable_out;

			#region Execute_SQLFunction_returnDataTable_out = Execute_SQLFunction_returnDataSet(function_in, dataParameters_in).Tables[0];
			DataSet _dataset =
				Execute_SQLFunction_returnDataSet(
					function_in,
					dataParameters_in
				);
			Execute_SQLFunction_returnDataTable_out = _dataset.Tables[0];
			_dataset.Dispose(); _dataset = null;
			#endregion

			return Execute_SQLFunction_returnDataTable_out;
		}
		#endregion
		#endregion
		//---
		#region public bool SQLFunction_exists(...);
		public abstract string SQLFunction_exists_query(string name_in);

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to determine if an SQL Function exists on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL Function Name</param>
		/// <returns>True if SQL Function exists, False if not</returns>
		public bool SQLFunction_exists(string name_in) {
			return (Execute_SQLQuery_returnDataTable(
				SQLFunction_exists_query(name_in)
			).Rows.Count == 1);
		}
		#endregion
		#region public bool SQLFunction_delete(...);
		public abstract string SQLFunction_delete_query(string name_in);

		/// <summary>
		/// Deletes a specific SQL Function on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL Function Name</param>
		/// <returns>True if SQL Function existed and was deleted, False if not</returns>
		public bool SQLFunction_delete(string name_in) {
			if (SQLFunction_exists(name_in)) {
				Execute_SQLQuery(SQLFunction_delete_query(name_in));
				return true;
			} else {
				return false;
			}
		}
		#endregion
		#region public bool SQLStoredProcedure_exists(...);
		public abstract string SQLStoredProcedure_exists_query(string name_in);

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to determine if an SQL Stored Procedure exists on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL Stored Procedure Name</param>
		/// <returns>True if SQL Stored Procedure exists, False if not</returns>
		public bool SQLStoredProcedure_exists(string name_in) {
			return (Execute_SQLQuery_returnDataTable(
				SQLStoredProcedure_exists_query(name_in)
			).Rows.Count == 1);
		}
		#endregion
		#region public bool SQLStoredProcedure_delete(...);
		public abstract string SQLStoredProcedure_delete_query(string name_in);

		/// <summary>
		/// Deletes a specific SQL Stored Procedure on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL Stored Procedure Name</param>
		/// <returns>True if SQL Stored Procedure existed and was deleted, False if not</returns>
		public bool SQLStoredProcedure_delete(string name_in) {
			if (SQLStoredProcedure_exists(name_in)) {
				Execute_SQLQuery(SQLStoredProcedure_delete_query(name_in));
				return true;
			} else {
				return false;
			}
		}
		#endregion
		#region public bool SQLView_exists(...);
		public abstract string SQLView_exists_query(string name_in);

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to determine if an SQL View exists on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL View Name</param>
		/// <returns>True if SQL View exists, False if not</returns>
		public bool SQLView_exists(string name_in) {
			return (Execute_SQLQuery_returnDataTable(
				SQLView_exists_query(name_in)
			).Rows.Count == 1);
		}
		#endregion
		#region public bool SQLView_delete(...);
		public abstract string SQLView_delete_query(string name_in);

		/// <summary>
		/// Deletes a specific SQL View on DataBase, based on it's name.
		/// </summary>
		/// <param name="name_in">SQL View Name</param>
		/// <returns>True if SQL View existed and was deleted, False if not</returns>
		public bool SQLView_delete(string name_in) {
			if (SQLView_exists(name_in)) {
				Execute_SQLQuery(SQLView_delete_query(name_in));
				return true;
			} else {
				return false;
			}
		}
		#endregion
		//---
		#region public string[] getBDs(...);
		public abstract string getDBs_query();

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of available DataBase names.
		/// </summary>
		/// <returns>String array, representing a list of available DataBase names</returns>
		public string[] getDBs() {
			DataTable _datatable = Execute_SQLQuery_returnDataTable(getDBs_query());

			string[] _getdbs_out = new string[_datatable.Rows.Count];
			for (int i = 0; i < _datatable.Rows.Count; i++)
				_getdbs_out[i] = (string)_datatable.Rows[i][0];

			_datatable.Dispose(); _datatable = null;

			return _getdbs_out;
		}
		#endregion
		#region public cDBTable[] getTables(...);
		public abstract string getTables_query(string subAppName_in);

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of Table names for the current DataBase Connection.
		/// </summary>
		/// <returns>String array, representing a list of Table names</returns>
		public cDBTable[] getTables() {
			return getTables(string.Empty);
		}

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of Table names for the current DataBase Connection.
		/// </summary>
		/// <param name="subAppName_in">Table Filter. If your Application is to be hosted at some ASP, which provides you with one DataBase only, and you're using that DataBase for more than one Application. I assume you're using some convention for Table naming like: AP1_Table1, AP1_Table2, AP2_Table1, ... . Or even if you have several modules sharing same data base. If so, you can use this parameter to filter Table names for some specific Application, like: AP1 or AP2</param>
		/// <returns>String array, representing a list of Table names</returns>
		public cDBTable[] getTables(
			string subAppName_in
		) {
			return getTables(
				subAppName_in, 
				null
			);
		}

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of Table names for the current DataBase Connection.
		/// </summary>
		/// <param name="subAppName_in">Table Filter. If your Application is to be hosted at some ASP, which provides you with one DataBase only, and you're using that DataBase for more than one Application. I assume you're using some convention for Table naming like: AP1_Table1, AP1_Table2, AP2_Table1, ... . Or even if you have several modules sharing same data base. If so, you can use this parameter to filter Table names for some specific Application, like: AP1 or AP2</param>
		/// <returns>String array, representing a list of Table names</returns>
		public cDBTable[] getTables(
			string subAppName_in, 
			string sqlFuncion_in
		) {
			cDBTable[] getTables_out;

			#region DataTable _dtemp = base.Execute_SQLQuery_returnDataTable(gettables(subAppName_in));
			DataTable _dtemp;
			if (
				(sqlFuncion_in == null)
				||
				(sqlFuncion_in == string.Empty)
			) {
				_dtemp = Execute_SQLQuery_returnDataTable(
					getTables_query(subAppName_in)
				);
			} else {
				_dtemp = Execute_SQLFunction_returnDataTable(
					sqlFuncion_in,
					new IDbDataParameter[] {
						newDBDataParameter("subApp_", DbType.String, ParameterDirection.Input, subAppName_in, subAppName_in.Length)
					}
				);
			}
			#endregion
			getTables_out = new cDBTable[_dtemp.Rows.Count];
			for (int r = 0; r < _dtemp.Rows.Count; r++) {
				getTables_out[r] = new cDBTable(
					(string)_dtemp.Rows[r]["Name"],
// ToDos: here!
					//(dbservertype_ == DBServerTypes.MySQL) ? 
					//	((long)_dtemp.Rows[r]["isVT"] == 1L) : 
						((int)_dtemp.Rows[r]["isVT"] == 1)

					,
// ToDos: here!
string.Empty
				);
			}
			_dtemp.Dispose(); _dtemp = null;

			return getTables_out;
		}
		#endregion
		#region public cDBTableField[] getTableFields(...);
		public abstract string getTableFields_query(
			string tableName_in
		);

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of Field names for some specific Table.
		/// </summary>
		/// <param name="tableName_in">Table name for which Field names are to be retrieved</param>
		/// <returns>String array, representing a list of Field names</returns>
		public cDBTableField[] getTableFields(
			string tableName_in
		) {
			return getTableFields(
				tableName_in,
				null
			);
		}

		/// <summary>
		/// Makes use of the DataBase INFORMATION_SCHEMA to get a list of Field names for some specific Table.
		/// </summary>
		/// <param name="tableName_in">Table name for which Field names are to be retrieved</param>
		/// <returns>String array, representing a list of Field names</returns>
		public cDBTableField[] getTableFields(
			string tableName_in,
			string sqlFuncion_in
		) {
			cDBTableField[] getTableFields_out;

			#region DataTable _dtemp = ...;
			DataTable _dtemp;
			if (
				(sqlFuncion_in == null)
				||
				(sqlFuncion_in == string.Empty)
			) {
				_dtemp = Execute_SQLQuery_returnDataTable(
					getTableFields_query(tableName_in)
				);
			} else {
				_dtemp = Execute_SQLFunction_returnDataTable(
					sqlFuncion_in,
					new IDbDataParameter[] {
						newDBDataParameter("tableName_", DbType.String, ParameterDirection.Input, tableName_in, tableName_in.Length)
					}
				);
			}
			#endregion
			getTableFields_out = new cDBTableField[_dtemp.Rows.Count];
			for (int r = 0; r < _dtemp.Rows.Count; r++) {
				getTableFields_out[r] = new cDBTableField();

				getTableFields_out[r].Name = (string)_dtemp.Rows[r]["Name"];

// ToDos: here!
				//switch (dbservertype_) {
				//	case DBServerTypes.MySQL:
				//		getTableFields_out[r].Size = (_dtemp.Rows[r]["Size"] == DBNull.Value) ? 0 : (int)(long)_dtemp.Rows[r]["Size"];
				//		getTableFields_out[r].isNullable = ((long)_dtemp.Rows[r]["isNullable"] == 1L);
				//		//---						
				//		getTableFields_out[r].FK_TableName = (_dtemp.Rows[r]["FK_FieldName"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["FK_TableName"];
				//		getTableFields_out[r].FK_FieldName = (_dtemp.Rows[r]["FK_FieldName"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["FK_FieldName"];
				//		//---
				//		getTableFields_out[r].isIdentity = ((long)_dtemp.Rows[r]["isIdentity"] == 1L);
				//		getTableFields_out[r].isPK = ((long)_dtemp.Rows[r]["isPK"] == 1L);
				//		//---
				//		getTableFields_out[r].Numeric_Precision = (_dtemp.Rows[r]["Numeric_Precision"] == DBNull.Value) ? 0 : (int)(long)_dtemp.Rows[r]["Numeric_Precision"];
				//		getTableFields_out[r].Numeric_Scale = (_dtemp.Rows[r]["Numeric_Scale"] == DBNull.Value) ? 0 : (int)(long)_dtemp.Rows[r]["Numeric_Scale"];
				//		break;
				//
				//	case DBServerTypes.PostgreSQL:
				//	case DBServerTypes.SQLServer:
						getTableFields_out[r].Size = (_dtemp.Rows[r]["Size"] == DBNull.Value) ? 0 : (int)_dtemp.Rows[r]["Size"];
						getTableFields_out[r].isNullable = ((int)_dtemp.Rows[r]["isNullable"] == 1);
						//---						
						getTableFields_out[r].FK_TableName = (_dtemp.Rows[r]["FK_FieldName"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["FK_TableName"];
						getTableFields_out[r].FK_FieldName = (_dtemp.Rows[r]["FK_FieldName"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["FK_FieldName"];
						//---
						getTableFields_out[r].isIdentity = ((int)_dtemp.Rows[r]["isIdentity"] == 1);
						getTableFields_out[r].isPK = ((int)_dtemp.Rows[r]["isPK"] == 1);
						//---
// ToDos: here! SQLServer
//						getTableFields_out[r].Numeric_Precision = (_dtemp.Rows[r]["Numeric_Precision"] == DBNull.Value) ? 0 : (int)(byte)_dtemp.Rows[r]["Numeric_Precision"];
//						getTableFields_out[r].Numeric_Scale = (_dtemp.Rows[r]["Numeric_Scale"] == DBNull.Value) ? 0 : (int)_dtemp.Rows[r]["Numeric_Scale"];
// ToDos: here! PostgreSQL
						getTableFields_out[r].Numeric_Precision = (_dtemp.Rows[r]["Numeric_Precision"] == DBNull.Value) ? 0 : (int)_dtemp.Rows[r]["Numeric_Precision"];
						getTableFields_out[r].Numeric_Scale = (_dtemp.Rows[r]["Numeric_Scale"] == DBNull.Value) ? 0 : (int)_dtemp.Rows[r]["Numeric_Scale"];
				//		break;
				//}
				//---
				getTableFields_out[r].DBType_inDB_name = (string)_dtemp.Rows[r]["Type"];
				getTableFields_out[r].DBDefaultValue = (_dtemp.Rows[r]["COLUMN_DEFAULT"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["COLUMN_DEFAULT"];
				getTableFields_out[r].DBCollationName = (_dtemp.Rows[r]["COLLATION_NAME"] == DBNull.Value) ? "" : (string)_dtemp.Rows[r]["COLLATION_NAME"];
// ToDos: here!
getTableFields_out[r].DBDescription = string.Empty;
			}
			_dtemp.Dispose(); _dtemp = null;

			return getTableFields_out;
		}
		#endregion
		//#endregion
	}
}
