<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
cDBMetadata _aux_metadata;
if (cDBMetadata.Metacache.Contains(_arg_MetadataFilepath)) {
	_aux_metadata = (cDBMetadata)cDBMetadata.Metacache[_arg_MetadataFilepath];
} else {
	_aux_metadata = new cDBMetadata();
	_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);
	cDBMetadata.Metacache.Add(_arg_MetadataFilepath, _aux_metadata);
}

cDBMetadata_Table _aux_table;
cDBMetadata_Table_Field _aux_field;
int _aux_table_hasidentitykey;
//string[] _aux_configmodes = _aux_metadata.ConfigModes();
#endregion
//-----------------------------------------------------------------------------------------
%><Project name="<%=_aux_metadata.ApplicationName%>_datalayer" standardNamespace="<%=_aux_metadata.Namespace%>.lib.datalayer" description="" newfilesearch="None" enableviewstate="True" version="1.1" projecttype="C#">
  <Contents>
    <File name=".\AssemblyInfo.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\_base" subtype="Directory" buildaction="Compile" dependson="" data="" />
    <File name=".\_base\DO0__utils.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\DO__utils.cs" subtype="Code" buildaction="Compile" dependson="" data="" /><%
    for (int t = 0; t < _aux_metadata.Tables.Count; t++) {
		_aux_table = _aux_metadata.Tables[t];%>
    <File name=".\_base\SC0_<%=_aux_table.Name%>.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\_base\SO0_<%=_aux_table.Name%>.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\_base\RO0_<%=_aux_table.Name%>.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\_base\DO0_<%=_aux_table.Name%>.cs" subtype="Code" buildaction="Compile" dependson="" data="" />
    <File name=".\DO_<%=_aux_table.Name%>.cs" subtype="Code" buildaction="Compile" dependson="" data="" /><%
    }%>
  </Contents>
  <References>
    <Reference type="Gac" refto="OGen.lib.datalayer, Culture=neutral, PublicKeyToken=3fdbdf93aae6f6cf" localcopy="True" />
    <Reference type="Gac" refto="OGen.NTier.lib.datalayer, Culture=neutral, PublicKeyToken=5809687291b9bca7" localcopy="True" />
  </References>
  <DeploymentInformation target="" script="" strategy="File" />
  <Configuration runwithwarnings="True" name="Debug">
    <CodeGeneration runtime="MsNet" compiler="Csc" compilerversion="" warninglevel="4" nowarn="" includedebuginformation="True" optimize="False" unsafecodeallowed="False" generateoverflowchecks="True" mainclass="" target="Library" definesymbols="" generatexmldocumentation="True" win32Icon="" noconfig="False" nostdlib="False" />
    <Execution commandlineparameters="" consolepause="False" />
    <Output directory=".\bin\Debug" assembly="<%=_aux_metadata.Namespace%>.lib.datalayer" executeScript="" executeBeforeBuild="" executeAfterBuild="" executeBeforeBuildArguments="" executeAfterBuildArguments="" />
  </Configuration>
  <Configurations active="Debug">
    <Configuration runwithwarnings="True" name="Debug">
      <CodeGeneration runtime="MsNet" compiler="Csc" compilerversion="" warninglevel="4" nowarn="" includedebuginformation="True" optimize="False" unsafecodeallowed="False" generateoverflowchecks="True" mainclass="" target="Library" definesymbols="" generatexmldocumentation="True" win32Icon="" noconfig="False" nostdlib="False" />
      <Execution commandlineparameters="" consolepause="False" />
      <Output directory=".\bin\Debug" assembly="<%=_aux_metadata.Namespace%>.lib.datalayer" executeScript="" executeBeforeBuild="" executeAfterBuild="" executeBeforeBuildArguments="" executeAfterBuildArguments="" />
    </Configuration>
    <Configuration runwithwarnings="True" name="Release">
      <CodeGeneration runtime="MsNet" compiler="Csc" compilerversion="" warninglevel="4" nowarn="" includedebuginformation="False" optimize="True" unsafecodeallowed="False" generateoverflowchecks="False" mainclass="" target="Library" definesymbols="" generatexmldocumentation="False" win32Icon="" noconfig="False" nostdlib="False" />
      <Execution commandlineparameters="" consolepause="False" />
      <Output directory=".\bin\Release" assembly="<%=_aux_metadata.Namespace%>.lib.datalayer" executeScript="" executeBeforeBuild="" executeAfterBuild="" executeBeforeBuildArguments="" executeAfterBuildArguments="" />
    </Configuration>
  </Configurations>
</Project>