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
using System.Reflection;

using OGen.NTier.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.howtos {
	class HowTo_Read_and_Write_to_DataObject_Properties {
		public HowTo_Read_and_Write_to_DataObject_Properties() {


			DO_User _user = new DO_User();
			_user.Fields.IDUser = 123;
			_user.Fields.Login = "123";
			_user.Fields.Password = "123";

			PropertyInfo[] _properties = typeof(DO_User).GetProperties(
				BindingFlags.Public | 
				BindingFlags.Instance
			);
			for (int _prop = 0; _prop < _properties.Length; _prop++) {
				if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(DOPropertyAttribute)
				)) {
					Console.Write(
						"{0}: ", 
						_properties[_prop].Name
					);
					Attribute[] _attributes = Attribute.GetCustomAttributes(
						_properties[_prop]
					);
					for (int _att = 0; _att < _attributes.Length; _att++) {
						DOPropertyAttribute _attribute = (DOPropertyAttribute)_attributes[_att];
						Console.Write(
							"name:{0};  isPK:{1};  isIdentity:{2};  DefaultValue:{3};  ",
							_attribute.Name,
							_attribute.isPK,
							_attribute.isIdentity,
							_attribute.DefaultValue
						);
					}
					Console.Write(
						"value: {0}; ", 
						_properties[_prop].GetValue(_user, null)
					);
					_properties[_prop].SetValue(
						_user, 
						Convert.ChangeType(
							456, 
							_properties[_prop].PropertyType
						), 
						null
					);
					Console.WriteLine(
						"new value: {0}", _properties[_prop].GetValue(_user, null)
					);
					Console.WriteLine();
				}
			}


		}
	}
}