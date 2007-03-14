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
%><Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <ProjectType>Local</ProjectType>
    <ProductVersion>8.0.50727</ProductVersion>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{<%=_aux_metadata.GUIDDatalayer%>}</ProjectGuid>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ApplicationIcon>
    </ApplicationIcon>
    <AssemblyKeyContainerName>
    </AssemblyKeyContainerName>
    <AssemblyName><%=_aux_metadata.Namespace%>.lib.datalayer</AssemblyName>
    <AssemblyOriginatorKeyFile>
    </AssemblyOriginatorKeyFile>
    <DefaultClientScript>JScript</DefaultClientScript>
    <DefaultHTMLPageLayout>Grid</DefaultHTMLPageLayout>
    <DefaultTargetSchema>IE50</DefaultTargetSchema>
    <DelaySign>false</DelaySign>
    <OutputType>Library</OutputType>
    <RootNamespace><%=_aux_metadata.Namespace%>.lib.datalayer</RootNamespace>
    <RunPostBuildEvent>OnBuildSuccess</RunPostBuildEvent>
    <StartupObject>
    </StartupObject>
    <FileUpgradeFlags>
    </FileUpgradeFlags>
    <UpgradeBackupLocation>
    </UpgradeBackupLocation>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <OutputPath>bin\Debug\</OutputPath>
    <AllowUnsafeBlocks>false</AllowUnsafeBlocks>
    <BaseAddress>285212672</BaseAddress>
    <CheckForOverflowUnderflow>false</CheckForOverflowUnderflow>
    <ConfigurationOverrideFile>
    </ConfigurationOverrideFile>
    <DefineConstants>TRACE;DEBUG;NET20</DefineConstants>
    <DocumentationFile>bin\Debug\<%=_aux_metadata.Namespace%>.lib.datalayer.xml</DocumentationFile>
    <DebugSymbols>true</DebugSymbols>
    <FileAlignment>4096</FileAlignment>
    <NoStdLib>false</NoStdLib>
    <NoWarn>
    </NoWarn>
    <Optimize>false</Optimize>
    <RegisterForComInterop>false</RegisterForComInterop>
    <RemoveIntegerChecks>false</RemoveIntegerChecks>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <WarningLevel>4</WarningLevel>
    <DebugType>full</DebugType>
    <ErrorReport>prompt</ErrorReport>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <OutputPath>bin\Release\</OutputPath>
    <AllowUnsafeBlocks>false</AllowUnsafeBlocks>
    <BaseAddress>285212672</BaseAddress>
    <CheckForOverflowUnderflow>false</CheckForOverflowUnderflow>
    <ConfigurationOverrideFile>
    </ConfigurationOverrideFile>
    <DefineConstants>TRACE;NET20</DefineConstants>
    <DocumentationFile>
    </DocumentationFile>
    <DebugSymbols>false</DebugSymbols>
    <FileAlignment>4096</FileAlignment>
    <NoStdLib>false</NoStdLib>
    <NoWarn>
    </NoWarn>
    <Optimize>true</Optimize>
    <RegisterForComInterop>false</RegisterForComInterop>
    <RemoveIntegerChecks>false</RemoveIntegerChecks>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <WarningLevel>4</WarningLevel>
    <DebugType>none</DebugType>
    <ErrorReport>prompt</ErrorReport>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="OGen.lib.datalayer">
      <Name>OGen.lib.datalayer</Name>
      <AssemblyFolderKey>hklm\dn\ogen</AssemblyFolderKey>
    </Reference>
    <Reference Include="OGen.NTier.lib.datalayer">
      <Name>OGen.NTier.lib.datalayer</Name>
      <AssemblyFolderKey>hklm\dn\ogen</AssemblyFolderKey>
    </Reference>
    <Reference Include="System">
      <Name>System</Name>
    </Reference>
    <Reference Include="System.Data">
      <Name>System.Data</Name>
    </Reference>
    <Reference Include="System.Xml">
      <Name>System.XML</Name>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="AssemblyInfo.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="_base\DO0__utils.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="DO__utils.cs">
      <SubType>Code</SubType>
    </Compile><%
		for (int t = 0; t < _aux_metadata.Tables.Count; t++) {
			_aux_table = _aux_metadata.Tables[t];%>
    <Compile Include="DO_<%=_aux_table.Name%>.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="_base\DO0_<%=_aux_table.Name%>.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="_base\RO0_<%=_aux_table.Name%>.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="_base\SO0_<%=_aux_table.Name%>.cs">
      <SubType>Code</SubType>
    </Compile>
    <Compile Include="_base\SC0_<%=_aux_table.Name%>.cs">
      <SubType>Code</SubType>
    </Compile><%
		}%>
  </ItemGroup>
  <Import Project="$(MSBuildBinPath)\Microsoft.CSharp.targets" />
  <PropertyGroup>
    <PreBuildEvent>
    </PreBuildEvent>
    <PostBuildEvent>
    </PostBuildEvent>
  </PropertyGroup>
</Project>