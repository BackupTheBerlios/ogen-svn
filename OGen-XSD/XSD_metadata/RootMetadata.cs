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
	public class XS_Schemas {
		public XS_Schemas(
			XS_Schema[] schemas_in
		) {
			schemas_ = schemas_in;
		}

		#region public XS_Schema this[...] { get; }
		private XS_Schema[] schemas_;

		public XS_Schema this[int index_in] {
			get {
				return schemas_[index_in];
			}
		}
		public XS_Schema this[string name_in] {
			get {
				// ToDos: later! performance

				for (int i = 0; i < schemas_.Length; i++) {
					if (schemas_[i].XS_Element.Name == name_in) {
						return schemas_[i];
					}
				}
				throw new Exception(string.Format(
					"{0}.{1}[string name_in]: can't find: {2}",
					typeof(XS_Schemas).Namespace, 
					typeof(XS_Schemas).Name, 
					name_in
				));
			}
		}
		#endregion
		public int Count { get {
			return schemas_.Length;
		} }
	}

	public class RootMetadata : iClaSSe_metadata {
		public RootMetadata(
			string metadataFilepath_in, 
			params string[] schemaFilepath_in
		) {
			extendedmetadata_ = ExtendedMetadata.Load_fromFile(
				metadataFilepath_in,
				this
			);

			schemas_ = new XS_Schemas(
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
		#region public XS_Schema[] Schema { get; }
		private XS_Schemas schemas_;

		public XS_Schemas Schemas {
			get { return schemas_; }
		}
		#endregion

		#region private bool Root_Schema_ExpressionTryParse(...);
		private const string ROOT_SCHEMA = XS_Schema.ROOT + "." + XS_Schema.SCHEMA + "[";
		private static int ROOT_SCHEMA_LENGTH = ROOT_SCHEMA.Length;
		private const string ROOT_SCHEMA_N = XS_Schema.ROOT + "." + XS_Schema.SCHEMA + "[n]";
		private static int ROOT_SCHEMA_N_LENGTH = ROOT_SCHEMA_N.Length;

		private bool Root_Schema_ExpressionTryParse(
			string root_Schema_Expression_in,
			out string begin_out,
			out string index_out,
			out string end_out
		) {
			if (
				(begin_out = root_Schema_Expression_in.Substring(0, ROOT_SCHEMA_LENGTH))
					== ROOT_SCHEMA
			) {
				string _end_aux
					= root_Schema_Expression_in.Substring(ROOT_SCHEMA_LENGTH);
				int _aux = _end_aux.IndexOf(']');
				index_out = _end_aux.Substring(0, _aux);
				end_out = _end_aux.Substring(_aux);

				return true;
			} else {
				begin_out = string.Empty;
				index_out = string.Empty;
				end_out = string.Empty;

				return false;
			}
		}
		#endregion

		#region public string Read_fromRoot(...);
		public string Read_fromRoot(string what_in) {
			if (
				what_in.Substring(0, ExtendedMetadata.ROOT_METADATA.Length)
					== ExtendedMetadata.ROOT_METADATA
			) {
				return extendedmetadata_.Read_fromRoot(what_in);
			} else {
				string begin_out;
				string index_out;
				string end_out;
				if (Root_Schema_ExpressionTryParse(
					what_in, 
					out begin_out, 
					out index_out, 
					out end_out
				)) {
					for (int i = 0; i < schemas_.Count; i++) {
						if (
							what_in.Substring(0, schemas_[i].Root_Schema.Length)
								== schemas_[i].Root_Schema
						) {
							// ROOT.schema[n].simpleType
							// ROOT.schema[3].simpleType
							return schemas_[i].Read_fromRoot(string.Format(
								"{0}{1}{2}",
								begin_out,
								i,
								end_out
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
				string begin_out;
				string index_out;
				string end_out;
				if (Root_Schema_ExpressionTryParse(
					iteration_in, 
					out begin_out, 
					out index_out, 
					out end_out
				)) {
					if (index_out == "n") {
						for (int i = 0; i < schemas_.Count; i++) {
							schemas_[i].IterateThrough_fromRoot(
								string.Format(
									"{0}{1}{2}",
									begin_out, 
									i,
									end_out
								), 
								iteration_found_in
							);
						}
						_didit = true;
					} else {
						int _index_int = int.Parse(index_out);
						schemas_[
							_index_int
						].IterateThrough_fromRoot(
							string.Format(
								"{0}{1}{2}",
								begin_out,
								_index_int,
								end_out
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
