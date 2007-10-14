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
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;

namespace OGen.XSD.lib.metadata {
	public class RootMetadata : iClaSSe_metadata {
		public RootMetadata(
			string metadataFilepath_in, 
			params string[] schemaFilepath_in
		) {
			extendedmetadata_ = ExtendedMetadata.Load_fromFile(
				metadataFilepath_in,
				this
			);

			schemacollection_ = new XS_SchemaCollection(
				XS_Schema.Load_fromFile(
					this, 
					schemaFilepath_in
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
		#region public static RootMetadata Load_fromFile(...);
		public static RootMetadata Load_fromFile(
			string metadataFilepath_in,
			bool useMetacache_in, 
			params string[] schemaFilepath_in
		) {
			#region string _key = metadataFilepath_in + "|" + schemaFilepath_in[n];
			string _key = null;
			if (useMetacache_in) {
				_key = metadataFilepath_in;
				for (int i = 0; i < schemaFilepath_in.Length; i++) {
					_key += string.Format(
						"|{0}", 
						schemaFilepath_in[i]
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
				return (RootMetadata)RootMetadata.Metacache[_key];
			} else {
				RootMetadata _rootmetadata = new RootMetadata(
					metadataFilepath_in, 
					schemaFilepath_in
				);
				if (useMetacache_in) {
					RootMetadata.Metacache.Add(
						_key, 
						_rootmetadata
					);
				}
				return _rootmetadata;
			}
		}
		#endregion

		#region public ExtendedMetadata ExtendedMetadata { get; }
		private ExtendedMetadata extendedmetadata_;

		public ExtendedMetadata ExtendedMetadata {
			get { return extendedmetadata_; }
		}
		#endregion
		#region public XS_SchemaCollection SchemaCollection { get; }
		private XS_SchemaCollection schemacollection_;

		public XS_SchemaCollection SchemaCollection {
			get { return schemacollection_; }
		}
		#endregion

		private const string ROOT_SCHEMA = XS_Schema.ROOT + "." + XS_Schema.SCHEMA + "[";

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			if (
				what_in.Substring(0, ExtendedMetadata.ROOT_METADATA.Length)
					== ExtendedMetadata.ROOT_METADATA
			) {
				return extendedmetadata_.Read_fromRoot(what_in);
			} else {
				string _begin;
				string _indexstring;
				string _end;
				if (OGen.lib.generator.utils.rootExpression_TryParse(
					what_in, 
					ROOT_SCHEMA, 
					out _begin, 
					out _indexstring, 
					out _end
				)) {
					for (int i = 0; i < schemacollection_.Count; i++) {
						if (
							what_in.Substring(0, schemacollection_[i].Root_Schema.Length)
								== schemacollection_[i].Root_Schema
						) {
							return schemacollection_[i].Read_fromRoot(string.Format(
								"{0}{1}{2}",
								_begin,
								i,
								_end
							));
						}
					}
				}
			}
			throw new Exception(string.Format(
				"\n---\n{0}.{1}.Read_fromRoot(string what_in): can't handle: {2}\n---",
				typeof(RootMetadata).Namespace,
				typeof(RootMetadata).Name,
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
			if (
				iteration_in.Substring(0, ExtendedMetadata.ROOT_METADATA.Length)
					== ExtendedMetadata.ROOT_METADATA
			) {
				extendedmetadata_.IterateThrough_fromRoot(
					iteration_in,
					iteration_found_in
				);
				_didit = true;
			} else {
				string _begin;
				string _indexstring;
				string _end;
				if (OGen.lib.generator.utils.rootExpression_TryParse(
					iteration_in,
					ROOT_SCHEMA,
					out _begin, 
					out _indexstring, 
					out _end
				)) {
					if (_indexstring == "n") {
						for (int i = 0; i < schemacollection_.Count; i++) {
							schemacollection_[i].IterateThrough_fromRoot(
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
						schemacollection_[
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
			}
			if (!_didit) {
				throw new Exception(string.Format(
					"\n---\n{0}.{1}.IterateThrough_fromRoot(...): can't handle: {2}\n---",
					typeof(RootMetadata).Namespace,
					typeof(RootMetadata).Name,
					iteration_in
				));
			}
		}
		#endregion
	}
}
