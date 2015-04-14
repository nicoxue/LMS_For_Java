<%-- 
    Document   : logout
    Created on : 14-Apr-2015, 3:06:16 PM
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            out.println("<script language='javascript'>");
            out.println("window.location.href='login.jsp'");
            out.println("</script>");
        %>	
    </body>
</html>
