<%/*

OGen
Copyright (C) 2002 Francisco Monteiro

This file is part of OGen.

OGen is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 2 of the License, or 
(at your option) any later version.

OGen is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the 
GNU General Public License for more details.

You should have received a copy of the GNU General Public License 
along with OGen; if not, write to the

	Free Software Foundation, Inc., 
	59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA 

							- or -

	http://www.fsf.org/licensing/licenses/gpl.txt

*/%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="System.Reflection" %>
<%@ import namespace="OGen.lib.config" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.businesslayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);

//cDBMetadata_Table aux_table;
//cDBMetadata_Table_Field aux_field;
//int aux_table_hasidentitykey;
//string[] aux_configmodes = aux_metadata.ConfigModes();
#endregion
//-----------------------------------------------------------------------------------------
%><project SchemaVersion="1.3">
    <assemblies>
        <assembly location="<%=Assembly.Load("OGen.lib.config").Location%>" documentation="<%=Assembly.Load("OGen.lib.config").Location.Substring(0, Assembly.Load("OGen.lib.config").Location.Length - 4)%>.xml" />
        <assembly location="<%=Assembly.Load("OGen.lib.datalayer").Location%>" documentation="<%=Assembly.Load("OGen.lib.datalayer").Location.Substring(0, Assembly.Load("OGen.lib.datalayer").Location.Length - 4)%>.xml" />
        <assembly location="<%=Assembly.Load("OGen.NTier.lib.datalayer").Location%>" documentation="<%=Assembly.Load("OGen.NTier.lib.datalayer").Location.Substring(0, Assembly.Load("OGen.NTier.lib.datalayer").Location.Length - 4)%>.xml" />
        <assembly location="<%=Assembly.Load("OGen.NTier.lib.businesslayer").Location%>" documentation="<%=Assembly.Load("OGen.NTier.lib.businesslayer").Location.Substring(0, Assembly.Load("OGen.NTier.lib.businesslayer").Location.Length - 4)%>.xml" />
        <assembly location=".\<%=aux_metadata.ApplicationName%>_datalayer\bin\Debug\<%=aux_metadata.Namespace%>.lib.datalayer.dll" documentation=".\<%=aux_metadata.ApplicationName%>_datalayer\bin\Debug\<%=aux_metadata.Namespace%>.lib.datalayer.xml" />
        <assembly location=".\<%=aux_metadata.ApplicationName%>_businesslayer\bin\Debug\<%=aux_metadata.Namespace%>.lib.businesslayer.dll" documentation=".\<%=aux_metadata.ApplicationName%>_businesslayer\bin\Debug\<%=aux_metadata.Namespace%>.lib.businesslayer.xml" />
    </assemblies>
    <documenters>
        <documenter name="JavaDoc">
            <property name="OutputDirectory" value=".\doc\" />
        </documenter>
        <documenter name="LaTeX">
            <property name="OutputDirectory" value=".\doc\" />
            <property name="TextFileFullName" value="Documentation.tex" />
            <property name="TexFileBaseName" value="Documentation" />
            <property name="LatexCompiler" value="latex" />
            <property name="TexFileFullPath" value=".\doc\Documentation.tex" />
        </documenter>
        <documenter name="LinearHtml">
            <property name="OutputDirectory" value=".\doc\" />
            <property name="Title" value="An NDoc Documented Class Library" />
        </documenter>
        <documenter name="MSDN">
            <property name="OutputDirectory" value=".\<%=aux_metadata.ApplicationName%>-NDoc\" />
            <property name="HtmlHelpName" value="<%=aux_metadata.ApplicationName%>" />
            <property name="Title" value="<%=aux_metadata.ApplicationName%> Programmer's Reference" />
            <property name="OutputTarget" value="Web" />
            <property name="CopyrightText" value="<%=aux_metadata.CopyrightText%>" />
            <property name="FeedbackEmailAddress" value="<%=aux_metadata.FeedbackEmailAddress%>" />
        </documenter>
        <documenter name="MSDN 2003">
            <property name="OutputDirectory" value=".\doc\" />
            <property name="Title" value="An NDoc Documented Class Library" />
        </documenter>
        <documenter name="VS.NET 2003">
            <property name="OutputDirectory" value=".\doc\" />
            <property name="HtmlHelpName" value="Documentation" />
            <property name="Title" value="An NDoc documented library" />
        </documenter>
        <documenter name="XML">
            <property name="OutputFile" value=".\doc\doc.xml" />
        </documenter>
    </documenters>
</project>