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
	public class UT0_Group { public UT0_Group() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_InsGetDelSequence() {
			DO_Group _group;
			try {
				_group = new DO_Group();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_Group\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_group.Connection.Open();
			_group.Connection.Transaction.Begin();



			_group.Fields.Name = "123";
			long _idgroup;
			try {
				_idgroup = _group.insObject(true);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error running insObject\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			Assert.IsTrue(_idgroup > 0L, "failed to retrieve identity seed (insObject)");
			_group.clrObject();
			bool _exists;
			try {
				_exists = _group.getObject(_idgroup);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error running getObject\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			Assert.IsTrue(_exists, "can't read inserted item (getObject)");
			Assert.AreEqual("123", _group.Fields.Name, "inserted values difer those just read (insObject/getObject)");
			try {
				_group.delObject(_idgroup);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to delete (delObject)\n---\n{0}\n---", e.Message);
				return; // no need...
			}



			_group.Connection.Transaction.Rollback();
			_group.Connection.Transaction.Terminate();
			_group.Connection.Close();
			_group.Dispose(); _group = null;
		}
	}
}