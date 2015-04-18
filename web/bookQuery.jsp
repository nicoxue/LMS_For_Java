<%-- 
    Document   : bookQuery
    Created on : 2015-4-17, 23:37:24
    Author     : xuejie87
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="Form.BookForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("ifbook");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body onLoad="clockon(bgclock)">
        <%@include file="banner.jsp"%>
        <%@include file="navigation.jsp"%>
        <table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">Now:System Query &gt; Book Query &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <form action="" method="post" name="form1">  
                                                <table width="98%" height="38"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder_gray">
                                                    <tr>
                                                        <td align="center" bgcolor="#F9D16B">

                                                            &nbsp;<img src="Images/search.gif" width="45" height="28"></td>
                                                        <td bgcolor="#F9D16B">Please Select the key word:
                                                            <select name="f" class="wenbenkuang" id="f">
                                                                <option value="barcode">Code</option>
                                                                <option value="bookname" selected>Name</option>
                                                                <option value="author">Author</option>
                                                            </select>
                                                            <input name="key" type="text" id="key" size="50">
                                                            <input name="Submit" type="submit" class="btn_grey" value="Query"></td>
                                                    </tr>
                                                </table>
                                                <%
                                                    if (coll == null || coll.isEmpty()) {
                                                %>
                                                <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td height="36" align="center">No Book Info!</td>
                                                    </tr>
                                                </table>
                                                <%
                                                } else {

                                                    Iterator it = coll.iterator();
                                                    int ID = 0;
                                                    String bookname = "";
                                                    String barcode = "";
                                                    int storage = 0;
                                                %>  
                                                <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                    <tr align="center" bgcolor="#e3F4F7">
                                                        <td width="17%" bgcolor="#F9D16B">Book Code</td>  
                                                        <td width="31%" bgcolor="#F9D16B">Book Name</td>
                                                    </tr>
                                                    <%
                                                        while (it.hasNext()) {
                                                            BookForm bookForm = (BookForm) it.next();
                                                            ID = bookForm.getId().intValue();
                                                            bookname = bookForm.getBookName();
                                                            barcode = bookForm.getBarcode();
                                                            if (barcode == null) {
                                                                barcode = "";
                                                            }
                                                    %> 
                                                    <tr>
                                                        <td style="padding:5px;">&nbsp;<%=barcode%></td>  
                                                        <td style="padding:5px;"><a href="book.do?action=bookDetail&ID=<%=ID%>"><%=bookname%></a></td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>  
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
