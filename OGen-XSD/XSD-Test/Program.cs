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
//using System.Collections;
using System.Xml;
using System.Xml.Serialization;
using System.IO;

using OGen.XSD.lib.metadata;

namespace OGen.XSD.presentationlayer.test {
	class Program {
		public static void Main(string[] args) {
			Console.WriteLine("Hello World!");

			XS_Schema _schema = new XS_Schema();
			_schema.xmlNS_xs = "http://www.w3.org/2001/XMLSchema";
			_schema.targetNamespace = "http://ogen.berlios.de";
			_schema.xmlNS = "http://ogen.berlios.de";
			_schema.ElementFormDefault = "qualified";
			
			XS_SimpleType _someEnum = new XS_SimpleType();
			_someEnum.Name = "someEnum";

			_schema.XS_SimpleType = new XS_SimpleType[] {
				_someEnum
			};

			XS_ComplexType _someType1 = new XS_ComplexType();
			_someType1.Name = "someType1";

			XS_ComplexType _someType2 = new XS_ComplexType();
			_someType2.Name = "someType2";
			_schema.XS_ComplexType = new XS_ComplexType[] {
				_someType1, 
				_someType2
			};

			string _filepath = @"c:\test.xml";
			FileStream _file = new FileStream(
				_filepath,
				FileMode.Create,
				FileAccess.Write,
				FileShare.ReadWrite
			);
			new XmlSerializer(typeof(XS_Schema)).Serialize(
				_file,
				_schema
			);
			_file.Flush();
			_file.Close();

			Console.Write("Press any key to continue . . . ");
			Console.ReadKey(true);

			FileStream _stream = new FileStream(
				_filepath,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);
			_schema = (XS_Schema)new XmlSerializer(typeof(XS_Schema)).Deserialize(
				_stream
			);

			Console.Write("Press any key to continue . . . ");
			Console.ReadKey(true);
		}
	}
}
