#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
//using System;
//using System.Collections.Generic;
//using System.Text;

//namespace OGen.lib.datalayer {
//    public class DBConnection {
//        //#region public DBConnection(...);
//        public DBConnection(
//            eDBServerTypes dbServerType_in, 
//            string connectionstring_in
//        ) : this (
//            dbServerType_in, 
//            connectionstring_in, 
//            string.Empty
//        ) {
//        }

//        public DBConnection(
//            eDBServerTypes dbServerType_in, 
//            string connectionstring_in, 
//            string logfile_in
//        ) {
//            dbservertype_ = dbServerType_in;
//            connectionstring_ = connectionstring_in;
//            logfile_ = logfile_in;
//        }
//        //#endregion

//        //#region public properties...
//        #region public eDBServerTypes DBServerType { get; }
//        private eDBServerTypes dbservertype_;

//        public eDBServerTypes DBServerType {
//            get { return dbservertype_; }
//        }
//        #endregion
//        #region public string Connectionstring { get; }
//        private string connectionstring_;

//        public string Connectionstring {
//            get { return connectionstring_; }
//        }
//        #endregion
//        #region public string Logfile { get; }
//        public string logfile_;

//        public string Logfile {
//            get { return logfile_; }
//        }
//        #endregion

//        #region public DBConnection__base mainAggregate { get; }
//        private DBConnection__base mainAggregate__;

//        public DBConnection__base mainAggregate {
//            get {
//                if (mainAggregate__ == null) {
//                    switch (DBServerType) {
//                        case eDBServerTypes.PostgreSQL: {
//                            mainAggregate__ = new DBConnection_PostgreSQL(Connectionstring, Logfile);
//                            break;
//                        }
//                        case eDBServerTypes.SQLServer: {
//                            mainAggregate__ = new DBConnection_SQLServer(Connectionstring, Logfile);
//                            break;
//                        }
//                        default: {
//                            throw new Exception("not implemented!");
//                        }
//                    }
//                }

//                return mainAggregate__;
//            }
//        }
//        #endregion
//        //#endregion

//        //#region public Methods...
//        public void Test() {
//            mainAggregate.Test();
//        }
//        //#endregion
//    }
//}