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
using NUnit.Framework;

using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	public class UT0_Config { public UT0_Config() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_SetGetDelSequence() {
			DO_Config _config;
			try {
				_config = new DO_Config();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_Config\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_config.Connection.Open();
			_config.Connection.Transaction.Begin();



			_config.Fields.Name = "123";
			_config.Fields.Config = "123";
			_config.Fields.Type = 123;
			_config.Fields.Description = "123";
			// setObject(); // ToDos: here!



			_config.Connection.Transaction.Rollback();
			_config.Connection.Transaction.Terminate();
			_config.Connection.Close();
			_config.Dispose(); _config = null;
		}
	}
}