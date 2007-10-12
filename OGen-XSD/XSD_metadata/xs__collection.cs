#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion

using System;
using System.Reflection;
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	public class utils {
		private utils() {}

		public static string ReflectThrough(
			object someClass_in, 
			string path_in, 
			cClaSSe.dIteration_found iteration_found_in, 
			string iteration_in, 
			string pathTranslated_in, 
			bool returnValue_in
		) {
			if (iteration_in == pathTranslated_in) {
				if (iteration_found_in != null) iteration_found_in(path_in);
			}

//Console.Write("{{{0}}}", path_in.ToUpper());

			PropertyInfo[] _properties;
			System.Xml.Serialization.XmlElementAttribute _elementAttribute;
			System.Xml.Serialization.XmlAttributeAttribute _attribute;
			object _value;
			Array _array;
			string _output = string.Empty;

			_properties = someClass_in.GetType().GetProperties(
				BindingFlags.Public | 
				BindingFlags.Instance
			);
			for (int _prop = 0; _prop < _properties.Length; _prop++) {
				if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlAttributeAttribute)
				)) {
					_value = _properties[_prop].GetValue(someClass_in, null);

					if (_value == null) continue;

//Console.Write(
//	"XmlAttribute::{0}", 
//	_properties[_prop].Name
//);

					_attribute 
						= (System.Xml.Serialization.XmlAttributeAttribute)Attribute.GetCustomAttributes(
							_properties[_prop], 
							typeof(System.Xml.Serialization.XmlAttributeAttribute), 
							true
						)[0];

//Console.Write(
//	"{0}=\"{1}\" ",
//	_attribute.AttributeName, 
//	_value.ToString()
//);
if (string.Format("{0}.{1}", path_in, _attribute.AttributeName) == iteration_in) {
	//Console.WriteLine(
	//	"{0}\n{1}\n{2}\n---", 
	//	iteration_in, 
	//	path_in, // pathTranslated_in, 
	//	_attribute.AttributeName
	//);
	return _value.ToString();
}

				} else if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlElementAttribute)
				)) {
					_value = _properties[_prop].GetValue(someClass_in, null);

					if (_value == null) continue;

//Console.Write(
//	"XmlElementAttribute::{0}", 
//	_properties[_prop].Name
//);

					_elementAttribute 
						= (System.Xml.Serialization.XmlElementAttribute)Attribute.GetCustomAttributes(
							_properties[_prop], 
							typeof(System.Xml.Serialization.XmlElementAttribute), 
							true
						)[0];

					if (_value.GetType().IsArray) {
						_array = (Array)_value;
						for (int i = 0; i < _array.Length; i++) {
//Console.Write(
//	"\n<xs:{0} ",
//	_elementAttribute.ElementName
//);

							_output = ReflectThrough(
								_array.GetValue(i), 
								string.Format(
									"{0}.{1}[{2}]", 
									path_in, 
									_elementAttribute.ElementName, 
									i
								), 
								iteration_found_in, 
								iteration_in, 
								string.Format(
									"{0}.{1}[n]", 
									pathTranslated_in, 
									_elementAttribute.ElementName
								), 
								returnValue_in
							);
							if (returnValue_in && (_output != string.Empty)) return _output;

//Console.Write(
//	"\n</xs:{0}>",
//	_elementAttribute.ElementName
//);
						}
					} else {
//Console.Write(
//	"\n<xs:{0} ",
//	_elementAttribute.ElementName
//);

						_output = ReflectThrough(
							_value, 
							string.Format(
								"{0}.{1}", 
								path_in, 
								_elementAttribute.ElementName
							), 
							iteration_found_in, 
							iteration_in, 
							string.Format(
								"{0}.{1}", 
								pathTranslated_in, 
								_elementAttribute.ElementName
							), 
							returnValue_in
						);
						if (returnValue_in && (_output != string.Empty)) return _output;

//Console.Write(
//	"\n</xs:{0}>",
//	_elementAttribute.ElementName
//);
					}
				}
			}

			return _output;
		}
	}
}
