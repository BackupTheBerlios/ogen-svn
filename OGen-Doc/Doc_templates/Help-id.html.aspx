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
string _arg_IDSubject = System.Web.HttpUtility.UrlDecode(Request.QueryString["IDSubject"]);
#endregion

#region varaux...
DocMetadata _aux_doc = new DocMetadata();
_aux_doc.LoadState_fromFile(_arg_MetadataFilepath);

Subject _subject = _aux_doc.Subjects[_arg_IDSubject];
Subject _subject_parent = null;
Subject _subject_next = _subject.NextSubject();
Subject[] _howtogethere_fromroot = _subject.HowToGetHere_fromRoot();

bool _isFirst;
#endregion
//-----------------------------------------------------------------------------------------
%>
<html>
	<head>
		<title>
			<%=_aux_doc.DocumentationName%> - <%=_subject.Name%>
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
					<table cellpadding="5" cellspacing="5" width="100%" class="menu" border="0">
						<tr>
							<td align="left">
								<a href="<%=_aux_doc.ProjectURL%>">
									<%=_aux_doc.DocumentationName%></a>
								&gt;
								<a href="index.html">
									Documentation</a><%
								for (int i = 0; i < _howtogethere_fromroot.Length; i++) {
									_subject_parent = _howtogethere_fromroot[i];
									bool _same = (i > _howtogethere_fromroot.Length - 2);
									
									Response.Write(" &gt; ");
									if (!_same) {
										Response.Write(string.Format(
											"<a href='Help-{0}.html'>", 
											_subject_parent.IDSubject
										));
									} else {
										Response.Write("<b>");
									}
									
									Response.Write(_subject_parent.Name);
									if (!_same) {
										Response.Write("</a>");
									} else {
										Response.Write("</b>");
									}
								}
								if (_subject_next != null) {%>
									&gt; <a href="Help-<%=_subject_next.IDSubject%>.html">
										<%=_subject_next.Name%></a><%
								}%>
							</td>
							<td align="right">
								<%=_aux_doc.Version%></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr valign="top">
				<td colspan="3" bgcolor="#000000" height="1"></td>
			</tr><%
			if (_subject.IDSubject != "0") {%>
			<tr>
				<td width="10"></td>
				<td>
					<br>

					<span class="title"><%=_subject.Name%></span>
					<br>
					<span class="text"><%=_subject.Description%></span>

					<br>
				</td>
				<td width="10"></td>
			</tr><%
			}%>
			<tr>
				<td width="10"></td>
				<td>
					<br><%

					for (int d = 0; d < _subject.Documents.Count; d++) {%>
					<span class="text">
						<span class="subtitle"><%=_subject.Documents[d].Name%></span>
						<br>
						<%=utils.translate(_subject.Documents[d].Text, _aux_doc)%>
					</span>
					<br>
					<br><%
					}%>
				</td>
				<td width="10"></td>
			</tr>
			<tr>
				<td width="10"></td>
				<td><%
					if (
						(_subject.IDSubject != "0")
						&&
						(_subject.hasDescendants())
					) {%>
					<!--tr valign="top">
						<td></td>
						<td colspan="1" bgcolor="#000000" height="1"></td>
						<td></td>
					</tr-->
					<hr size="1"><%
						_isFirst = true;
					} else {
						_isFirst = false;
					}

					for (int s = 0; s < _aux_doc.Subjects.Count; s++) {
						if (_aux_doc.Subjects[s].IDSubject_parent == _subject.IDSubject) {
							if (_isFirst) {
								%><br><%
								_isFirst = false;
							}%>
					<span class="text">
						&gt; <a href="Help-<%=_aux_doc.Subjects[s].IDSubject%>.html"><%=_aux_doc.Subjects[s].Name%></a><br>
						<%=_aux_doc.Subjects[s].Description%>.<br>
					</span>
					<br><%
						}
					}%>
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
								<a href="mailto:<%=_aux_doc.FeedbackEmailAddress%>?subject=<%=_aux_doc.DocumentationName%>/Help-<%=_arg_IDSubject%>.html">Send comments on this topic.</a>
								<br>
								<a href="LICENSE.FDL.txt"><%=_aux_doc.CopyrightText%></a>
							</td>
							<td align="right" valign="top"><%
								if (_subject_next != null) {%>
									&gt; <a href="Help-<%=_subject_next.IDSubject%>.html">
										<%=_subject_next.Name%></a><%
								}%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>