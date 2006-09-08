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
<%@ import namespace="OGen.Doc.lib.metadata" %><%
#region arguments...
string _arg_MetadataFilepath = System.Web.HttpUtility.UrlDecode(Request.QueryString["MetadataFilepath"]);
#endregion

#region varaux...
DocMetadata _aux_doc = new DocMetadata();
_aux_doc.LoadState_fromFile(_arg_MetadataFilepath);
#endregion
//-----------------------------------------------------------------------------------------
%>
<html>
	<head>
		<title>
			<%=_aux_doc.DocumentationName%> - Documentation
		</title>
		<link rel="stylesheet" href="_include/doc.css" type="text/css" />
		<script language="JavaScript" src="_include/lib_doc.js" />
	</head>
	<body
		bottommargin="0"
		topmargin="0"
		leftmargin="0"
		rightmargin="0">

		<table cellpadding="0" cellspacing="0" width="100%" border="0">
			<tr>
				<td colspan="3" bgcolor="#99CCFF">
					<table cellpadding="5" cellspacing="5" width="100%" class="menu">
						<tr>
							<td align="left">
								<a href="<%=_aux_doc.ProjectURL%>">
									<%=_aux_doc.DocumentationName%></a>
								&gt;
								<b>Documentation</b>
								&gt;
								<a href="Help-0.html">
									<%=_aux_doc.Subjects["0"].Name%></a>
							</td>
							<td align="right">
								<%=_aux_doc.Version%></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td colspan="3" bgcolor="#000000" height="1"></td>
			</tr>
			<tr>
				<td width="10"></td>
				<td>
					<br>

					<span class="text">
						&gt; <a href="Help-0.html"><%=_aux_doc.Subjects["0"].Name%></a><br>
						<%=_aux_doc.Subjects["0"].Description%><br>
					</span>
					<br>
<!--
					<span class="text">
						&gt; <a href="Articles.html">Articles</a><br>
						articles on <%=_aux_doc.DocumentationName%><br>
					</span>
					<br>

					<span class="text">
						&gt; <a href="FAQ-0.html"><%=_aux_doc.FAQSubjects["0"].Name%></a><br>
						<%=_aux_doc.FAQSubjects["0"].Description%><br>
					</span>
					<br>
-->
					<span class="text">
						&gt; <a target="_new" href="NDoc/index.html">SDK Documentation</a><br>
						software development kit on <%=_aux_doc.DocumentationName%><br>
					</span>

					<br>
				</td>
				<td width="10"></td>
			</tr>
			<tr>
				<td colspan="3" bgcolor="#000000" height="1"></td>
			</tr>
			<tr>
				<td colspan="3">
					<table cellpadding="5" cellspacing="5" width="100%" border="0">
						<tr>
							<td align="left" valign="top">
								<a href="mailto:<%=_aux_doc.FeedbackEmailAddress%>?subject=<%=_aux_doc.DocumentationName%>/index.html">Send comments on this topic.</a>
								<br>
								<a href="LICENSE.FDL.txt"><%=_aux_doc.CopyrightText%></a>
							</td>
							<td align="right" valign="top">
								&gt; <a href="Help-0.html">
									<%=_aux_doc.Subjects["0"].Name%></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
