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
using System.Collections.Generic;

namespace OGen.lib.collections {
	public class OGenRootrefCollection<C, R, T> : OGenCollection<C, T>
		where R : class
		where C : 
			class,
			OGenCollectionInterface<T>, 
			OGenRootrefCollectionInterface<R>
	{
		#region public R root_ref { get; }
		private R root_ref_;

		public R root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((C)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion
	}
	public class OGenRootrefSimpleCollection<C, R, T> : OGenSimpleCollection<C>
		where R : class
		where C :
			class,
			OGenRootrefCollectionInterface<R> 
	{
		#region public R root_ref { get; }
		private R root_ref_;

		public R root_ref {
			get {
				return root_ref_;
			}
			set {
				root_ref_ = value;
				for (int i = 0; i < cols_.Count; i++) {
					((C)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion
	}

	public class OGenCollection<C, T> : OGenSimpleCollection<C>
		where C : class, OGenCollectionInterface <T>
	{
		#region public C this[T memberName_in] { get; }
		public C this[T memberName_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (memberName_in.Equals(
						cols_[i].CollectionName
					)) {
						return cols_[i];
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
		public OGenSimpleCollection(
		) {
			cols_ = new List<C>();
		}

		#region public C[] cols__ { get; set; }
		protected List<C> cols_;

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
				return cols_[index_in];
			}
		}
		#endregion

		#region public void Add(params C[] col_in);
		public void Add(params C[] col_in) {
			for (int i = 0; i < col_in.Length; i++) {
				cols_.Add(col_in[i]);
			}
		}
		#endregion
	}
}
