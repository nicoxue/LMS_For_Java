<%-- 
    Document   : manager_ok
    Created on : 2015-4-18, 15:51:15
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operation Success!</title>
    </head>
    <body>
        <%int para = Integer.parseInt(request.getParameter("para"));
            switch (para) {
                case 1:
        %>
        <script language="javascript">
            alert("Add administrator success!");
            opener.location.reload();
            window.close();
        </script>	
        <%	break;
            case 2:
        %>
        <script language="javascript">
            alert("Set authorization success!");
            opener.location.reload();
            window.close();
        </script>		
        <%	break;
            case 3:
        %>
        <script language="javascript">
            alert("Delete administrator Success!");
            window.location.href = "manager.do?action=managerQuery";
        </script>		
        <%	break;
            }
        %>
    </body>
</html>
