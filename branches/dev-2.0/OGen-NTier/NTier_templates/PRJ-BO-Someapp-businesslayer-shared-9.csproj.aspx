<%--

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

--%><%@ Page language="c#" contenttype="text/html" %>
<%@ import namespace="OGen.lib.datalayer" %>
<%@ import namespace="OGen.NTier.lib.metadata" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataExtended" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataDB" %>
<%@ import namespace="OGen.NTier.lib.metadata.metadataBusiness" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
bool _arg_gac = bool.Parse(System.Web.HttpUtility.UrlDecode(Request.QueryString["GAC"]));
string _arg_ogenpath = System.Web.HttpUtility.UrlDecode(Request.QueryString["OGenPath"]);
#endregion

#region varaux...
XS__RootMetadata _aux_root_metadata = XS__RootMetadata.Load_fromFile(
	_arg_MetadataFilepath, 
	true
);
XS__metadataDB _aux_db_metadata = _aux_root_metadata.MetadataDBCollection[0];
XS__metadataExtended _aux_ex_metadata = _aux_root_metadata.MetadataExtendedCollection[0];
XS__metadataBusiness _aux_business_metadata = _aux_root_metadata.MetadataBusinessCollection[0];

OGen.NTier.lib.metadata.metadataBusiness.XS_classType _aux_class;

//// IMPORTANT: keep in mind this is a microsoft visual studio project file, 
//// so forget about System.IO.Path.Combine, System.IO.Path.DirectorySeparatorChar, or any other such aproach
string _aux_path = ""; // _arg_ogenpath + @"\..\..";
string[] _aux_path_items = _arg_ogenpath.Split('\\');
for (int i = 0; i < _aux_path_items.Length - 2; i++) {
	_aux_path += ((i != 0) ? "\\" : "") + _aux_path_items[i];
}
//// Visual Studio 2008 handles absolute project paths badly, hence the fallowing being commented
//string _aux_path4_ntier_businesslayer = "NTier_businesslayer-9.csproj"; // _aux_path + @"\OGen-NTier\NTier_businesslayer\NTier_businesslayer-9.csproj";
//string _aux_path4_ogen_datalayer__base = "OGen_datalayer__base-9.csproj"; // _aux_path + @"\OGen\OGen_datalayer__base\OGen_datalayer__base-9.csproj";
string _aux_path4_ntier_datalayer_proxy = "NTier_datalayer_proxy-9.csproj"; // _aux_path + @"\OGen-NTier\NTier_datalayer_proxy\NTier_datalayer_proxy-9.csproj";

string _aux_no_gac = (_arg_gac) ? "" : "-no-gac";
#endregion
//-----------------------------------------------------------------------------------------
%><?xml version="1.0" encoding="utf-8"?><%
if (_aux_ex_metadata.CopyrightTextLong != string.Empty) {%>
<!--

<%=_aux_ex_metadata.CopyrightTextLong%>

--><%
} else if (_aux_ex_metadata.CopyrightText != string.Empty) {%>
<!--

<%=_aux_ex_metadata.CopyrightText%>

--><%
}%>
<Project ToolsVersion="3.5" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProductVersion>9.0.30729</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{<%=_aux_ex_metadata.GUID_businesslayer_shared%>}</ProjectGuid>
    <OutputType>Library</OutputType>
    <AppDesignerFolder>Properties</AppDesignerFolder>
    <RootNamespace><%=_aux_ex_metadata.ApplicationNamespace%>.lib.businesslayer.shared</RootNamespace>
    <AssemblyName><%=_aux_ex_metadata.ApplicationNamespace%>.lib.businesslayer.shared-2.0</AssemblyName>
    <TargetFrameworkVersion>v2.0</TargetFrameworkVersion>
    <FileAlignment>512</FileAlignment>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugSymbols>true</DebugSymbols>
    <DebugType>full</DebugType>
    <Optimize>false</Optimize>
    <OutputPath>bin\Debug\</OutputPath>
    <DefineConstants>TRACE;DEBUG;NET_2_0</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>pdbonly</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release\</OutputPath>
    <DefineConstants>TRACE;NET_2_0</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <WarningLevel>4</WarningLevel>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Xml" /><%
if (_arg_gac) {%>
    <Reference Include="OGen.NTier.lib.datalayer.proxy-2.0">
      <Name>OGen.NTier.lib.datalayer.proxy-2.0</Name>
      <AssemblyFolderKey>hklm\dn\ogen</AssemblyFolderKey>
    </Reference><%
}%>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Properties\AssemblyInfo.cs" /><%
for (int i = 0; i < _aux_business_metadata.Classes.ClassCollection.Count; i++) {
	_aux_class = _aux_business_metadata.Classes.ClassCollection[i];%>
    <Compile Include="_base\IBO0_<%=_aux_class.Name%>.cs" />
    <Compile Include="IBO_<%=_aux_class.Name%>.cs" /><%
}%>
  </ItemGroup>
  <ItemGroup><%
if (!_arg_gac) {%>
    <ProjectReference Include="<%=_aux_path4_ntier_datalayer_proxy%>">
      <Project>{F17F7FA0-920E-4AE1-908F-2798D0124996}</Project>
      <Name>NTier_datalayer_proxy-9</Name>
    </ProjectReference><%
}%>
    <ProjectReference Include="..\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures\<%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures-9<%=_aux_no_gac%>.csproj">
      <Project>{<%=_aux_ex_metadata.GUID_businesslayer_structures%>}</Project>
      <Name><%=_aux_ex_metadata.ApplicationName%>-businesslayer-structures-9<%=_aux_no_gac%></Name>
    </ProjectReference>
    <ProjectReference Include="..\<%=_aux_ex_metadata.ApplicationName%>-datalayer-structures\<%=_aux_ex_metadata.ApplicationName%>-datalayer-structures-9<%=_aux_no_gac%>.csproj">
      <Project>{<%=_aux_ex_metadata.GUID_datalayer_structures%>}</Project>
      <Name><%=_aux_ex_metadata.ApplicationName%>-datalayer-structures-9<%=_aux_no_gac%></Name>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildToolsPath)\Microsoft.CSharp.targets" />
  <!-- To modify your build process, add your task inside one of the targets below and uncomment it. 
       Other similar extension points exist, see Microsoft.Common.targets.
  <Target Name="BeforeBuild">
  </Target>
  <Target Name="AfterBuild">
  </Target>
  -->
</Project>