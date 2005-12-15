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

namespace OGen.lib.collections {
	public class cProperty_aggregate {
		public cProperty_aggregate() {
			irontable_ = new Irontable();
		}

		private Irontable irontable_;

		public Irontable.IIrontableKeys Keys {
			get { return irontable_.Keys; }
		}
		public int Count {
			get { return irontable_.Count; }
		}
		public iClaSS this[int index_in] {
			get { return (iClaSS)irontable_[index_in]; }
			set { irontable_[index_in] = value; }
		}
		public iClaSS this[string name_in] {
			get { return (iClaSS)irontable_[name_in]; }
			set { irontable_[name_in] = value; }
		}

		public int Search(string name_in) {
			return irontable_.Search(name_in);
		}
		public int Add(IrontableItem item_in) {
			return irontable_.Add(item_in);
		}
		public int Add(string name_in, iClaSS value_in) {
			return irontable_.Add(name_in, value_in);
		}
	}
}