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

using OGen.lib.collections;

namespace OGen.lib.generator {
	public struct MetaFile {
		public MetaFile(
			string path_in,
			string root_in
		) {
			Path = path_in;
			Root = root_in;
		}

		public string Path;
		public string Root;
	}

	public class utils {
		private utils() { }

		public static int MetaFile_find(
			MetaFile[] metaFiles_in,
			string root_in
		) {
			for (int i = 0; i < metaFiles_in.Length; i++) {
				if (metaFiles_in[i].Root == root_in) {
					return i;
				}
			}

			throw new Exception(string.Format(
				"can't find: {0}",
				root_in
			));
		}

		#region public static bool rootExpression_TryParse(...);
		public static bool rootExpression_TryParse(
			string rootExpression_in,
			string whereRootLike_in,
			out string begin_out,
			out string index_out,
			out string end_out
		) {
			if (
				(begin_out = rootExpression_in.Substring(0, whereRootLike_in.Length))
					== whereRootLike_in
			) {
				string _end_aux
					= rootExpression_in.Substring(whereRootLike_in.Length);
				int _aux = _end_aux.IndexOf(']');
				index_out = _end_aux.Substring(0, _aux);
				end_out = _end_aux.Substring(_aux);

				return true;
			} else {
				begin_out = string.Empty;
				index_out = string.Empty;
				end_out = string.Empty;

				return false;
			}
		}
		#endregion

		public static string ReflectThrough(
			object someClass_in, 
			string path_in, 
			cClaSSe.dIteration_found iteration_found_in, 
			string iteration_in, 
			string pathTranslated_in, 
			bool returnValue_in, 
			bool anyAttribute_notJustXml
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
			string _output = null;
			bool _isDefined = false;
			string _attributename = string.Empty;

			_properties = someClass_in.GetType().GetProperties(
				BindingFlags.Public | 
				BindingFlags.Instance
			);
			for (int _prop = 0; _prop < _properties.Length; _prop++) {
				if (Attribute.IsDefined(
					_properties[_prop], 
					typeof(System.Xml.Serialization.XmlElementAttribute)
				)) {
					#region 
					_value = _properties[_prop].GetValue(someClass_in, null);

					if (_value == null) continue;

					_elementAttribute 
						= (System.Xml.Serialization.XmlElementAttribute)Attribute.GetCustomAttributes(
							_properties[_prop], 
							typeof(System.Xml.Serialization.XmlElementAttribute), 
							true
						)[0];

					if (_value.GetType().IsArray) {
						_array = (Array)_value;
						for (int i = 0; i < _array.Length; i++) {
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
								returnValue_in, 
								anyAttribute_notJustXml
							);
// ToDos: now! property may have been found and have empty string
if (returnValue_in && (_output != null)) 
								return _output;
						}
					} else {
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
							returnValue_in, 
							anyAttribute_notJustXml
						);
// ToDos: now! property may have been found and have empty string
if (returnValue_in && (_output != null)) 
							return _output;
					}
					#endregion
				} else if (
					(_isDefined = Attribute.IsDefined(
						_properties[_prop], 
						typeof(System.Xml.Serialization.XmlAttributeAttribute)
					))
					||
					anyAttribute_notJustXml
				) {
					#region
					if (
						anyAttribute_notJustXml 
						&& 
						!_properties[_prop].CanRead
					) continue;

					try {
						_value = _properties[_prop].GetValue(someClass_in, null);
					} catch (Exception _ex) {
						throw new Exception(string.Format(
							"\n---\n{0}.{1}.ReflectThrough(\n\t\"{2}\",\n\t\"{3}\",\n\t\"{4}\"\n)\n---\n{5}", 
							typeof(utils).Namespace, 
							typeof(utils).Name, 
							path_in, 
							iteration_in, 
							pathTranslated_in, 
							_ex.Message
						));
					}

					if (_value == null) continue;

					if (_isDefined) {
						_attribute 
							= (System.Xml.Serialization.XmlAttributeAttribute)Attribute.GetCustomAttributes(
								_properties[_prop], 
								typeof(System.Xml.Serialization.XmlAttributeAttribute), 
								true
							)[0];
						_attributename = _attribute.AttributeName;
					} else {
						_attributename = _properties[_prop].Name;
					}

					if (string.Format("{0}.{1}", path_in, _attributename) == iteration_in) {
						return _value.ToString();
					}
					#endregion
				}
			}

			return _output;
		}
	}
}
