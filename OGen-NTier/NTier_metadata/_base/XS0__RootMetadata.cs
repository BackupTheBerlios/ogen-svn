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
using OGen.NTier.lib.metadata.metadataExtended;
using OGen.NTier.lib.metadata.metadataDB;

namespace OGen.NTier.lib.metadata {
	public class XS0__RootMetadata : iClaSSe_metadata {
		public XS0__RootMetadata(
			string[] metadataExtendedFilepath_in, 
			string[] metadataDBFilepath_in
		) {
			metadataextendedcollection_ = new XS__metadataExtendedCollection(
				XS__metadataExtended.Load_fromFile(
					(XS__RootMetadata)this, 
					metadataExtendedFilepath_in
				)
			);
			metadatadbcollection_ = new XS__metadataDBCollection(
				XS__metadataDB.Load_fromFile(
					(XS__RootMetadata)this, 
					metadataDBFilepath_in
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
			string[] metadataExtendedFilepath_in, 
			string[] metadataDBFilepath_in, 
			bool useMetacache_in
		) {
			#region string _key = ...;
			string _key = null;
			if (useMetacache_in) {
				for (int i = 0; i < metadataExtendedFilepath_in.Length; i++) {
					_key += string.Format(
						"{0}{1}", 
						(_key == null) ? "" : "|", 
						metadataExtendedFilepath_in[i]
					);
				}
				for (int i = 0; i < metadataDBFilepath_in.Length; i++) {
					_key += string.Format(
						"{0}{1}", 
						(_key == null) ? "" : "|", 
						metadataDBFilepath_in[i]
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
					metadataExtendedFilepath_in, 
					metadataDBFilepath_in
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


		#region public XS__metadataExtendedCollection MetadataExtendedCollection { get; }
		private XS__metadataExtendedCollection metadataextendedcollection_;

		public XS__metadataExtendedCollection MetadataExtendedCollection {
			get { return metadataextendedcollection_; }
		}
		#endregion
		#region public XS__metadataDBCollection MetadataDBCollection { get; }
		private XS__metadataDBCollection metadatadbcollection_;

		public XS__metadataDBCollection MetadataDBCollection {
			get { return metadatadbcollection_; }
		}
		#endregion
		private const string ROOT_METADATAEXTENDED = XS__metadataExtended.ROOT + "." + XS__metadataExtended.METADATAEXTENDED + "[";
		private const string ROOT_METADATADB = XS__metadataDB.ROOT + "." + XS__metadataDB.METADATADB + "[";

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			string _begin;
			string _indexstring;
			string _end;

			if (OGen.lib.generator.utils.rootExpression_TryParse(
				what_in, 
				ROOT_METADATAEXTENDED, 
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				for (int i = 0; i < metadataextendedcollection_.Count; i++) {
					if (
						what_in.Substring(0, metadataextendedcollection_[i].Root_MetadataExtended.Length)
							== metadataextendedcollection_[i].Root_MetadataExtended
					) {
						return metadataextendedcollection_[i].Read_fromRoot(string.Format(
							"{0}{1}{2}",
							_begin,
							i,
							_end
						));
					}
				}
			} else if (OGen.lib.generator.utils.rootExpression_TryParse(
				what_in, 
				ROOT_METADATADB, 
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				for (int i = 0; i < metadatadbcollection_.Count; i++) {
					if (
						what_in.Substring(0, metadatadbcollection_[i].Root_MetadataDB.Length)
							== metadatadbcollection_[i].Root_MetadataDB
					) {
						return metadatadbcollection_[i].Read_fromRoot(string.Format(
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
				ROOT_METADATAEXTENDED,
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				if (_indexstring == "n") {
					for (int i = 0; i < metadataextendedcollection_.Count; i++) {
						metadataextendedcollection_[i].IterateThrough_fromRoot(
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
					metadataextendedcollection_[
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
				ROOT_METADATADB,
				out _begin, 
				out _indexstring, 
				out _end
			)) {
				if (_indexstring == "n") {
					for (int i = 0; i < metadatadbcollection_.Count; i++) {
						metadatadbcollection_[i].IterateThrough_fromRoot(
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
					metadatadbcollection_[
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