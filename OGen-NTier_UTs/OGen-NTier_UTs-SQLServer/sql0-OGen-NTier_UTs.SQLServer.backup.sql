<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.17.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.0.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.0.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.0.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_setObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_setobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.0.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 39: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.8.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 46: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 47: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 48: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 49: }%&gt;
Line 50: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 48
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx:48
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx:line 48
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.1.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE FUNCTION [dbo].[fnc_Config_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[Name]
	FROM [Config]/*
	WHERE*/
--GO


CREATE FUNCTION [dbo].[fnc_User_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [User]/*
	WHERE*/
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 46: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 47: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 48: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 49: 	}%&gt;
Line 50: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 48
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:48
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:line 48
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.37.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 46: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 47: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 48: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 49: 	}%&gt;
Line 50: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 48
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:48
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:line 48
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.37.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE FUNCTION [dbo].[fnc_vUserDefaultGroup_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [vUserDefaultGroup]/*
	WHERE*/
--GO


CREATE PROCEDURE [dbo].[sp_Config_Record_open_all]
AS
	SELECT
		t1.[Name]
	FROM [Config] t1
	INNER JOIN [dbo].[fnc_Config_Record_open_all](
	) t2 ON (
		(t2.[Name] = t1.[Name])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_Config_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp_User_Record_open_all]
AS
	SELECT
		t1.[IDUser]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_all](
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 43: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 44: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 45: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 46: 	}%&gt;
Line 47: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 45
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:45
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:line 45
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.25.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 43: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 44: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 45: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 46: 	}%&gt;
Line 47: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 45
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:45
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp_SomeTable_Record_open_bySomeCriteria-SQLServer.sql.aspx:line 45
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp_sometable_record_open_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.25.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE PROCEDURE [dbo].[sp_vUserDefaultGroup_Record_open_all]
AS
	SELECT
		t1.[IDUser]
	FROM [vUserDefaultGroup] t1
	INNER JOIN [dbo].[fnc_vUserDefaultGroup_Record_open_all](
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt; OUT&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.2.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 43: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_getobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_getobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_getObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_getobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.30.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 51: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 52: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 53: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 54: 	}%&gt;
Line 55: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 53
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:53
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:line 53
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.34.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 51: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 52: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 53: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 54: 	}%&gt;
Line 55: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 53
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:53
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:line 53
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.34.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 47: 	}%&gt;
Line 48: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.34.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 47: 	}%&gt;
Line 48: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.34.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 51: 	for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 52: 		_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 53: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 54: 	}%&gt;
Line 55: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 53
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:53
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_fullmode-SQLServer.sql.aspx:line 53
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.34.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.42.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.42.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 47: 	}%&gt;
Line 48: 	@page_ Int,</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.42.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 47: 	}%&gt;
Line 48: 	@page_ Int,</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.42.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.42.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.19.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.19.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 47: 	}%&gt;
Line 48: 	@page_ Int,</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.19.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 44: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 45: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 46: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 47: 	}%&gt;
Line 48: 	@page_ Int,</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 46
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:46
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:line 46
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.19.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 60: 		for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 61: 			_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 62: 		[&lt;%=_aux_field.Name%&gt;] &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 63: 		}%&gt;
Line 64: 	)</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 62
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:62
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_open_bySomeCriteria_page_fullmode-SQLServer.sql.aspx:line 62
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_open_bysomecriteria_page_fullmode_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.19.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 45: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 46: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 47: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 48: }
Line 49: for (int f = 0; f &lt; update.UpdateParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 47
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx:47
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx:line 47
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.7.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 45: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 46: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 47: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 48: }
Line 49: for (int f = 0; f &lt; update.UpdateParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 47
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx:47
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_update_SomeUpdate_bySomeCriteria-SQLServer.sql.aspx:line 47
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_update_someupdate_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.7.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 38: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 39: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 40: 	@&lt;%=_aux_field.Name%&gt; &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 41: 	}%&gt;
Line 42: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable__ConstraintExist-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 40
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable__constraintexist_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable__ConstraintExist-SQLServer.sql.aspx:40
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable__constraintexist_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable__ConstraintExist-SQLServer.sql.aspx:line 40
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable__constraintexist_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.36.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 43: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: 	}%&gt;
Line 46: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_isObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_isobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.16.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE FUNCTION [dbo].[fnc0_Config_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([Name])
	FROM [dbo].[fnc_Config_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_User_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 41: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 42: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 43: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 44: 	}%&gt;
Line 45: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 43
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx:43
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx:line 43
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.6.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 41: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 42: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 43: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 44: 	}%&gt;
Line 45: )</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 43
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx:43
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_count_bySomeCriteria-SQLServer.sql.aspx:line 43
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_count_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.6.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE FUNCTION [dbo].[fnc0_vUserDefaultGroup_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_vUserDefaultGroup_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_search.SearchParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.55.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_search.SearchParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.55.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_search.SearchParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.55.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_search.SearchParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.55.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(k != _aux_table.Fields_onlyPK.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; _aux_search.SearchParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-fnc0_SomeTable_Record_hasObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_fnc0_sometable_record_hasobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.55.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 39: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 40: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 41: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.isIdentity) ? &quot; OUT&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 42: 	}%&gt;
Line 43: 	@SelectIdentity_ Bit</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 41
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:41
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_insObject-SQLServer.sql.aspx:line 41
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_insobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.32.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 40: 	for (int f = 0; f &lt; _aux_table.Fields.Count; f++) {
Line 41: 		_aux_field = _aux_table.Fields[f];%&gt;
<font color=red>Line 42: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_table.Fields.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 43: 	}%&gt;&lt;%
Line 44: 	if (_aux_table_searches_hasexplicituniqueindex) {%&gt;, </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 42
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:42
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject-SQLServer.sql.aspx:line 42
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.28.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: 		_aux_field = _aux_search.SearchParameters[f].Field;
Line 43: 		_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 45: 	}%&gt;
Line 46: </pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_delobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject_bySomeCriteria-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_delobject_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_delObject_bySomeCriteria-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_delobject_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.41.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->CREATE PROCEDURE [dbo].[sp0_Config_Record_delete_all]
AS
	DELETE [Config]
	FROM [Config] t1
	INNER JOIN [dbo].[fnc_Config_Record_open_all](
	) t2 ON
		(t2.[Name] = t1.[Name])
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_delete_all]
AS
	DELETE [User]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_all](
	) t2 ON
		(t2.[IDUser] = t1.[IDUser])
--GO


<html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 43: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 44: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 45: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 46: }%&gt;
Line 47: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 45
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx:45
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx:line 45
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.24.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 43: 	_aux_field = _aux_search.SearchParameters[f].Field;
Line 44: 	_aux_field_name = _aux_search.SearchParameters[f].ParamName;%&gt;
<font color=red>Line 45: 	@&lt;%=_aux_field_name%&gt;_search_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(f != _aux_search.SearchParameters.Count - 1) ? &quot;, &quot; : &quot;&quot;%&gt;&lt;%
</font>Line 46: }%&gt;
Line 47: AS</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 45
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx:45
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_Record_delete_bySomeCriteria-SQLServer.sql.aspx:line 45
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_record_delete_bysomecriteria_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_b0gfvt4y.24.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
--><html>
    <head>
        <title>Object reference not set to an instance of an object.</title>
        <style>
         body {font-family:"Verdana";font-weight:normal;font-size: .7em;color:black;} 
         p {font-family:"Verdana";font-weight:normal;color:black;margin-top: -5px}
         b {font-family:"Verdana";font-weight:bold;color:black;margin-top: -5px}
         H1 { font-family:"Verdana";font-weight:normal;font-size:18pt;color:red }
         H2 { font-family:"Verdana";font-weight:normal;font-size:14pt;color:maroon }
         pre {font-family:"Lucida Console";font-size: .9em}
         .marker {font-weight: bold; color: black;text-decoration: none;}
         .version {color: gray;}
         .error {margin-bottom: 10px;}
         .expandable { text-decoration:underline; font-weight:bold; color:navy; cursor:hand; }
        </style>
    </head>

    <body bgcolor="white">

            <span><H1>Server Error in '/' Application.<hr width=100% size=1 color=silver></H1>

            <h2> <i>Object reference not set to an instance of an object.</i> </h2></span>

            <font face="Arial, Helvetica, Geneva, SunSans-Regular, sans-serif ">

            <b> Description: </b>An unhandled exception occurred during the execution of the current web request. Please review the stack trace for more information about the error and where it originated in the code.

            <br><br>

            <b> Exception Details: </b>System.NullReferenceException: Object reference not set to an instance of an object.<br><br>

            <b>Source Error:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

Line 42: for (int k = 0; k &lt; _aux_table.Fields_onlyPK.Count; k++) {
Line 43: 	_aux_field = _aux_table.Fields_onlyPK[k];%&gt;
<font color=red>Line 44: 	@&lt;%=_aux_field.Name%&gt;_ &lt;%=_aux_field.DBs[_aux_dbservertype].DBType_inDB_name%&gt;&lt;%=(_aux_field.isText) ? &quot; (&quot; + _aux_field.Size + &quot;)&quot; : &quot;&quot;%&gt;&lt;%=(_aux_field.Numeric_Scale &gt; 0) ? &quot; (&quot; + _aux_field.Numeric_Precision + &quot;, &quot; + _aux_field.Numeric_Scale + &quot;)&quot; : &quot;&quot;%&gt;, &lt;%
</font>Line 45: }
Line 46: for (int f = 0; f &lt; aux_update.UpdateParameters.Count; f++) {</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <b> Source File: </b> c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject_SomeUpdate-SQLServer.sql.aspx<b> &nbsp;&nbsp; Line: </b> 44
            <br><br>

            <b>Stack Trace:</b> <br><br>

            <table width=100% bgcolor="#ffffcc">
               <tr>
                  <td>
                      <code><pre>

[NullReferenceException: Object reference not set to an instance of an object.]
   ASP.do_db_sp0_sometable_updobject_someupdate_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject_SomeUpdate-SQLServer.sql.aspx:44
   System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children) +98
   System.Web.UI.Control.RenderChildren(HtmlTextWriter writer) +21
   System.Web.UI.Page.Render(HtmlTextWriter writer) +27
   System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter) +53
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter) +294
   System.Web.UI.Control.RenderControl(HtmlTextWriter writer) +24
   System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint) +7425
</pre></code>

                  </td>
               </tr>
            </table>

            <br>

            <hr width=100% size=1 color=silver>

            <b>Version Information:</b>&nbsp;Microsoft .NET Framework Version:2.0.50727.42; ASP.NET Version:2.0.50727.210

            </font>

    </body>
</html>
<!-- 
[NullReferenceException]: Object reference not set to an instance of an object.
   at ASP.do_db_sp0_sometable_updobject_someupdate_sqlserver_sql_aspx.__Render__control1(HtmlTextWriter __w, Control parameterContainer) in c:\Documents and Settings\fmonteir\My Documents\OGen.berlios.de\OGen-NTier\NTier_templates\DO-DB-sp0_SomeTable_updObject_SomeUpdate-SQLServer.sql.aspx:line 44
   at System.Web.UI.Control.RenderChildrenInternal(HtmlTextWriter writer, ICollection children)
   at System.Web.UI.Control.RenderChildren(HtmlTextWriter writer)
   at System.Web.UI.Page.Render(HtmlTextWriter writer)
   at System.Web.UI.Control.RenderControlInternal(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer, ControlAdapter adapter)
   at System.Web.UI.Control.RenderControl(HtmlTextWriter writer)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
[HttpUnhandledException]: Exception of type 'System.Web.HttpUnhandledException' was thrown.
   at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.do_db_sp0_sometable_updobject_someupdate_sqlserver_sql_aspx.ProcessRequest(HttpContext context) in c:\WINDOWS\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files\root\704fe456\46c4e788\App_Web_kds7iq05.26.cs:line 0
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
-->