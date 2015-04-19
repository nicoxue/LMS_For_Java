<%-- 
    Document   : reader_detail
    Created on : 2015-4-17, 23:50:16
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.ReaderDAO" %>
<%@ page import="Form.ReaderForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        ReaderForm readerForm = (ReaderForm) request.getAttribute("readerDetail");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
        <script language="jscript">
            function check(form) {
                if (form.name.value == "") {
                    alert("Please enter reader name!");
                    form.name.focus();
                    return false;
                }
                if (form.paperNO.value == "") {
                    alert("Please enter visa id!");
                    form.paperNO.focus();
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
                                        <td height="22" valign="top" class="word_orange">Now: Reader Management &gt; Reader Info &gt; Reader Detail &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center" valign="top">
                                                        <%  int ID = 0;
                                                            String name = readerForm.getName();
                                                            String sex = readerForm.getSex();
                                                            String barcode = readerForm.getBarcode();
                                                            String vocation = readerForm.getVocation();
                                                            String birthday = readerForm.getBirthday();
                                                            String paperType = readerForm.getPaperType();
                                                            String paperNO = readerForm.getPaperNO();
                                                            String tel = readerForm.getTel();
                                                            String email = readerForm.getEmail();
                                                            String createDate = readerForm.getCreateDate();
                                                            String remark = readerForm.getRemark();
                                                        %>
                                                        <table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                            <tr>
                                                                <td width="173" height="30" align="center">Name:</td>
                                                                <td width="427" height="39">
                                                                    <input name="name" type="text" value="<%=name%>"> </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="173" height="30" align="center">Gender:</td>
                                                                <td height="35"><input name="name" type="text" value="<%=sex%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Bar Code:</td>
                                                                <td><input name="barcode" type="text" id="barcode" value="<%=barcode%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Vocation:</td>
                                                                <td><input name="vocation" type="text" id="vocation" value="<%=vocation%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Birth Date:</td>
                                                                <td><input name="birthday" type="text" id="birthday" value="<%=birthday%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Visa Type:</td>
                                                                <td><input name="paperType" type="text" value="<%=paperType%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Visa ID:</td>
                                                                <td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Create Date:</td>
                                                                <td><input name="paperNO2" type="text" id="paperNO2" value="<%=createDate%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Phone Number:</td>
                                                                <td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Email：</td>
                                                                <td><input name="email" type="text" id="email" value="<%=email%>" size="50">
                                                                </td>
                                                            </tr>	  
                                                            <tr>
                                                                <td align="center">Note:</td>
                                                                <td><textarea name="remark" cols="50" rows="5" class="wenbenkuang" id="remark"><%=remark%></textarea></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">&nbsp;</td>
                                                                <td>
                                                                    &nbsp;
                                                                    <input name="Submit2" type="button" class="btn_grey" value="Back" onClick="history.back()"></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
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
