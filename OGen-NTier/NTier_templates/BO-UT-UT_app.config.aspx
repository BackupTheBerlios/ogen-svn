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
<%@ import namespace="OGen.NTier.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
cDBMetadata _aux_metadata = new cDBMetadata();
_aux_metadata.LoadState_fromFile(_arg_MetadataFilepath);

cDBMetadata_DB _aux_db;
#endregion
//-----------------------------------------------------------------------------------------
%><configuration>
	<appSettings><%
		_aux_db = _aux_metadata.DBs.Default;%>
		<add key="DBServerType" value="<%=_aux_db.DBServerType.ToString()%>" />
<%		for (int d = 0; d < _aux_metadata.DBs.Count; d++) {
			_aux_db = _aux_metadata.DBs[d];%>
		<add key="<%=_aux_metadata.ApplicationName%>-<%=_aux_db.DBServerType.ToString()%>-<%=_aux_db.ConfigMode%>" value="<%=_aux_db.Connectionstring%>"/><%
		}%>

		<add key="Some_UT_config" value="tweak it here" />
	</appSettings>
</configuration><%
//-----------------------------------------------------------------------------------------
%>