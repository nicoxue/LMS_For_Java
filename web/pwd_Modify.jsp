<%-- 
    Document   : pwd_Modify
    Created on : 2015-4-17, 23:46:56
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="Form.ManagerForm" %>
<!DOCTYPE html>
<html>
    <%
        ManagerForm managerForm = (ManagerForm) request.getAttribute("pwdQueryif");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
        <script language="javascript">
            function checkForm(form) {
                if (form.oldpwd.value == "") {
                    alert("Please enter original password!");
                    form.oldpwd.focus();
                    return false;
                }
                if (form.oldpwd.value != form.holdpwd.value) {
                    alert("Wrong original password,please enter again!");
                    form.oldpwd.value = "";
                    form.oldpwd.focus();
                    return false;
                }
                if (form.pwd.value == "") {
                    alert("Please enter new password!");
                    form.pwd.focus();
                    return false;
                }
                if (form.pwd1.value == "") {
                    alert("Please confirm new password!");
                    form.pwd1.focus();
                    return false;
                }
                if (form.pwd.value != form.pwd1.value) {
                    alert("Two password is different,please confirm!");
                    form.pwd.value = "";
                    form.pwd1.value = "";
                    form.pwd.focus();
                    return false;
                }
            }
        </script>
    </head>
    <body onLoad="clockon(bgclock)">
        <%@include file="loginif_check.jsp"%>
        <%@include file="navigation.jsp"%>
        <table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;">
                                <table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">Now: Change Password &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="84%">&nbsp;      </td>
                                                </tr>
                                            </table>  
                                            <form name="form1" method="post" action="manager.do?action=modifypwd">
                                                <table width="47%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
                                                    <tr align="center">
                                                        <td width="27%" align="left" style="padding:5px;">Administrator Name:</td>
                                                        <td width="73%" align="left">
                                                            <input name="name" type="text" id="name" value="<%=managerForm.getName()%>" readonly="yes" size="30">
                                                        </td>
                                                    <tr>
                                                        <td align="left" style="padding:5px;">Original Password:</td>
                                                        <td align="left"><input name="oldpwd" type="password" id="oldpwd" size="30">
                                                            <input name="holdpwd" type="hidden" id="holdpwd" value="<%=managerForm.getPwd()%>">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="padding:5px;">New Password:</td>
                                                        <td align="left"><input name="pwd" type="password" id="pwd" size="30"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="padding:5px;">Confirm new password:</td>
                                                        <td align="left"><input name="pwd1" type="password" id="pwd1" size="30"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="65" align="left" style="padding:5px;">&nbsp;</td>
                                                        <td><input name="Submit" type="submit" class="btn_grey" value="Save" onClick="return checkForm(form1)">
                                                            &nbsp;
                                                            <input name="Submit2" type="reset" class="btn_grey" value="Cancel"></td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
