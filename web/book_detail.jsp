<%-- 
    Document   : book_detail
    Created on : 2015-4-17, 22:14:45
    Author     : xuejie87
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="Form.BookForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        BookForm bookForm = (BookForm) request.getAttribute("bookDetail");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body onLoad="clockon(bgclock)">
        <%@include file="loginif_check.jsp"%>
        <%@include file="navigation.jsp"%>
        <table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">Now: Book Management &gt; Book Info &gt; Book Detail &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="center" valign="top">
                                                        <%
                                                            int ID = bookForm.getId().intValue();
                                                            String bookname = bookForm.getBookName();
                                                            String barcode = bookForm.getBarcode();
                                                            if (barcode == null) {
                                                                barcode = "";
                                                            }
                                                            String author = bookForm.getAuthor();
                                                            String translator = bookForm.getTranslator();
                                                            Float price = bookForm.getPrice();
                                                            int pages = bookForm.getPage();
                                                            int days = bookForm.getDays();
                                                        %>
                                                        <table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                            <tr>
                                                                <td width="173" height="30" align="center">Bar Code:</td>
                                                                <td height="35"><input name="name" type="text" value="<%=barcode%>" size="40"></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="173" height="30" align="center">Book Name:</td>
                                                                <td width="427" height="39">
                                                                    <input name="name" type="text" value="<%=bookname%>" size="60"> </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Author:</td>
                                                                <td><input name="vocation" type="text" id="vocation" value="<%=author%>" size="50"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Translator:</td>
                                                                <td><input name="birthday" type="text" id="birthday" value="<%=translator%>" size="50"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Price:</td>
                                                                <td><input name="paperNO" type="text" id="paperNO" value="<%=price%>">
                                                                    Dollar</td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Page:</td>
                                                                <td><input name="paperNO2" type="text" id="paperNO2" value="<%=pages%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td height="30" align="center">Days(Borrow):</td>
                                                                <td><input name="days" type="text" id="days" value="<%=days%>"></td>
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
                                            </table></td>
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
