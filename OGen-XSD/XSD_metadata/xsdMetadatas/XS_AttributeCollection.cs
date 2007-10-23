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
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
#if NET_1_1
	#region public class XS_AttributeCollection { ... }
	public class XS_AttributeCollection {
		public XS_AttributeCollection() {
			cols_ = new ArrayList();
		}

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		public RootMetadata root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((XS_Attribute)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal XS_Attribute[] cols__ { get; set; }
		private ArrayList cols_;

		internal XS_Attribute[] cols__ {
			get {
				XS_Attribute[] _output = new XS_Attribute[cols_.Count];
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

		#region public int Count { get; }
		public int Count {
			get {
				return cols_.Count;
			}
		}
		#endregion

		#region public XS_Attribute this[int index_in] { get; }
		public XS_Attribute this[int index_in] {
			get {
				return (XS_Attribute)cols_[index_in];
			}
		}
		#endregion
		#region public XS_Attribute this[string name_in] { get; }
		public XS_Attribute this[string name_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (
						name_in.Equals(
							((XS_Attribute)cols_[i]).Name
						)
					) {
						return (XS_Attribute)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params XS_Attribute[] col_in);
		public int Add(params XS_Attribute[] col_in) {
			int _output = -1;

			for (int i = 0; i < col_in.Length; i++) {
				_output = cols_.Add(col_in[i]);
			}

			return _output;
		}
		#endregion
	}
	#endregion
#endif
}