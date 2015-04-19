<%--
    Document   : book
    Created on : 14-Apr-2015, 4:09:58 PM
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="Form.BookForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("book");
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
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="510" valign="top" style="padding:5px;">
                                <table width="98%"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">Now：Library Management &gt; Book Info &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                            %>
                                            <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">No Book Info!</td>
                                                </tr>
                                            </table>
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <a href="book_add.jsp">Add Book Info</a> </td>
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
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="87%">&nbsp;      </td>
                                                    <td width="13%">
                                                        <a href="book_add.jsp">Add Book Info</a></td>	  
                                                </tr>
                                            </table>  
                                            <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td width="13%" bgcolor="#F9D16B">Bar Code</td>  
                                                    <td width="26%" bgcolor="#F9D16B">Book Name</td>
                                                    <td width="9%" bgcolor="#F9D16B">Modify</td>
                                                    <td width="5%" bgcolor="#F9D16B">Delete</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BookForm bookForm = (BookForm) it.next();
                                                        ID = bookForm.getId().intValue();
                                                        bookname = bookForm.getBookName();
                                                        barcode = bookForm.getBarcode();
                                                %> 
                                                <tr>
                                                    <td style="padding:5px;">&nbsp;<%=barcode%></td>  
                                                    <td style="padding:5px;"><a href="book.do?action=bookDetail&ID=<%=ID%>"><%=bookname%></a></td>
                                                    <td align="center"><a href="book.do?action=bookModifyQuery&ID=<%=ID%>">Modify</a></td>
                                                    <td align="center"><a href="book.do?action=bookDel&ID=<%=ID%>">Delete</a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>  
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
