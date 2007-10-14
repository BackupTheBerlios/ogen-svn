#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.IO;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata.someTest {
	[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.w3.org/2001/XMLSchema")]
	[System.Xml.Serialization.XmlRootAttribute("someTest", Namespace="http://www.w3.org/2001/XMLSchema", IsNullable=false)]
	public class XS0__someTest : XS_someType2, iClaSSe_metadata {

		public const string SOMETEST = "someTest";
		public const string ROOT_SOMETEST = "ROOT." + SOMETEST;

		#region public static XS__someTest Load_fromFile(...);
		public static XS__someTest Load_fromFile(
			string filePath_in
		) {
			return Load_fromFile(
				filePath_in,
				null
			);
		}
		public static XS__someTest Load_fromFile(
			string filePath_in,
			XS__RootMetadata root_ref_in
		) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);

			XS__someTest _output;
			try {
				_output = (XS__someTest)new XmlSerializer(typeof(XS__someTest)).Deserialize(
					_stream
				);
			} catch (Exception _ex) {
				throw new Exception(string.Format(
					"---\nERROR READING XML:\n{0}\n---\n{1}",
					filePath_in,
					_ex.Message
				));
			}

			if (root_ref_in != null) _output.root_ref = root_ref_in;
			return _output;
		}
		#endregion
		#region public void SaveState_toFile(string filePath_in);
		public void SaveState_toFile(string filePath_in) {
			FileStream _file = new FileStream(
				filePath_in,
				FileMode.Create,
				FileAccess.Write,
				FileShare.ReadWrite
			);
			new XmlSerializer(typeof(XS__someTest)).Serialize(
				_file,
				this
			);
			_file.Flush();
			_file.Close();
		}
		#endregion

		public string Read_fromRoot(string what_in) {
			return OGen.lib.generator.utils.ReflectThrough(
				this,
				ROOT_SOMETEST, 
				null, 
				what_in,
				ROOT_SOMETEST, 
				true, 
				true
			);
		}

		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			OGen.lib.generator.utils.ReflectThrough(
				this,
				ROOT_SOMETEST, 
				iteration_found_in, 
				iteration_in,
				ROOT_SOMETEST, 
				false, 
				true
			);
		}
	}
}