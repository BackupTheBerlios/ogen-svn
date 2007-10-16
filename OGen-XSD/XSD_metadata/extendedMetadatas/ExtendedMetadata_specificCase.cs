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
#if !NET20
	#region public class ExtendedMetadata_specificCaseCollection { ... }
	public class ExtendedMetadata_specificCaseCollection {
		public ExtendedMetadata_specificCaseCollection() {
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
					((ExtendedMetadata_specificCase)cols_[i]).root_ref = value;
				}
			}
		}
		#endregion

		#region internal ExtendedMetadata_specificCase[] cols__ { get; set; }
		private ArrayList cols_;

		internal ExtendedMetadata_specificCase[] cols__ {
			get {
				ExtendedMetadata_specificCase[] _output = new ExtendedMetadata_specificCase[cols_.Count];
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

		#region public ExtendedMetadata_specificCase this[int index_in] { get; }
		public ExtendedMetadata_specificCase this[int index_in] {
			get {
				return (ExtendedMetadata_specificCase)cols_[index_in];
			}
		}
		#endregion
		#region public ExtendedMetadata_specificCase this[string word_in] { get; }
		public ExtendedMetadata_specificCase this[string word_in] {
			get {
				for (int i = 0; i < cols_.Count; i++) {
					if (((ExtendedMetadata_specificCase)cols_[i]).Word == word_in) {
						return (ExtendedMetadata_specificCase)cols_[i];
					}
				}

				return null;
			}
		}
		#endregion

		#region public int Add(params ExtendedMetadata_specificCase[] col_in);
		public int Add(params ExtendedMetadata_specificCase[] col_in) {
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

	public class ExtendedMetadata_specificCase
#if NET20
		: OGenCollectionInterface, OGenRootrefCollectionInterface<RootMetadata>
#endif
	{
		#region public string Word { get; set; }
		private string word_;

		[XmlAttribute("word")]
		public string Word {
			get {
				return word_;
			}
			set {
				word_ = value;
			}
		}
		#endregion
		#region public string Translation { get; set; }
		private string translation_;

		[XmlAttribute("translation")]
		public string Translation {
			get {
				return translation_;
			}
			set {
				translation_ = value;
			}
		}
		#endregion

		#region public RootMetadata root_ref { get; }
		private RootMetadata root_ref_;

		[XmlIgnore()]
		public RootMetadata root_ref {
			set {
				root_ref_ = value;
			}
			get { return root_ref_; }
		}
		#endregion
#if NET20
		#region public string CollectionName { get; }
		[XmlIgnore()]
		public string CollectionName {
			get {
				return Word;
			}
		}
		#endregion
#endif
	}
}
