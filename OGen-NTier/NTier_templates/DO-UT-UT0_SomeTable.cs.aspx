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
string arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
string arg_TableName = System.Web.HttpUtility.UrlDecode(Request.QueryString["TableName"]);
#endregion

#region varaux...
cDBMetadata aux_metadata = new cDBMetadata();
aux_metadata.LoadState_fromFile(arg_MetadataFilepath);
cDBMetadata_Table aux_table = aux_metadata.Tables[arg_TableName];
int aux_table_hasidentitykey = aux_table.hasIdentityKey();
bool aux_table_searches_hasexplicituniqueindex = aux_table.Searches.hasExplicitUniqueIndex();

cDBMetadata_Table_Field aux_field;
string aux_field_name;
cDBMetadata_Update aux_update;
int firstKey = aux_table.firstKey();
#endregion
//-----------------------------------------------------------------------------------------
if ((aux_metadata.CopyrightText != string.Empty) && (aux_metadata.CopyrightTextLong != string.Empty)) {
%>#region <%=aux_metadata.CopyrightText%>
/*

<%=aux_metadata.CopyrightTextLong%>

*/
#endregion
<%
}%>using System;
using System.Data;
using NUnit.Framework;

using <%=aux_metadata.Namespace%>.lib.datalayer;

namespace <%=aux_metadata.Namespace%>.lib.datalayer.UTs {
	public class UT0_<%=aux_table.Name%> { public UT0_<%=aux_table.Name%>() {}

		#region protected Properties...
		#endregion

		[Test]
		public void UT_<%=(aux_table_hasidentitykey != -1) ? "Ins" : "Set"%>GetDelSequence() {
			DO_<%=aux_table.Name%> _<%=aux_table.Name.ToLower()%>;
			try {
				_<%=aux_table.Name.ToLower()%> = new DO_<%=aux_table.Name%>();
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to instantiate DO_<%=aux_table.Name%>\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			_<%=aux_table.Name.ToLower()%>.Connection.Open();
			_<%=aux_table.Name.ToLower()%>.Connection.Transaction.Begin();


<%



			for (int f = 0; f < aux_table.Fields.Count; f++) {
				if (f == aux_table_hasidentitykey) continue;
				aux_field = aux_table.Fields[f];%><%=""%>
			_<%=aux_table.Name.ToLower()%>.<%=aux_field.Name%> = <%=aux_field.DBType_generic.FWUnitTestValue%>;<%
			}



			if (aux_table_hasidentitykey != -1) {
				if (!aux_table_searches_hasexplicituniqueindex) {
					aux_field = aux_table.Fields[aux_table_hasidentitykey];%><%=""%>
			<%=aux_field.DBType_generic.FWType%> _<%=aux_field.Name.ToLower()%>;
			try {
				_<%=aux_field.Name.ToLower()%> = _<%=aux_table.Name.ToLower()%>.insObject(true);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error running insObject\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			Assert.IsTrue(_<%=aux_field.Name.ToLower()%> > 0L, "failed to retrieve identity seed (insObject)");
			_<%=aux_table.Name.ToLower()%>.clrObject();
			bool _exists;
			try {
				_exists = _<%=aux_table.Name.ToLower()%>.getObject(_<%=aux_field.Name.ToLower()%>);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error running getObject\n---\n{0}\n---", e.Message);
				return; // no need...
			}
			Assert.IsTrue(_exists, "can't read inserted item (getObject)");<%
					for (int f = 0; f < aux_table.Fields.Count; f++) {
						if (f == aux_table_hasidentitykey) continue;
						aux_field = aux_table.Fields[f];%><%=""%>
			Assert.AreEqual(<%=aux_field.DBType_generic.FWUnitTestValue%>, _<%=aux_table.Name.ToLower()%>.<%=aux_field.Name%>, "inserted values difer those just read (insObject/getObject)");<%
					}
					aux_field = aux_table.Fields[aux_table_hasidentitykey];%>
			try {
				_<%=aux_table.Name.ToLower()%>.delObject(_<%=aux_field.Name.ToLower()%>);
			} catch (Exception e) {
				Assert.IsTrue(false, "some error trying to delete (delObject)\n---\n{0}\n---", e.Message);
				return; // no need...
			}<%



				} else {%>
			// handle Constraints // ToDos: here!<%
				}
			} else {%>
			// setObject(); // ToDos: here!<%
			}



			%>



			_<%=aux_table.Name.ToLower()%>.Connection.Transaction.Rollback();
			_<%=aux_table.Name.ToLower()%>.Connection.Transaction.Terminate();
			_<%=aux_table.Name.ToLower()%>.Connection.Close();
			_<%=aux_table.Name.ToLower()%>.Dispose(); _<%=aux_table.Name.ToLower()%> = null;
		}
	}
}<%
//-----------------------------------------------------------------------------------------
%>