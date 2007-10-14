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
			string schemaFilepath_in,
			string metadataFilepath_in
		) {
			schema_ = XS_Schema.Load_fromFile(
				schemaFilepath_in,
				this
			);
			extendedmetadata_ = ExtendedMetadata.Load_fromFile(
				metadataFilepath_in,
				this
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
			string schemaFilepath_in,
			string metadataFilepath_in, 
			bool useMetacache_in
		) {
			#region string _key = schemaFilepath_in + "|" + metadataFilepath_in;
			string _key = null;
			if (useMetacache_in) {
				_key = string.Format(
					"{0}|{1}", 
					schemaFilepath_in, 
					metadataFilepath_in
				);
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
					schemaFilepath_in,
					metadataFilepath_in
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

		#region public XS_Schema Schema { get; }
		private XS_Schema schema_;

		public XS_Schema Schema {
			get { return schema_; }
		}
		#endregion
		#region public ExtendedMetadata ExtendedMetadata { get; }
		private ExtendedMetadata extendedmetadata_;

		public ExtendedMetadata ExtendedMetadata {
			get { return extendedmetadata_; }
		}
		#endregion

		#region private iClaSSe_metadata getMetadataFor(string forString_in);
		private iClaSSe_metadata getMetadataFor(string forString_in) {
			if (
				forString_in.Substring(0, XS_Schema.ROOT_SCHEMA.Length)
					== XS_Schema.ROOT_SCHEMA
			) {
				return schema_;
			} else if (
				forString_in.Substring(0, ExtendedMetadata.ROOT_METADATA.Length)
					== ExtendedMetadata.ROOT_METADATA
			) {
				return extendedmetadata_;
			} else {
				throw new Exception(string.Format(
					"can't handle: {0}",
					forString_in
				));
			}
		}
		#endregion

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			return getMetadataFor(what_in).Read_fromRoot(what_in);
		}
		#endregion
		#region public void IterateThrough_fromRoot(...);
		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			getMetadataFor(iteration_in).IterateThrough_fromRoot(
				iteration_in,
				iteration_found_in
			);
		}
		#endregion
	}
}
