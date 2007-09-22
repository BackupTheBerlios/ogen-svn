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

namespace OGen.lib.datalayer.PostgreSQL {
	public sealed class cDBUtils_PostgreSQL : DBUtils {
		#region public override DBUtils_convert convert { get; }
		private static DBUtils_convert_Postgresql convert__;

		public override DBUtils_convert convert {
			get {
				if (convert__ == null) {
					convert__ = new DBUtils_convert_Postgresql();
				}

				return convert__;
			}
		}
		#endregion
	}
	public sealed class DBUtils_convert_Postgresql : DBUtils_convert {
		#region public override string object2SQLobject(...);
		public override string object2SQLobject(
			object object_in
		) {
			if (object_in == null) {
				return "null";
			} else {
				switch (object_in.GetType().ToString()) {
					case "System.Char":
					case "System.String":
						// ToDos: here! check if changes made are correct (I need test units for this)
						//return string.Format("''{0}''", object_in.ToString ().Replace("'", "''"));
						//return string.Format("'{0}'", object_in.ToString ().Replace("'", "''"));
						break;

					case "System.DateTime":
						DateTime _datetime = ((DateTime)object_in);
						if (DateTime.Compare(_datetime, DateTime.MinValue) == 0) {
							return object2SQLobject(null);
						} else {
							// ToDos: here! check if changes made are correct (I need test units for this)
							// return string.Format("timestamp ''{0}''", _datetime.ToString("yyyy-MM-dd HH:mm:ss"));
							return string.Format("timestamp '{0}'", _datetime.ToString("yyyy-MM-dd HH:mm:ss"));
						}

					case "System.Boolean":
						return (((bool)object_in) ? "true" : "false");

					case "System.Int16":
					case "System.Int32":
					case "System.Int64":
					case "System.Double":
					case "System.Decimal":
					case "System.Single":
						// ToDos: here!
						//case eDBServerTypes.PostgreSQL: {
						//	return object_in.ToString().Replace(",", ".");
						//}
						break;

					case "System.DBNull":
						return object2SQLobject(null);
				}
			}

			throw new Exception (string.Format(
				"not implemented for: {0}",
				object_in.GetType().ToString()
			));
		}
		#endregion
	}
}
