#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace OGen.NTier.lib.metadata {
	public class XS0_tableFieldDBsType  {
		public XS0_tableFieldDBsType (
		) {
			xs_tablefielddb_ 
				= new OGenCollection<XS_tableFieldDBType>();
		}
		#region public OGenCollection<XS_tableFieldDBType> XS_tableFieldDB { get; }
		private OGenCollection<XS_tableFieldDBType> xs_tablefielddb_;
			//= new OGenCollection<XS_tableFieldDBType>();

		[XmlElement("tableFieldDB")]
		public XS_tableFieldDBType[] xs_tablefielddb__xml {
			get { return xs_tablefielddb_.cols__; }
			set { xs_tablefielddb_.cols__ = value; }
		}

		[XmlIgnore()]
		public OGenCollection<XS_tableFieldDBType> XS_tableFieldDB {
			get { return xs_tablefielddb_; }
		}
		#endregion
	}
}