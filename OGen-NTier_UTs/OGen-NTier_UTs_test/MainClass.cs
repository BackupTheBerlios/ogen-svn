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
using System.IO;
using System.Xml;
using System.Reflection;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

using OGen.lib.datalayer;

using OGen.NTier.UTs.lib.datalayer;
using OGen.NTier.UTs.lib.businesslayer;

namespace OGen.NTier.UTs.test {
	class MainClass {
		[STAThread]
		static void Main(string[] args) {
			const int _cycles = 50;
			cDBConnection[] _cons = new cDBConnection[] {
				#region new cDBConnection(eDBServerTypes.SQLServer, ...), 
				new cDBConnection(
					eDBServerTypes.SQLServer,
					OGen.lib.datalayer.utils.Connectionstring.Buildwith.Parameters(
						"127.0.0.1", 
						"sa", 
						"passpub", 
						"OGen-NTier_UTs", 
						eDBServerTypes.SQLServer
					)
				), 
				#endregion
				#region new cDBConnection(eDBServerTypes.PostgreSQL, ...)
				new cDBConnection(
					eDBServerTypes.PostgreSQL,
					OGen.lib.datalayer.utils.Connectionstring.Buildwith.Parameters(
						"127.0.0.1", 
						"postgres", 
						"passpub", 
						"OGen-NTier_UTs", 
						eDBServerTypes.PostgreSQL
					)
				)
				#endregion
			};

			long _conter = 0L;
			for (int _compiled = 0; _compiled < 2; _compiled++) {
				for (int _con = 0; _con < _cons.Length; _con++) {
					_cons[_con].Open();
					_cons[_con].Transaction.Begin();
					for (int _cached = 0; _cached < 2; _cached++) {
						DO_Config _config = new DO_Config(_cons[_con]);
						#region _config.setObject();
						_conter = DateTime.Now.Ticks;

						for (int c = 0; c < _cycles; c++) {
							_config.Name = c.ToString();
							_config.Config = "DELETE THIS, IT IS A TEST";
							_config.Type = 2;
							_config.setObject(true);
						}

						Console.WriteLine(
							"setObject()      \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);
						#endregion
						#region _config.Record.Open_...(false);
						_conter = DateTime.Now.Ticks;

						_config.Record.Open_all(false);
						while (_config.Record.Read()) ;
						_config.Record.Close();

						Console.WriteLine(
							"Record.Open()    \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);
						#endregion
						#region _config.delObject();
						_conter = DateTime.Now.Ticks;

						_config.Record.Open_all(true);
						while (_config.Record.Read()) {
							if (_config.Config == "DELETE THIS, IT IS A TEST") {
								_config.delObject();
							}
						}
						_config.Record.Close();

						Console.WriteLine(
							"delObject()      \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);
						#endregion
						#region _config.getObject();
						_conter = DateTime.Now.Ticks;

						_config.Name = "SomeIntConfig";
						_config.Config = "1245";
						_config.Type = 4;
						_config.setObject(true);

						for (int c = 0; c < _cycles; c++) {
							_config.getObject("SomeIntConfig");
						}

						Console.WriteLine(
							"getObject()      \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);
						#endregion
						_config.Dispose(); _config = null;
						//---
						DO_User _user = new DO_User(_cons[_con]);

						#region _user.insObject();
						_conter = DateTime.Now.Ticks;

						for (int c = 0; c < _cycles; c++) {
							bool _constraint;
							_user.Login = c.ToString();
							_user.Password = "DELETE THIS, IT IS A TEST";
							_user.insObject(true, out _constraint);
						}

						_user.Record.Open_all(true);
						while (_user.Record.Read()) {
							if (_user.Password == "DELETE THIS, IT IS A TEST") {
								_user.delObject();
							}
						}
						_user.Record.Close();

						Console.WriteLine(
							"insObject()      \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);
						#endregion

						_conter = DateTime.Now.Ticks;
						for (int c = 0; c < _cycles; c++) {
							if (!_user.isObject_byLogin("fmonteiro")) {
								bool _constraint;
								_user.Login = "fmonteiro";
								_user.Password = "passpub";
								_user.insObject(true, out _constraint);
							}
							_user.getObject_byLogin("fmonteiro");
						}
						Console.WriteLine(
							"getObject_by()   \t{0}\tcached:{1}\tcompiled:{2}\t{3}",
							_cons[_con].DBServerType,
							(_cached == 1),
							(_compiled == 1),
							(DateTime.Now.Ticks - _conter).ToString()
						);

						_user.Dispose(); _user = null;
					}
					_cons[_con].Transaction.Rollback();
					_cons[_con].Transaction.Terminate();
					_cons[_con].Close();
				}
			}
		}
	}
}