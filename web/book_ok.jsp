<%-- 
    Document   : book_ok
    Created on : 2015-4-17, 22:16:01
    Author     : xuejie87
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Operation Success !</title>
    </head>
    <body>
        <%int para = Integer.parseInt(request.getParameter("para"));
            switch (para) {
                case 1:
        %>
        <script language="javascript">
            alert("Add Book Info Success!");
            window.location.href = "book.do?action=bookQuery";
        </script>	
        <%	break;
            case 2:
        %>
        <script language="javascript">
            alert("Modify Book Info Success!");
            window.location.href = "book.do?action=bookQuery";
        </script>		
        <%	break;
            case 3:
        %>
        <script language="javascript">
            alert("Delete Book Info Success!");
            window.location.href = "book.do?action=bookQuery";
        </script>		
        <%	break;
            }
        %>
    </body>
</html>
