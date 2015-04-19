<%-- 
    Document   : book_add
    Created on : 2015-4-16, 22:11:16
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="Form.BookForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<head>
    <title>Library Management System</title>
    <link href="CSS/style.css" rel="stylesheet">
    <script language="jscript">
        function check(form) {
            if (form.barcode.value == "") {
                alert("Please enter code!");
                form.barcode.focus();
                return false;
            }
            if (form.bookName.value == "") {
                alert("Please enter book name!");
                form.bookName.focus();
                return false;
            }
            if (form.price.value == "") {
                alert("Please enter book price!");
                form.price.focus();
                return false;
            }
            if (form.days.value == "") {
                alert("Please enter days!");
                form.days.focus();
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
                                    <td height="22" valign="top" class="word_orange">Now：Book Management &gt; Book Info &gt; Add Book Info &gt;&gt;&gt;</td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center" valign="top">
                                                    <form name="form1" method="post" action="book.do?action=bookAdd">
                                                        <table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                            <tr>
                                                                <td width="173" align="center">Bar Code:</td>
                                                                <td width="427" height="39">
                                                                    <input name="barcode" type="text" id="barcode">
                                                                    *</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Book Name:</td>
                                                                <td height="39"><input name="bookName" type="text" id="bookName" size="50">
                                                                    * </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Author:</td>
                                                                <td><input name="author" type="text" id="author" size="40"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Translator:</td>
                                                                <td><input name="translator" type="text" id="translator" size="40"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Price:</td>
                                                                <td><input name="price" type="text" id="price"> 
                                                                    Dollars * </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Page:</td>
                                                                <td><input name="page" type="text" id="page"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">Days(Borrow):</td>
                                                                <td><input name="days" type="text" id="days"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">&nbsp;</td>
                                                                <td><input name="Submit" type="submit" class="btn_grey" value="Save" onClick="return check(form1)">
                                                                    &nbsp;
                                                                    <input name="Submit2" type="button" class="btn_grey" value="Back" onClick="history.back()"></td>
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
            </td>
        </tr>
    </table>
</body>
</html>
