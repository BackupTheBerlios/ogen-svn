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
using System.IO;
using System.Collections;
using System.Xml;

namespace OGen.lib.config {
	/// <summary>
	///	Provides Read/Write access to app.config.
	/// <note type="implementnotes">
	/// As of .NET Framework version 1.1, AppSettings is readonly. Writing directly to app.config file brings another problem, it won't refresh until you restart the application. Solution presented here will let you change configurations and later save them in app.config.
	/// </note>
	/// <note type="caution">
	/// Reading configurations from AppSettings should be made using ConfigurationSettingsBinder.
	/// </note>
	/// </summary>
	public class ConfigurationSettingsBinder {
		#region static ConfigurationSettingsBinder();
		static ConfigurationSettingsBinder() {
			#region configurationsettingsbind_ = ...;
			string[] _keys
				= System.Configuration.ConfigurationSettings.AppSettings.AllKeys;

			// more items will/can be added, hence commented code:
			configurationsettingsbind_ = new Hashtable(/*_keys.Length*/);

			for (int k = 0; k < _keys.Length; k++) {
				if (System.Configuration.ConfigurationSettings.AppSettings[_keys[k]].Trim() != string.Empty) {
					configurationsettingsbind_.Add(
						_keys[k], 
						System.Configuration.ConfigurationSettings.AppSettings[_keys[k]]
					);
				}
			}
			#endregion
			removeitemlist_ = new ArrayList();

			saveneeded_ = false;
		}
		#endregion

		#region private Properties...
		private static ArrayList removeitemlist_;
		private static Hashtable configurationsettingsbind_;
		#endregion
		#region public Properties...
		#endregion

//		#region public Methods...
		#region public static string Read(string name_in);
		/// <summary>
		/// Reads Configuration.
		/// </summary>
		/// <param name="name_in">Configuration Name</param>
		/// <returns>Configuration Value (null if not contained)</returns>
		public static string Read(string name_in) {
			return (configurationsettingsbind_.Contains(name_in)) 
				? (string)configurationsettingsbind_[name_in]
				: null;
		}
		#endregion
		#region public void Write(string name_in, string value_in);
		/// <summary>
		/// Writes Configuration.
		/// </summary>
		/// <param name="name_in">Configuration Name</param>
		/// <param name="value_in">Configuration Value (sending a null value will remove Configuration Item from collection)</param>
		public static void Write(string name_in, string value_in) {
			if (
				(value_in == null)
				||
				(value_in.Trim() == string.Empty)
			) {
				if (configurationsettingsbind_.Contains(name_in)) {
					configurationsettingsbind_.Remove(name_in);
					removeitemlist_.Add(name_in);

					saveneeded_ = true;
				}
			} else {
				configurationsettingsbind_[name_in] = value_in;

				saveneeded_ = true;
			}
		}
		#endregion

//		#region public static void Save();
		private static bool saveneeded_;

		/// <summary>
		/// Saves Configuration.
		/// </summary>
		public static void Save() {
			if (saveneeded_) {
				#region string _app_config = ...;
				string _app_config = Path.Combine(

					// 1) the directory from which this process starts
					//Environment.CurrentDirectory, 

					// 2) the current working directory of the application
					Directory.GetCurrentDirectory(), 

					string.Format(
						"{0}.config", 
						utils.ApplicationName
					)
				);
				#endregion

				if (System.IO.File.Exists(_app_config)) {


// ToDos: here!


//					#region new XmlDocument().Load/Save(new FileStream(_app_config));
//					XmlDocument _xmlReadDoc = new XmlDocument();
//					XmlDocument _xmlWriteDoc = new XmlDocument();
//					#region _xmlReadDoc.Load(new FileStream(_app_config));
//					FileStream _xmlReadFile = new FileStream(
//						_app_config, 
//						FileMode.Open, 
//						FileAccess.Read, 
//						FileShare.None
//					);
//					_xmlReadDoc.Load(_xmlReadFile);
//					_xmlReadFile.Close(); _xmlReadFile = null;
//					#endregion
//
//
//					//_xmlWriteDoc.AppendChild(
//					//	// ToDos: here!
//					//	// ...
//					//);
//
//
//					#region _xmlWriteDoc.Save(new FileStream(_app_config));
//					FileStream _xmlWriteFile = new FileStream(
//						_app_config, 
//						FileMode.Create, 
//						FileAccess.Write, 
//						FileShare.None
//					);
//					_xmlWriteDoc.Save(_xmlWriteFile);
//					_xmlWriteFile.Close(); _xmlWriteFile = null;
//					#endregion
//					_xmlWriteDoc = null;
//					_xmlReadDoc = null;
//					#endregion
				} else {
					#region _xmlDoc.Save(new FileStream(_app_config));
					XmlDocument _xmlDoc = new XmlDocument();

					XmlElement _configuration = _xmlDoc.CreateElement("configuration");
					XmlElement _appSettings = _xmlDoc.CreateElement("appSettings");
					#region _appSettings.AppendChild(_xmlDoc.CreateElement("add"));
					IDictionaryEnumerator _enumerator = configurationsettingsbind_.GetEnumerator();
					while (_enumerator.MoveNext()) {
						XmlElement _add = _xmlDoc.CreateElement("add");
						#region ... key
						_add.SetAttributeNode(_xmlDoc.CreateAttribute("key"));
						_add.Attributes["key"].Value 
							= (string)_enumerator.Key;
						#endregion
						#region ... value
						_add.SetAttributeNode(_xmlDoc.CreateAttribute("value"));
						_add.Attributes["value"].Value 
							= (string)_enumerator.Value;
						#endregion
						_appSettings.AppendChild(_add);
					}
					#endregion
					_configuration.AppendChild(_appSettings);
					_xmlDoc.AppendChild(_configuration);

					#region _xmlDoc.Save(new FileStream(_app_config));
					FileStream _xmlFile = new FileStream(
						_app_config,
						FileMode.Create,
						FileAccess.Write,
						FileShare.ReadWrite
					);
					_xmlDoc.Save(_xmlFile);
					_xmlFile.Close(); _xmlFile = null;
					#endregion
					_xmlDoc = null;
					#endregion
				}

				removeitemlist_ = new ArrayList();
				saveneeded_ = false;
			}
		}
//		#endregion
//		#endregion
	}
}