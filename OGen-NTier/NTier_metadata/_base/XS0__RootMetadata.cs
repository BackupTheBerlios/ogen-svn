#region Copyright (C) 2002 Francisco Monteiro
/*

OGen
Copyright (c) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;
using OGen.NTier.lib.metadata.metadata;
using OGen.NTier.lib.metadata.someTest;

namespace OGen.NTier.lib.metadata {
	public class XS0__RootMetadata : iClaSSe_metadata {
		public XS0__RootMetadata(
			string[] metadataFilepath_in, 
			string[] someTestFilepath_in
		) {
			metadatacollection_ = new XS__metadataCollection(
				XS__metadata.Load_fromFile(
					(XS__RootMetadata)this, 
					metadataFilepath_in
				)
			);
			sometestcollection_ = new XS__someTestCollection(
				XS__someTest.Load_fromFile(
					(XS__RootMetadata)this, 
					someTestFilepath_in
				)
			);
		}

		#region public static Hashtable Metacache { get; }
		private static Hashtable metacache__;

		public static Hashtable Metacache {
			get {
				if (metacache__ == null) {
					metacache__ = new Hashtable();
				}
				return metacache__;
			}
		}
		#endregion
		#region public static XS__RootMetadata Load_fromFile(...);
		public static XS__RootMetadata Load_fromFile(
			string[] metadataFilepath_in, 
			string[] someTestFilepath_in, 
			bool useMetacache_in
		) {
			#region string _key = ...;
			string _key = null;
			if (useMetacache_in) {
				for (int i = 0; i < metadataFilepath_in.Length; i++) {
					_key += string.Format(
						"{0}{1}", 
						(_key == null) ? "" : "|", 
						metadataFilepath_in[i]
					);
				}
				for (int i = 0; i < someTestFilepath_in.Length; i++) {
					_key += string.Format(
						"{0}{1}", 
						(_key == null) ? "" : "|", 
						someTestFilepath_in[i]
					);
				}
			}
			#endregion
			if (
				useMetacache_in
				&&
				(metacache__ != null)
				&&
				Metacache.Contains(_key)
			) {
				return (XS__RootMetadata)XS__RootMetadata.Metacache[_key];
			} else {
				XS__RootMetadata _rootmetadata = new XS__RootMetadata(
					metadataFilepath_in, 
					someTestFilepath_in
				);
				if (useMetacache_in) {
					XS__RootMetadata.Metacache.Add(
						_key, 
						_rootmetadata
					);
				}
				return _rootmetadata;
			}
		}
		#endregion


		#region public XS__metadataCollection MetadataCollection { get; }
		private XS__metadataCollection metadatacollection_;

		public XS__metadataCollection MetadataCollection {
			get { return metadatacollection_; }
		}
		#endregion
		#region public XS__someTestCollection SomeTestCollection { get; }
		private XS__someTestCollection sometestcollection_;

		public XS__someTestCollection SomeTestCollection {
			get { return sometestcollection_; }
		}
		#endregion
		private const string ROOT_METADATA = XS__metadata.ROOT + "." + XS__metadata.METADATA + "[";
		private const string ROOT_SOMETEST = XS__someTest.ROOT + "." + XS__someTest.SOMETEST + "[";

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			string _begin;
			string _indexstring;
			string _end;

			if (OGen.lib.generator.utils.rootExpression_TryParse(
				what_in, 
				ROOT_METADATA, 
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				for (int i = 0; i < metadatacollection_.Count; i++) {
					if (
						what_in.Substring(0, metadatacollection_[i].Root_Metadata.Length)
							== metadatacollection_[i].Root_Metadata
					) {
						return metadatacollection_[i].Read_fromRoot(string.Format(
							"{0}{1}{2}",
							_begin,
							i,
							_end
						));
					}
				}
			} else if (OGen.lib.generator.utils.rootExpression_TryParse(
				what_in, 
				ROOT_SOMETEST, 
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				for (int i = 0; i < sometestcollection_.Count; i++) {
					if (
						what_in.Substring(0, sometestcollection_[i].Root_SomeTest.Length)
							== sometestcollection_[i].Root_SomeTest
					) {
						return sometestcollection_[i].Read_fromRoot(string.Format(
							"{0}{1}{2}",
							_begin,
							i,
							_end
						));
					}
				}
			}
			throw new Exception(string.Format(
				"\n---\n{0}.{1}.Read_fromRoot(string what_in): can't handle: {2}\n---",
				typeof(XS0__RootMetadata).Namespace,
				typeof(XS0__RootMetadata).Name,
				what_in
			));
		}
		#endregion
		#region public void IterateThrough_fromRoot(...);
		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			bool _didit = false;
			string _begin;
			string _indexstring;
			string _end;
			if (OGen.lib.generator.utils.rootExpression_TryParse(
				iteration_in,
				ROOT_METADATA,
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				if (_indexstring == "n") {
					for (int i = 0; i < metadatacollection_.Count; i++) {
						metadatacollection_[i].IterateThrough_fromRoot(
							string.Format(
								"{0}{1}{2}",
								_begin, 
								i,
								_end
							), 
							iteration_found_in
						);
					}
					_didit = true;
				} else {
					int _indexint = int.Parse(_indexstring);
					metadatacollection_[
						_indexint
					].IterateThrough_fromRoot(
						string.Format(
							"{0}{1}{2}",
							_begin,
							_indexint,
							_end
						),
						iteration_found_in
					);
					_didit = true;
				}
			}
			if (OGen.lib.generator.utils.rootExpression_TryParse(
				iteration_in,
				ROOT_SOMETEST,
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				if (_indexstring == "n") {
					for (int i = 0; i < sometestcollection_.Count; i++) {
						sometestcollection_[i].IterateThrough_fromRoot(
							string.Format(
								"{0}{1}{2}",
								_begin, 
								i,
								_end
							), 
							iteration_found_in
						);
					}
					_didit = true;
				} else {
					int _indexint = int.Parse(_indexstring);
					sometestcollection_[
						_indexint
					].IterateThrough_fromRoot(
						string.Format(
							"{0}{1}{2}",
							_begin,
							_indexint,
							_end
						),
						iteration_found_in
					);
					_didit = true;
				}
			}
			if (!_didit) {
				throw new Exception(string.Format(
					"\n---\n{0}.{1}.IterateThrough_fromRoot(...): can't handle: {2}\n---",
					typeof(XS0__RootMetadata).Namespace,
					typeof(XS0__RootMetadata).Name,
					iteration_in
				));
			}
		}
		#endregion

	}
}