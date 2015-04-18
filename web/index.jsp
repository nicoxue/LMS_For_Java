<%-- 
    Document   : index
    Created on : 18-Mar-2015, 2:56:56 PM
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My JSP 'index.jsp' starting page</title>

    <body>
        This is my JSP page. <br>
    </body>
</html>
