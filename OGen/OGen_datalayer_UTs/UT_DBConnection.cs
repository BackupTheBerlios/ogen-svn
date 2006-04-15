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
using System.Collections;
using NUnit.Framework;

using OGen.lib.datalayer;

namespace OGen.lib.datalayer.UTs {
	[TestFixture]
	public class UT_DBConnection { public UT_DBConnection() {}
		private cDBConnection[] dbconnections_;
		private string dbname_ = System.Configuration.ConfigurationSettings.AppSettings["DBName"];

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			eDBServerTypes _dbtype;

			string[] _dbtypes = OGen.lib.datalayer.utils.DBServerTypes.Names_supportedForGeneration();
			dbconnections_ = new cDBConnection[_dbtypes.Length];
			for (int d = 0; d < _dbtypes.Length; d++) {
				_dbtype 
					= OGen.lib.datalayer.utils.DBServerTypes.convert.FromName(_dbtypes[d]);

				dbconnections_[d] = new cDBConnection(
					_dbtype,
					System.Configuration.ConfigurationSettings.AppSettings[
						string.Format("DBConnectionstring-{0}", _dbtypes[d])
					]
				);
			}

		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
			for (int d = 0; d < dbconnections_.Length; d++) {
				dbconnections_[d].Dispose();
				dbconnections_[d] = null;
			}
		}
		#endregion

		#region public void UT_getBDs();
		[Test]
		public void UT_getBDs() {
			string[] _dbs;
			bool _found;

			for (int c = 0; c < dbconnections_.Length; c++) {
				_dbs = dbconnections_[c].getBDs();
				_found = false;
				for (int d = 0; d < _dbs.Length; d++) {
					if (_dbs[d] == dbname_) {
						_found = true;
						break;
					}
				}
				Assert.IsTrue(_found, "can't find db name: {0}", dbname_);
			}
		}
		#endregion
		#region public void UT_getTables_getFields_andCheckMostThings();
		[Test]
		public void UT_getTables_getFields_andCheckMostThings() {
			cDBTable[] _tables;
			cDBTableField[] _fields;
			int _tablesnum;
			int _fieldsnum;

			for (int c = 0; c < dbconnections_.Length; c++) {
				#region dbconnections_[c].getTables("User%");
				_tables = dbconnections_[c].getTables("User");
				_tablesnum = 0;
				for (int t = 0; t < _tables.Length; t++) {
					switch (_tables[t].Name) {
						case "User": {
								_tablesnum++;
								break;
							}
						case "UserGroup": {
								_tablesnum++;
								break;
							}
						default: {
								break;
							}
					}
				}
				Assert.AreEqual(2, _tablesnum, "2 tables expected, could only find {0}", _tablesnum);
				#endregion
				#region dbconnections_[c].getTables();
				_tables = dbconnections_[c].getTables();
				_tablesnum = 0;
				for (int t = 0; t < _tables.Length; t++) {
					switch (_tables[t].Name) {
						#region case "Config": { _tablesnum++; break; }
						case "Config": {
							_tablesnum++;

							_fields = dbconnections_[c].getTableFields(_tables[t].Name);
							_fieldsnum = 0;
							for (int f = 0; f < _fields.Length; f++) {
								switch (_fields[f].Name) {
									#region case "Name": { _fieldsnum++; break; }
									case "Name": {
										_fieldsnum++;

										Assert.IsTrue(
											_fields[f].isPK, 
											"PK expected for table field: {0}.{1}", 
											_tables[t].Name, 
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Config": { _fieldsnum++; break; }
									case "Config": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Type": { _fieldsnum++; break; }
									case "Type": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
								}
							}
							Assert.AreEqual(3, _fieldsnum, "3 fields expected at table: '{0}', only {1} were found", _tables[t].Name, _fieldsnum);
							break;
						}
						#endregion
						#region case "Group": { _tablesnum++; break; }
						case "Group": {
							_tablesnum++;

							_fields = dbconnections_[c].getTableFields(_tables[t].Name);
							_fieldsnum = 0;
							for (int f = 0; f < _fields.Length; f++) {
								switch (_fields[f].Name) {
									#region case "IDGroup": { _fieldsnum++; break; }
									case "IDGroup": {
										_fieldsnum++;

										Assert.IsTrue(
											_fields[f].isPK && _fields[f].isIdentity, 
											"PK and Identity expected for table field: {0}.{1}", 
											_tables[t].Name, 
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Name": { _fieldsnum++; break; }
									case "Name": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK && !_fields[f].isIdentity,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
								}
							}
							Assert.AreEqual(2, _fieldsnum, "2 fields expected at table: '{0}', only {1} were found", _tables[t].Name, _fieldsnum);
							break;
						}
						#endregion
						#region case "User": { _tablesnum++; break; }
						case "User": {
							_tablesnum++;

							_fields = dbconnections_[c].getTableFields(_tables[t].Name);
							_fieldsnum = 0;
							for (int f = 0; f < _fields.Length; f++) {
								switch (_fields[f].Name) {
									#region case "IDUser": { _fieldsnum++; break; }
									case "IDUser": {
										_fieldsnum++;

										Assert.IsTrue(
											_fields[f].isPK && _fields[f].isIdentity, 
											"PK and Identity expected for table field: {0}.{1}", 
											_tables[t].Name, 
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Login": { _fieldsnum++; break; }
									case "Login": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK && !_fields[f].isIdentity,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Password": { _fieldsnum++; break; }
									case "Password": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK && !_fields[f].isIdentity,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
								}
							}
							Assert.AreEqual(3, _fieldsnum, "3 fields expected at table: '{0}', only {1} were found", _tables[t].Name, _fieldsnum);
							break;
						}
						#endregion
						#region case "UserGroup": { _tablesnum++; break; }
						case "UserGroup": {
							_tablesnum++;

							_fields = dbconnections_[c].getTableFields(_tables[t].Name);
							_fieldsnum = 0;
							for (int f = 0; f < _fields.Length; f++) {
								switch (_fields[f].Name) {
									#region case "IDUser": { _fieldsnum++; break; }
									case "IDUser": {
										_fieldsnum++;

										Assert.IsTrue(
											_fields[f].isPK && !_fields[f].isIdentity, 
											"PK and not Identity expected for table field: {0}.{1}", 
											_tables[t].Name, 
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "IDGroup": { _fieldsnum++; break; }
									case "IDGroup": {
										_fieldsnum++;

										Assert.IsTrue(
											_fields[f].isPK && !_fields[f].isIdentity,
											"PK and not Identity expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Relationdate": { _fieldsnum++; break; }
									case "Relationdate": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK && !_fields[f].isIdentity,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
									#region case "Defaultrelation": { _fieldsnum++; break; }
									case "Defaultrelation": {
										_fieldsnum++;

										Assert.IsTrue(
											!_fields[f].isPK && !_fields[f].isIdentity,
											"PK / Identity not expected for table field: {0}.{1}",
											_tables[t].Name,
											_fields[f].Name
										);
										break;
									}
									#endregion
								}
							}
							Assert.AreEqual(4, _fieldsnum, "4 fields expected at table: '{0}', only {1} were found", _tables[t].Name, _fieldsnum);
							break;
						}
						#endregion
					}
				}
				Assert.AreEqual(4, _tablesnum, "4 tables expected, only {0} were found", _tablesnum);
				#endregion
			}
		}
		#endregion
		#region public void UT_Execute_SQLQuery();
		[Test]
		public void UT_Execute_SQLQuery() {
			string _newguid = DateTime.Now.Ticks.ToString();// Guid.NewGuid().ToString();
			string _query1;
			string _query2;
			string _query3;
			string _login;
			string _password;
			long _iduser;
			DataTable _datatable;

			for (int c = 0; c < dbconnections_.Length; c++) {
				switch (dbconnections_[c].DBServerType) {
					case eDBServerTypes.SQLServer:
					case eDBServerTypes.PostgreSQL: {
						_query1 = string.Format(
							"insert into \"User\" (\"Login\", \"Password\") values ('test-{0}', 'password')",
							_newguid
						);
						_query2 = string.Format(
							"select \"IDUser\", \"Login\", \"Password\" from \"User\" where \"Login\" = 'test-{0}'",
							_newguid
						);
						_query3 = string.Format(
							"delete from \"User\" where \"Login\" = 'test-{0}'",
							_newguid
						);
						break;
					}
					default: {
						throw new Exception(
							string.Format(
								"unsuported db type: {0}", 
								dbconnections_[c].DBServerType.ToString()
							)
						);
					}
				}
				dbconnections_[c].Execute_SQLQuery(_query1);

				_datatable = dbconnections_[c].Execute_SQLQuery_returnDataTable(_query2);
				Assert.AreEqual(1, _datatable.Rows.Count, "expected 1 row instead of {0}", _datatable.Rows.Count);

				Assert.AreEqual(typeof(string), _datatable.Rows[0]["Login"].GetType(), "expected string type for Login field");
				_login = (string)_datatable.Rows[0]["Login"];
				Assert.AreEqual(typeof(string), _datatable.Rows[0]["Password"].GetType(), "expected string type for Password field");
				_password = (string)_datatable.Rows[0]["Password"];
				Assert.AreEqual(typeof(long), _datatable.Rows[0]["IDUser"].GetType(), "expected string type for IDUser field");
				_iduser = (long)_datatable.Rows[0]["IDUser"];

				dbconnections_[c].Execute_SQLQuery(_query3);
				_datatable = dbconnections_[c].Execute_SQLQuery_returnDataTable(_query2);
				Assert.AreEqual(0, _datatable.Rows.Count, "expected 0 rows instead of {0}", _datatable.Rows.Count);
			}
		}
		#endregion
		#region public void UT_Execute_SQLFunction_andCheckExistence();
		[Test]
		public void UT_Execute_SQLFunction_andCheckExistence() {
			string _newguid = DateTime.Now.Ticks.ToString();
			string _query1;
			string _query2;
			IDbDataParameter[] _dataparameters;

			for (int c = 0; c < dbconnections_.Length; c++) {
				switch (dbconnections_[c].DBServerType) {
					case eDBServerTypes.SQLServer:
					case eDBServerTypes.PostgreSQL: {
						_query1 = string.Format(
							"insert into \"User\" (\"Login\", \"Password\") values ('test-{0}', 'password')",
							_newguid
						);
						_query2 = string.Format(
							"delete from \"User\" where \"Login\" = 'test-{0}'",
							_newguid
						);
						break;
					}
					default: {
						throw new Exception(
							string.Format(
								"unsuported db type: {0}", 
								dbconnections_[c].DBServerType.ToString()
							)
						);
					}
				}
				dbconnections_[c].Execute_SQLQuery(_query1);


				Assert.IsTrue(dbconnections_[c].SQLFunction_exists("fnc0_User_isObject_byLogin"), "sql function: \"fnc0_User_isObject_byLogin\" doesn't exist");


				_dataparameters = new IDbDataParameter[] {
					dbconnections_[c].newDBDataParameter(
						"Login_search_", 
						DbType.String, 
						ParameterDirection.Input, 
						string.Format("test-{0}", _newguid), 
						50
					)
				};
				Assert.IsTrue(
					(bool)dbconnections_[c].Execute_SQLFunction(
						"fnc0_User_isObject_byLogin",
						_dataparameters,
						DbType.Boolean,
						0
					), 
					"user: '{0}' should exist",
					(string)_dataparameters[0].Value
				);


				dbconnections_[c].Execute_SQLQuery(_query2);


				_dataparameters = new IDbDataParameter[] {
					dbconnections_[c].newDBDataParameter(
						"Login_search_", 
						DbType.String, 
						ParameterDirection.Input, 
						string.Format("test-{0}", _newguid), 
						50
					)
				};
				Assert.IsFalse(
					(bool)dbconnections_[c].Execute_SQLFunction(
						"fnc0_User_isObject_byLogin",
						_dataparameters,
						DbType.Boolean,
						0
					),
					"user: '{0}' should NOT exist",
					(string)_dataparameters[0].Value
				);
			}
		}
		#endregion
		#region public void UT_Execute_SQLStoredProcedure_andCheckExistence();
		[Test]
		public void UT_Execute_SQLStoredProcedure_andCheckExistence() {
			//string _newguid = DateTime.Now.Ticks.ToString();
			//string _query1;
			//string _query2;
			//IDbDataParameter[] _dataparameters;

			//for (int c = 0; c < dbconnections_.Length; c++) {
			//    switch (dbconnections_[c].DBServerType) {
			//        case eDBServerTypes.SQLServer:
			//        case eDBServerTypes.PostgreSQL: {
			//            _query1 = string.Format(
			//                "insert into \"User\" (\"Login\", \"Password\") values ('test-{0}', 'password')",
			//                _newguid
			//            );
			//            _query2 = string.Format(
			//                "delete from \"User\" where \"Login\" = 'test-{0}'",
			//                _newguid
			//            );
			//            break;
			//        }
			//        default: {
			//            throw new Exception(
			//                string.Format(
			//                    "unsuported db type: {0}", 
			//                    dbconnections_[c].DBServerType.ToString()
			//                )
			//            );
			//        }
			//    }
			//    dbconnections_[c].Execute_SQLQuery(_query1);


			//    Assert.IsTrue(dbconnections_[c].SQLFunction_exists("fnc0_User_isObject_byLogin"), "sql function: \"fnc0_User_isObject_byLogin\" doesn't exist");


			//    _dataparameters = new IDbDataParameter[] {
			//        dbconnections_[c].newDBDataParameter(
			//            "Login_search_", 
			//            DbType.String, 
			//            ParameterDirection.Input, 
			//            string.Format("test-{0}", _newguid), 
			//            50
			//        )
			//    };
			//    Assert.IsTrue(
			//        (bool)dbconnections_[c].Execute_SQLFunction(
			//            "fnc0_User_isObject_byLogin",
			//            _dataparameters,
			//            DbType.Boolean,
			//            0
			//        ), 
			//        "user: '{0}' should exist",
			//        (string)_dataparameters[0].Value
			//    );


			//    dbconnections_[c].Execute_SQLQuery(_query2);


			//    _dataparameters = new IDbDataParameter[] {
			//        dbconnections_[c].newDBDataParameter(
			//            "Login_search_", 
			//            DbType.String, 
			//            ParameterDirection.Input, 
			//            string.Format("test-{0}", _newguid), 
			//            50
			//        )
			//    };
			//    Assert.IsFalse(
			//        (bool)dbconnections_[c].Execute_SQLFunction(
			//            "fnc0_User_isObject_byLogin",
			//            _dataparameters,
			//            DbType.Boolean,
			//            0
			//        ),
			//        "user: '{0}' should NOT exist",
			//        (string)_dataparameters[0].Value
			//    );
			//}
		}
		#endregion
	}
}