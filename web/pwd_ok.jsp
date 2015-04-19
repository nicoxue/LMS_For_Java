<%-- 
    Document   : pwd_ok
    Created on : 2015-4-17, 23:47:11
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
        <script language="javascript">
            alert("Change Password Success!");
            window.location.href = "manager.do?action=querypwd";
        </script>	
    </body>
</html>
