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
%><VisualStudioProject>
    <CSHARP
        ProjectType = "Local"
        ProductVersion = "7.10.3077"
        SchemaVersion = "2.0"
        ProjectGuid = "{<%=_aux_metadata.GUIDTest%>}"
    >
        <Build>
            <Settings
                ApplicationIcon = ""
                AssemblyKeyContainerName = ""
                AssemblyName = "<%=_aux_metadata.Namespace%>.test"
                AssemblyOriginatorKeyFile = ""
                DefaultClientScript = "JScript"
                DefaultHTMLPageLayout = "Grid"
                DefaultTargetSchema = "IE50"
                DelaySign = "false"
                OutputType = "Exe"
                PreBuildEvent = ""
                PostBuildEvent = ""
                RootNamespace = "<%=_aux_metadata.Namespace%>.test"
                RunPostBuildEvent = "OnBuildSuccess"
                StartupObject = ""
            >
                <Config
                    Name = "Debug"
                    AllowUnsafeBlocks = "false"
                    BaseAddress = "285212672"
                    CheckForOverflowUnderflow = "false"
                    ConfigurationOverrideFile = ""
                    DefineConstants = "DEBUG;TRACE"
                    DocumentationFile = ""
                    DebugSymbols = "true"
                    FileAlignment = "4096"
                    IncrementalBuild = "false"
                    NoStdLib = "false"
                    NoWarn = ""
                    Optimize = "false"
                    OutputPath = "bin\Debug\"
                    RegisterForComInterop = "false"
                    RemoveIntegerChecks = "false"
                    TreatWarningsAsErrors = "false"
                    WarningLevel = "4"
                />
                <Config
                    Name = "Release"
                    AllowUnsafeBlocks = "false"
                    BaseAddress = "285212672"
                    CheckForOverflowUnderflow = "false"
                    ConfigurationOverrideFile = ""
                    DefineConstants = "TRACE"
                    DocumentationFile = ""
                    DebugSymbols = "false"
                    FileAlignment = "4096"
                    IncrementalBuild = "false"
                    NoStdLib = "false"
                    NoWarn = ""
                    Optimize = "true"
                    OutputPath = "bin\Release\"
                    RegisterForComInterop = "false"
                    RemoveIntegerChecks = "false"
                    TreatWarningsAsErrors = "false"
                    WarningLevel = "4"
                />
            </Settings>
            <References>
                <Reference
                    Name = "System"
                    AssemblyName = "System"
                    HintPath = "C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\System.dll"
                />
                <Reference
                    Name = "System.Data"
                    AssemblyName = "System.Data"
                    HintPath = "C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\System.Data.dll"
                />
                <Reference
                    Name = "System.XML"
                    AssemblyName = "System.XML"
                    HintPath = "C:\WINDOWS\Microsoft.NET\Framework\v1.1.4322\System.XML.dll"
                />
                <Reference
                    Name = "OGen.lib.datalayer"
                    AssemblyName = "OGen.lib.datalayer"
                    AssemblyFolderKey = "hklm\dn\ogen"
                />
                <Reference
                    Name = "OGen.NTier.lib.businesslayer"
                    AssemblyName = "OGen.NTier.lib.businesslayer"
                    AssemblyFolderKey = "hklm\dn\ogen"
                />
                <Reference
                    Name = "OGen.NTier.lib.datalayer"
                    AssemblyName = "OGen.NTier.lib.datalayer"
                    AssemblyFolderKey = "hklm\dn\ogen"
                />
                <Reference
                    Name = "<%=_aux_metadata.ApplicationName%>_businesslayer"
                    Project = "{<%=_aux_metadata.GUIDBusinesslayer%>}"
                    Package = "{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}"
                />
                <Reference
                    Name = "<%=_aux_metadata.ApplicationName%>_datalayer"
                    Project = "{<%=_aux_metadata.GUIDDatalayer%>}"
                    Package = "{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}"
                />
            </References>
        </Build>
        <Files>
            <Include>
                <File
                    RelPath = "app.config"
                    BuildAction = "None"
                />
                <File
                    RelPath = "AssemblyInfo.cs"
                    SubType = "Code"
                    BuildAction = "Compile"
                />
                <File
                    RelPath = "MainClass.cs"
                    SubType = "Code"
                    BuildAction = "Compile"
                />
            </Include>
        </Files>
    </CSHARP>
</VisualStudioProject>