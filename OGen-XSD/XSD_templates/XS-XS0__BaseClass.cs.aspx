<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%//@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.XSD.lib.metadata" %>
<%@ import namespace="OGen.lib.collections" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string _arg_SchemaFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaFilepath"]);
string _arg_Schema2Filepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["Schema2Filepath"]);
string _arg_SchemaName = System.Web.HttpUtility.UrlDecode(Request.QueryString["SchemaName"]);
#endregion

#region varaux...
RootMetadata _aux_rootmetadata = RootMetadata.Load_fromFile(
	_arg_MetadataFilepath,
	true, 
	_arg_SchemaFilepath,
	_arg_Schema2Filepath
);
XS_Schema _aux_schema = _aux_rootmetadata.SchemaCollection[_arg_SchemaName];

string XS0_ = _aux_rootmetadata.ExtendedMetadata.PrefixGenerated;
string XS_ = _aux_rootmetadata.ExtendedMetadata.Prefix;
string XS0__ = _aux_rootmetadata.ExtendedMetadata.PrefixBaseGenerated;
string XS__ = _aux_rootmetadata.ExtendedMetadata.PrefixBase;
#endregion
//-----------------------------------------------------------------------------------------
if ((_aux_rootmetadata.ExtendedMetadata.CopyrightText != string.Empty) && (_aux_rootmetadata.ExtendedMetadata.CopyrightTextLong != string.Empty)) {
%>#region <%=_aux_rootmetadata.ExtendedMetadata.CopyrightText%>
/*

<%=_aux_rootmetadata.ExtendedMetadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;
using System.IO;
using System.Xml.Serialization;

using OGen.lib.collections;

namespace <%=_aux_rootmetadata.ExtendedMetadata.Namespace%>.<%=_aux_schema.XS_Element.Name%> {
	public class <%=XS__%><%=_aux_schema.XS_Element.Name%>Collection {
		public <%=XS__%><%=_aux_schema.XS_Element.Name%>Collection(
			<%=XS__%><%=_aux_schema.XS_Element.Name%>[] <%=_aux_schema.XS_Element.Name.ToLower()%>collection_in
		) {
			<%=_aux_schema.XS_Element.Name.ToLower()%>collection_ = <%=_aux_schema.XS_Element.Name.ToLower()%>collection_in;
		}

		#region public <%=XS__%><%=_aux_schema.XS_Element.Name%> this[...] { get; }
		private <%=XS__%><%=_aux_schema.XS_Element.Name%>[] <%=_aux_schema.XS_Element.Name.ToLower()%>collection_;

		public <%=XS__%><%=_aux_schema.XS_Element.Name%> this[int index_in] {
			get {
				return <%=_aux_schema.XS_Element.Name.ToLower()%>collection_[index_in];
			}
		}
		public <%=XS__%><%=_aux_schema.XS_Element.Name%> this[string name_in] {
			get {
				// ToDos: later! performance

				for (int i = 0; i < <%=_aux_schema.XS_Element.Name.ToLower()%>collection_.Length; i++) {
					if (<%=_aux_schema.XS_Element.Name.ToLower()%>collection_[i].<%=_aux_rootmetadata.ExtendedMetadata.MetadataIndex[_aux_schema.XS_Element.Name].Index%> == name_in) {
						return <%=_aux_schema.XS_Element.Name.ToLower()%>collection_[i];
					}
				}
				throw new Exception(string.Format(
					"{0}.{1}[string name_in]: can't find: {2}",
					typeof(<%=XS__%><%=_aux_schema.XS_Element.Name%>Collection).Namespace, 
					typeof(<%=XS__%><%=_aux_schema.XS_Element.Name%>Collection).Name, 
					name_in
				));
			}
		}
		#endregion
		public int Count { get {
			return <%=_aux_schema.XS_Element.Name.ToLower()%>collection_.Length;
		} }
	}

	[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.w3.org/2001/XMLSchema")]
	[System.Xml.Serialization.XmlRootAttribute("<%=_aux_schema.XS_Element.Name%>", Namespace="http://www.w3.org/2001/XMLSchema", IsNullable=false)]
	public class <%=XS0__%><%=_aux_schema.XS_Element.Name%> : <%=XS_%><%=_aux_schema.XS_Element.Type%>, iClaSSe_metadata {

		public const string <%=_aux_schema.XS_Element.Name.ToUpper()%> = "<%=_aux_schema.XS_Element.Name%>";
		public const string ROOT = "ROOT";
		public const string ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%> = ROOT + "." + <%=_aux_schema.XS_Element.Name.ToUpper()%>;
		#region public string Root_<%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_schema.XS_Element.Name)%> { get; }
		private string root_<%=_aux_schema.XS_Element.Name.ToLower()%>_ = null;

		[XmlIgnore()]
		public string Root_<%=_aux_rootmetadata.ExtendedMetadata.CaseTranslate(_aux_schema.XS_Element.Name)%> {
			get { return root_<%=_aux_schema.XS_Element.Name.ToLower()%>_; }
		}
		#endregion

		#region public static <%=XS__%><%=_aux_schema.XS_Element.Name%>[] Load_fromFile(...);
		public static <%=XS__%><%=_aux_schema.XS_Element.Name%>[] Load_fromFile(
			params string[] filePath_in
		) {
			return Load_fromFile(
				null, 
				filePath_in
			);
		}
		public static <%=XS__%><%=_aux_schema.XS_Element.Name%>[] Load_fromFile(
			<%=XS__%>RootMetadata root_ref_in, 
			params string[] filePath_in
		) {
			FileStream _stream;
			<%=XS__%><%=_aux_schema.XS_Element.Name%>[] _output 
				= new <%=XS__%><%=_aux_schema.XS_Element.Name%>[filePath_in.Length];

			for (int i = 0; i < filePath_in.Length; i++) {
				_stream = new FileStream(
					filePath_in[i],
					FileMode.Open,
					FileAccess.Read,
					FileShare.Read
				);

				try {
					_output[i] = (<%=XS__%><%=_aux_schema.XS_Element.Name%>)new XmlSerializer(typeof(<%=XS__%><%=_aux_schema.XS_Element.Name%>)).Deserialize(
						_stream
					);
					_output[i].root_<%=_aux_schema.XS_Element.Name.ToLower()%>_ = ROOT + "." + <%=_aux_schema.XS_Element.Name.ToUpper()%> + "[" + i + "]";
				} catch (Exception _ex) {
					throw new Exception(string.Format(
						"---\nERROR READING XML:\n{0}\n---\n{1}",
						filePath_in[i],
						_ex.Message
					));
				}

				if (root_ref_in != null) _output[i].root_ref = root_ref_in;
			}
			return _output;
		}
		#endregion
		#region public void SaveState_toFile(string filePath_in);
		public void SaveState_toFile(string filePath_in) {
			FileStream _file = new FileStream(
				filePath_in,
				FileMode.Create,
				FileAccess.Write,
				FileShare.ReadWrite
			);
			new XmlSerializer(typeof(<%=XS__%><%=_aux_schema.XS_Element.Name%>)).Serialize(
				_file,
				this
			);
			_file.Flush();
			_file.Close();
		}
		#endregion

		public string Read_fromRoot(string what_in) {
			return OGen.lib.generator.utils.ReflectThrough(
				this,
				ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%>, 
				null, 
				what_in,
				ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%>, 
				true, 
				true
			);
		}

		public void IterateThrough_fromRoot(
			string iteration_in, 
			cClaSSe.dIteration_found iteration_found_in
		) {
			OGen.lib.generator.utils.ReflectThrough(
				this,
				ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%>, 
				iteration_found_in, 
				iteration_in,
				ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%>, 
				false, 
				true
			);
		}
	}
}<%
//-----------------------------------------------------------------------------------------
%>
