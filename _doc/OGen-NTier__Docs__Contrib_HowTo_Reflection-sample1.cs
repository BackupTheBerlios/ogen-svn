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
using System.Collections.Generic;
using System.Text;

using OGen.NTier.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.test {
	class HowTo_Reflection_sample1 {
		public HowTo_Reflection_sample1() {
			DOPropertyAttribute att = (DOPropertyAttribute)Attribute.GetCustomAttribute(
			  typeof(DO_User).GetProperty("IDUser"),
			  typeof(DOPropertyAttribute),
			  true
			);
			Console.WriteLine(
			  "{0}:{1}:{2}:{3}",
			  att.Name,
			  att.isPK,
			  att.isIdentity,
			  att.DefaultValue
			);
		}
	}
}
