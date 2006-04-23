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
using System.Reflection;

using NUnit.Framework;

using OGen.lib.datalayer;
using OGen.NTier.lib.datalayer;
using OGen.NTier.UTs.lib.datalayer;

namespace OGen.NTier.UTs.lib.datalayer.UTs {
	[TestFixture]
	public class UT__utils {
		public UT__utils() { }

		#region public void TestFixtureSetUp();
		[TestFixtureSetUp]
		public void TestFixtureSetUp() {
			// ...
		}
		#endregion
		#region public void TestFixtureTearDown();
		[TestFixtureTearDown]
		public void TestFixtureTearDown() {
			// ...
		}
		#endregion

		#region public void UT_Check_DataObjects_integrity();
		[Test]
		public void UT_Check_DataObjects_integrity() {
			bool _found_Config = false;
			bool _found_vUserGroup = false;
			int _found_Config_Name = 0;
			int _found_Config_Config = 0;
			int _found_Config_Datatype = 0;
			bool _virtualTable_hasPK = false;

			Assembly _assembly = Assembly.Load("OGen.NTier.UTs.lib.datalayer");
			Assert.IsTrue((_assembly != null), "couldn't load OGen.NTier.UTs.lib.datalayer assembly");
			if (_assembly != null) {
				Type[] _types = _assembly.GetTypes();
				for (int _tp = 0; _tp < _types.Length; _tp++) {
					Type _type = (Type)_types[_tp];

					object[] _doclassattributes = _type.GetCustomAttributes(
						typeof(DOClassAttribute),
						true//false
					);
					if (
						(_doclassattributes.Length > 0)
						&&
						(_type.Name.IndexOf("DO0_") != 0)
					) {
						for (int _catt = 0; _catt < _doclassattributes.Length; _catt++) {
							DOClassAttribute _classattribute = (DOClassAttribute)_doclassattributes[_catt];

							PropertyInfo[] _properties = _type.GetProperties(
								BindingFlags.Public |
								BindingFlags.Instance
							);
							for (int _prop = 0; _prop < _properties.Length; _prop++) {
								if (Attribute.IsDefined(
									_properties[_prop],
									typeof(DOPropertyAttribute)
								)) {
									Attribute[] _attributes = Attribute.GetCustomAttributes(
										_properties[_prop]
									);
									for (int _att = 0; _att < _attributes.Length; _att++) {
										DOPropertyAttribute _propertyattribute = (DOPropertyAttribute)_attributes[_att];

										Assert.AreEqual(_properties[_prop].Name, _propertyattribute.Name, "\"{0}\" != \"{1}\" ??", _properties[_prop].Name, _propertyattribute.Name);

										switch (_classattribute.Name) {
											case "Config": {
												if (!_found_Config) {
													_found_Config = true;
													Assert.IsTrue(_classattribute.isConfig, "DO_Config shouldn't have isConfig attribute set to false");
													Assert.IsFalse(_classattribute.isVirtualTable, "DO_Config shouldn't have isVirtualTable attribute set to true");
												}
												if (_classattribute.isConfig) {
													if (_propertyattribute.isConfig_Name) _found_Config_Name++;
													if (_propertyattribute.isConfig_Config) _found_Config_Config++;
													if (_propertyattribute.isConfig_Datatype) _found_Config_Datatype++;
												}
												break;
											}
											case "vUserGroup": {
												if (!_found_vUserGroup) {
													_found_vUserGroup = true;
													Assert.IsFalse(_classattribute.isConfig, "DO_vUserGroup shouldn't have isConfig attribute set to true");
													Assert.IsTrue(_classattribute.isVirtualTable, "DO_vUserGroup shouldn't have isVirtualTable attribute set to false");
												}
												if ((!_virtualTable_hasPK) && (_classattribute.isVirtualTable) && (_propertyattribute.isPK)) _virtualTable_hasPK = true;
												break;
											}
										}
									}
								}
							}
						}
					}
				}
			}
			Assert.IsTrue(_found_Config, "couldn't find: DO_Config");
			Assert.IsTrue(_found_vUserGroup, "couldn't find: DO_vUserGroup");
			Assert.AreEqual(1, _found_Config_Name, "DO_Config isConfig_Name properties: {0}, expected 1", _found_Config_Name);
			Assert.AreEqual(1, _found_Config_Config, "DO_Config isConfig_Config properties: {0}, expected 1", _found_Config_Config);
			Assert.AreEqual(1, _found_Config_Datatype, "DO_Config isConfig_Datatype properties: {0}, expected 1", _found_Config_Datatype);
			Assert.IsTrue(_virtualTable_hasPK, "couldn't find any PKs fields at DO_vUserGroup");
		}
		#endregion
	}
}