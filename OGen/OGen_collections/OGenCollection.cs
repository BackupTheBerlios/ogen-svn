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
using System.Collections;

namespace OGen.lib.collections {
	public class OGenCollection<C> : OGenSimpleCollection<C> 
		where C : class, OGenCollectionInterface 
	{
		#region public C this[string memberName_in] { get; }
		public C this[string memberName_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((C)cols_[i]).CollectionName == memberName_in) {
						return (C)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion
	}
	public class OGenSimpleCollection<C> 
		where C : class 
	{
		public OGenSimpleCollection() {
			cols_ = new ArrayList();
		}
	
		#region public C[] cols__ { get; set; }
		protected ArrayList cols_;

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

		#region public int Count { get; }
		public int Count {
			get {
				return cols_.Count;
			}
		}
		#endregion

		#region public C this[int index_in] { get; }
		public C this[int index_in] {
			get {
				return (C)cols_[index_in];
			}
		}
		#endregion

		#region public int Add(params C[] col_in);
		public int Add(params C[] col_in) {
			int _output = -1;

			for (int i = 0; i < col_in.Length; i++) {
				_output = cols_.Add(col_in[i]);
			}

			return _output;
		}
		#endregion
	}
}
