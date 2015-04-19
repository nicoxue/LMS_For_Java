<%-- 
    Document   : reader_ok
    Created on : 2015-4-17, 23:51:39
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
            alert("Add Reader Info Success!");
            window.location.href = "reader.do?action=readerQuery";
        </script>	
        <%	break;
            case 2:
        %>
        <script language="javascript">
            alert("Modify Reader Info Success!");
            window.location.href = "reader.do?action=readerQuery";
        </script>		
        <%	break;
            case 3:
        %>
        <script language="javascript">
            alert("Delete Reader Info Success!");
            window.location.href = "reader.do?action=readerQuery";
        </script>		
        <%	break;
            }
        %>
    </body>
</html>
