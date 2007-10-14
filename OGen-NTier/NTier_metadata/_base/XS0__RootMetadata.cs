#region Copyright (C) 2002 Francisco Monteiro
/*

OGen Copyright (c) 2002 Francisco Monteiro  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#endregion
using System;
using System.Xml.Serialization;
using System.Collections;

using OGen.lib.collections;
using OGen.NTier.lib.metadata.metadata;

namespace OGen.NTier.lib.metadata {
	public class XS0__RootMetadata : iClaSSe_metadata {
		public XS0__RootMetadata(
			string metadataFilepath_in
		) {
			metadata_ = XS__metadata.Load_fromFile(
				metadataFilepath_in,
				(XS__RootMetadata)this
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
			string metadataFilepath_in,
			bool useMetacache_in
		) {
			#region string _key = schemaFilepath_in + "|" + metadataFilepath_in;
			string _key = null;
			if (useMetacache_in) {
				_key = string.Format(
					"{0}", 
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
				return (XS__RootMetadata)XS__RootMetadata.Metacache[_key];
			} else {
				XS__RootMetadata _rootmetadata = new XS__RootMetadata(
					metadataFilepath_in
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

		#region public XS__metadata metadata { get; }
		private XS__metadata metadata_;

		public XS__metadata metadata {
			get { return metadata_; }
		}
		#endregion

		#region private iClaSSe_metadata getMetadataFor(string forString_in);
		private iClaSSe_metadata getMetadataFor(string forString_in) {
			if (
				forString_in.Substring(0, XS__metadata.ROOT_METADATA.Length)
					== XS__metadata.ROOT_METADATA
			) {
				return metadata_;
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