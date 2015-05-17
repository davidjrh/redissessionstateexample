<%@ Page Language="C#" %>
<html>
<body>
    <h1>Redis Session State Example</h1>
<%
    if (string.IsNullOrEmpty((string) HttpContext.Current.Session["SessionStart"]))
    {        
        HttpContext.Current.Session["SessionStart"] = DateTime.Now.ToString();        
    }
%>        
    <div>
        <p>Current role ID: <% = Environment.GetEnvironmentVariable("RoleInstanceId") %></p>
        <p>The session started at: <% = HttpContext.Current.Session["SessionStart"] %></p>
        <p>Current datetime is: <% = DateTime.Now %></p>    
    </div>
</body>
</html>
