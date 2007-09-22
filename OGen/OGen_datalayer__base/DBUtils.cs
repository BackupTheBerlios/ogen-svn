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

namespace OGen.lib.datalayer {
	public abstract class DBUtils {
		public abstract DBUtils_convert convert { get; }
	}
	public abstract class DBUtils_convert {
		/// <summary>
		/// Converts any .net framework object value to a string that can be used to buil an SQL Query.
		/// </summary>
		/// <param name="object_in">.net framework object value to be converted</param>
		/// <returns>a string that can be used to buil an SQL Query</returns>
		public abstract string object2SQLobject(
			object object_in
		);

		// ToDos: here! have a look at: sSqlDbType.cs
		#region public string DbType2NSysType(...) {
		// <summary>
		// Aimed for code generator, hence returning straight string.
		// NSysType - .Net System Type
		// </summary>
		/// <param name="dbType_in"></param>
		/// <returns></returns>
		public string DbType2NSysType(DbType dbType_in) {
			switch (dbType_in) {
				case DbType.Boolean:
					return "bool"; //typeof(bool).Name;

				case DbType.Int16:
					return typeof(Int16).Name;

				case DbType.Int32:
					return "int"; //typeof(int).Name;

				case DbType.Int64:
					return "long"; //typeof(long).Name;

				case DbType.UInt16:
					return typeof(UInt16).Name;

				case DbType.UInt32:
					return typeof(UInt32).Name;

				case DbType.UInt64:
					return typeof(UInt64).Name;

				case DbType.String:
					return "string"; //typeof(string).Name;

				case DbType.DateTime:
				case DbType.Date:
				case DbType.Time:
					return typeof(DateTime).Name;

				case DbType.Guid:
					return typeof(Guid).Name;

				case DbType.Byte:
					return typeof(Byte).Name;

				case DbType.Object:
					return typeof(Object).Name;

				case DbType.Single:
					// ToDos: here! check if appropriate...
					return typeof(Single).Name;

				case DbType.Binary:
					// ToDos: here! check if appropriate...
					return typeof(Byte[]).Name;

				case DbType.Decimal:
					// ToDos: here! check if appropriate...
					return typeof(Decimal).Name;

				case DbType.Double:
					// ToDos: here! check if appropriate...
					return typeof(Double).Name;

				case DbType.AnsiString:
				case DbType.AnsiStringFixedLength:
				case DbType.Currency:
				case DbType.SByte:
				case DbType.StringFixedLength:
				case DbType.VarNumeric:
					// ToDos: here!
					break;

				default: {
					break;
				}
			}

			throw new Exception(string.Format(
				"undefined variable type: {0}",
				dbType_in.GetType().ToString()
			));
		}
		#endregion
		#region public string DBType2NSysEmptyValue(...);
		// <summary>
		// Aimed for code generator, hence returning straight string.
		// .Net System (default/) Empty Value
		// </summary>
		public string DBType2NSysEmptyValue(DbType dbType_in) {
			switch (dbType_in) {
				case DbType.DateTime:
				case DbType.Date:
				case DbType.Time:
					// .net fw minimum value for datetime is undetermined
					// in db, hence a specific one:
					return "new DateTime(1900, 1, 1)"; // "DateTime.MinValue";

				case DbType.Int16: 
				case DbType.Int32: 
				case DbType.UInt16: 
				case DbType.UInt32: 
				case DbType.Byte: 
				case DbType.Single:
					return "0";

				case DbType.Double:
					return "0D";

				case DbType.Decimal:
					return "0M";

				case DbType.Int64:
				case DbType.UInt64:
					return "0L";

				case DbType.Boolean:
					return "false";

				case DbType.String:
					return "string.Empty";

				case DbType.Guid:
					return "Guid.Empty";

				case DbType.Binary:
					return "null";

				// ToDos: here!
			}

			throw new Exception(string.Format(
				"undefined variable type: {0}",
				dbType_in.ToString()
			));
		}
		#endregion
		#region public string DBType2NUnitTestValue(...);
		// <summary>
		// Aimed for NUnit testing.
		// </summary>
		public string DBType2NUnitTestValue(DbType dbType_in) {
			switch (dbType_in) {
				case DbType.DateTime:
				case DbType.Date:
				case DbType.Time:
					// sql server friendly
					return "new DateTime(2341, 12, 12)";

				case DbType.Int64:
				case DbType.UInt64:
					return "123L";

				case DbType.Int16: 
				case DbType.Int32: 
				case DbType.UInt16: 
				case DbType.UInt32: 
				case DbType.Byte: 
				case DbType.Single: 
				case DbType.Double: 
				case DbType.Decimal:
					return "123";

				case DbType.Boolean:
					return "true";

				case DbType.String:
					return "\"123\"";

				case DbType.Guid:
					return "Guid.NewGuid()";

				case DbType.Binary:
					return "new Byte[] { 1, 2, 3 }";

// ToDos: here! check if appropriate...
//case DbType.Single:
//return "0F";

				// ToDos: here!
			}

			throw new Exception(string.Format(
				"undefined variable type: {0}",
				dbType_in.GetType().ToString()
			));
		}
		#endregion
		#region public string DBType2DBEmptyValue(...);
		// <summary>
		// Aimed for code generator, hence returning straight string.
		// </summary>
		public string DBType2DBEmptyValue(DbType dbType_in) {
			switch (dbType_in) {
				case DbType.DateTime:
				case DbType.Date:
				case DbType.Time:
					return object2SQLobject(
						new DateTime(1900, 1, 1)
					);

				case DbType.Int16: 
				case DbType.Int32: 
				case DbType.Int64:
				case DbType.UInt16: 
				case DbType.UInt32: 
				case DbType.UInt64:
				case DbType.Byte: 
				case DbType.Single: 
				case DbType.Double: 
				case DbType.Decimal:
				case DbType.Boolean:
					return "0";

				case DbType.String:
					return "''";

				case DbType.Binary:
					return "new Byte[] {}";

				// ToDos: here!
			}
			throw new Exception(string.Format(
				"undefined variable type: {0}",
				dbType_in.ToString() // dbType_in.GetType().ToString()
			));
		}
		#endregion

		#region public DbType DbType_Parse(string value_in);
		public DbType DbType_Parse(string value_in) {
			return DbType_Parse(value_in, true);
		}
		public DbType DbType_Parse(string value_in, bool caseSensitive_in) {
			string _value = (caseSensitive_in) ? value_in : value_in.ToLower();
			for (int i = 0; ((DbType)i).ToString() != i.ToString(); i++) {
				if (
					(
						caseSensitive_in
						&&
						(((DbType)i).ToString() == _value)
					)
					||
					(
						!caseSensitive_in
						&&
						(((DbType)i).ToString().ToLower() == _value)
					)
				) {
					return (DbType)i;
				}
			}
			throw new Exception(string.Format("invalid db type: {0}", value_in));
		}
		#endregion
	}
}
