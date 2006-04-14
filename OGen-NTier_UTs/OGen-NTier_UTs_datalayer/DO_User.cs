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

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer {
	/// <summary>
	/// User DataObject which provides access to User table at Database.
	/// </summary>
	public sealed class DO_User : DO0_User, IDisposable {
		#region public DO_User();
		///
		public DO_User() : base() {
		}
		/// <summary>
		/// Making the use of Database Transactions possible on a sequence of operations across multiple DataObjects.
		/// </summary>
		/// <param name="connection_in">opened Database connection with an initiated Transaction</param>
		public DO_User(cDBConnection connection_in) : base(connection_in) {
		}
		#endregion

		#region public Properties...
		#endregion
		#region public Methods...
		#endregion
	}
}