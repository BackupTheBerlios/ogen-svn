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

namespace OGen.XSD.lib.metadata {
	public class utils {
		private utils() {
		}

		public static void ReflectThrough(object someClass_in) {
			PropertyInfo[] _properties = someClass_in.GetType().GetProperties(
				BindingFlags.Public | 
				BindingFlags.Instance
			);
			for (int _prop = 0; _prop < _properties.Length; _prop++) {
				if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlAttributeAttribute)
				)) {
					Console.Write(
						"XmlAttribute::{0}", 
						_properties[_prop].Name
					);

					Attribute[] _attributes = Attribute.GetCustomAttributes(
						_properties[_prop], 
						typeof(System.Xml.Serialization.XmlAttributeAttribute), 
						true
					);
					for (int _att = 0; _att < _attributes.Length; _att++) {
						//if (_attributes[_att].GetType() == typeof(System.Xml.Serialization.XmlAttributeAttribute)) {
							System.Xml.Serialization.XmlAttributeAttribute _attribute 
								= (System.Xml.Serialization.XmlAttributeAttribute)_attributes[_att];
							Console.WriteLine(
								" - AttributeName:{0};",//  DataType:{1};  Type:{2};  ",
								_attribute.AttributeName,
								_attribute.DataType,
								_attribute.Type
							);
						//}
					}

				} else if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlElementAttribute)
				)) {
					Console.Write(
						"XmlElementAttribute::{0}", 
						_properties[_prop].Name
					);

					Attribute[] _attributes = Attribute.GetCustomAttributes(
						_properties[_prop], 
						typeof(System.Xml.Serialization.XmlElementAttribute), 
						true
					);
					for (int _att = 0; _att < _attributes.Length; _att++) {
						//if (_attributes[_att].GetType() == typeof(System.Xml.Serialization.XmlElementAttribute)) {
							System.Xml.Serialization.XmlElementAttribute _attribute 
								= (System.Xml.Serialization.XmlElementAttribute)_attributes[_att];
							Console.WriteLine(
								" - ElementName:{0};",//  DataType:{1};  Type:{2};  ",
								_attribute.ElementName,
								_attribute.DataType,
								_attribute.Type
							);
						//}
					}

					object _value = _properties[_prop].GetValue(someClass_in, null);

					if (_value == null) return;

					if (_value.GetType().IsArray) {
						Array _array = (Array)_value;
						for (int i = 0; i < _array.Length; i++) {
							ReflectThrough(_array.GetValue(i));
						}
					} else {
						ReflectThrough(_value);
					}
				}
			}
		}
	}

	public class xs__collection<C> {
		public xs__collection() {
			cols_ = new ArrayList();
		}
	
		#region public C[] cols__ { get; set; }
		private ArrayList cols_;

		public C[] cols__ {
			get {
				C[] _output = new C[cols_.Count];
				cols_.CopyTo(_output);
				return _output;
			}
			set {
				cols_.Clear();
				if (value != null) {
					for (int i = 0; i < value.Length; i++) {
						cols_.Add(value[i]);
					}
				}
			}
		}
		#endregion

		public C this[int index_in] {
			get { return (C)cols_[index_in]; }
		}
		public int Add(params C[] col_in) {
			int _output = -1;
			for (int c = 0; c < col_in.Length; c++) {
				_output = cols_.Add(col_in[c]);
			}
			return _output;
		}
		public int Count {
			get { return cols_.Count; }
		}
	}
}
