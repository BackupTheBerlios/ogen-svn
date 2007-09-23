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
using OGen.lib.datalayer;
using OGen.lib.datalayer.PostgreSQL;
using OGen.lib.datalayer.SQLServer;

namespace OGen.lib.datalayer {
	public class DBConnectionsupport {
		private DBConnectionsupport() {}

		#region public static cDBConnection CreateInstance();
		public static cDBConnection CreateInstance(
			eDBServerTypes dbServerType_in, 
			string connectionString_in
		) {
			return CreateInstance(
				dbServerType_in, 
				connectionString_in, 
				null
			);
		}
		public static cDBConnection CreateInstance(
			eDBServerTypes dbServerType_in, 
			string connectionString_in, 
			string logFile_in
		) {
			switch (dbServerType_in) {
#if PostgreSQL
				case eDBServerTypes.PostgreSQL:
					return new cDBConnection_PostgreSQL(
						connectionString_in, 
						logFile_in
					);
#endif
				case eDBServerTypes.SQLServer:
					return new cDBConnection_SQLServer(
						connectionString_in, 
						logFile_in
					);
#if MySQL
				case eDBServerTypes.MySQL:
					return new cDBConnection_MySQL(
						connectionString_in, 
						logFile_in
					);
#endif
			}
			
			throw new Exception(
				string.Format(
					"unsuported db type: {0}", 
					dbServerType_in.ToString()
				)
			);
		}
		#endregion
		#region public static eDBServerTypes GetDBServerType(...);
		public static eDBServerTypes GetDBServerType(
			cDBConnection connection_in
		) {
#if PostgreSQL
			if (connection_in is cDBConnection_PostgreSQL) {
				return eDBServerTypes.PostgreSQL;
			}
			else
#endif
			if (connection_in is cDBConnection_SQLServer) {
				return eDBServerTypes.SQLServer;
			}
#if MySQL
			else
			if (connection_in is cDBConnection_MySQL) {
				return eDBServerTypes.MySQL;
			}
#endif
			
			throw new Exception(
				string.Format(
					"unsuported db type: {0}", 
					connection_in.ToString()
				)
			);
		}
		#endregion
	}
}
