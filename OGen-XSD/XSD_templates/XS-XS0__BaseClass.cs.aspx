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
XS_Schema _aux_schema = _aux_rootmetadata.Schemas[_arg_SchemaName];
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
	[System.Xml.Serialization.XmlTypeAttribute(Namespace="http://www.w3.org/2001/XMLSchema")]
	[System.Xml.Serialization.XmlRootAttribute("<%=_aux_schema.XS_Element.Name%>", Namespace="http://www.w3.org/2001/XMLSchema", IsNullable=false)]
	public class XS0__<%=_aux_schema.XS_Element.Name%> : XS_<%=_aux_schema.XS_Element.Type%>, iClaSSe_metadata {

		public const string <%=_aux_schema.XS_Element.Name.ToUpper()%> = "<%=_aux_schema.XS_Element.Name%>";
		public const string ROOT_<%=_aux_schema.XS_Element.Name.ToUpper()%> = "ROOT." + <%=_aux_schema.XS_Element.Name.ToUpper()%>;

		#region public static XS__<%=_aux_schema.XS_Element.Name%> Load_fromFile(...);
		public static XS__<%=_aux_schema.XS_Element.Name%> Load_fromFile(
			string filePath_in
		) {
			return Load_fromFile(
				filePath_in,
				null
			);
		}
		public static XS__<%=_aux_schema.XS_Element.Name%> Load_fromFile(
			string filePath_in,
			XS__RootMetadata root_ref_in
		) {
			FileStream _stream = new FileStream(
				filePath_in,
				FileMode.Open,
				FileAccess.Read,
				FileShare.Read
			);

			XS__<%=_aux_schema.XS_Element.Name%> _output;
			try {
				_output = (XS__<%=_aux_schema.XS_Element.Name%>)new XmlSerializer(typeof(XS__<%=_aux_schema.XS_Element.Name%>)).Deserialize(
					_stream
				);
			} catch (Exception _ex) {
				throw new Exception(string.Format(
					"---\nERROR READING XML:\n{0}\n---\n{1}",
					filePath_in,
					_ex.Message
				));
			}

			if (root_ref_in != null) _output.root_ref = root_ref_in;
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
			new XmlSerializer(typeof(XS__<%=_aux_schema.XS_Element.Name%>)).Serialize(
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