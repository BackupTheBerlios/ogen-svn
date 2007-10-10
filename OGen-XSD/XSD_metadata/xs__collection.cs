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

		public static void ReflectThrough(
			object someClass_in, 
			string path_in, 
			cClaSSe.dIteration_found iteration_found_in, 
			string iteration_in, 
			string pathTranslated_in
		) {
			if (iteration_in == pathTranslated_in) {
				iteration_found_in(path_in);
			}
			//Console.Write("{{{0}}}", path_in.ToUpper());

			PropertyInfo[] _properties;
			System.Xml.Serialization.XmlElementAttribute _elementAttribute;
			System.Xml.Serialization.XmlAttributeAttribute _attribute;
			object _value;
			Array _array;

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

					if (_value == null) return;

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
				} else if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlElementAttribute)
				)) {
					_value = _properties[_prop].GetValue(someClass_in, null);

					if (_value == null) return;

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

							ReflectThrough(
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
								)
							);

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

						ReflectThrough(
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
							)
						);

//Console.Write(
//	"\n</xs:{0}>",
//	_elementAttribute.ElementName
//);
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
