<%-- 
    Document   : bookBorrowSort
    Created on : 2015-4-17, 22:18:46
    Author     : xuejie87
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BorrowDAO" %>
<%@ page import="Form.BorrowForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("bookBorrowSort");
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
                                        <td height="22" valign="top" class="word_orange">Now: Book Borrow Rank &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                            %>
                                            <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">No Borrow Info</td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {

                                                Iterator it = coll.iterator();
                                                int degree = 0;
                                                String bookname = "";
                                                String typename = "";
                                                String barcode_book = "";
                                                String bookcase = "";
                                                String pub = "";
                                                String author = "";
                                                String translator = "";
                                                Float price = new Float(0);
                                            %>
                                            <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td width="8%" bgcolor="#F9D16B">Book Time</td>
                                                    <td width="11%" bgcolor="#F9D16B">Book Code</td>
                                                    <td width="17%" bgcolor="#F9D16B">Book Name</td>
                                                    <td width="11%" bgcolor="#F9D16B">Writer</td>
                                                    <td colspan="2" bgcolor="#F9D16B">Price</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                        bookname = borrowForm.getBookName();
                                                        barcode_book = borrowForm.getBookBarcode();
                                                        degree = borrowForm.getDegree();
                                                        author = borrowForm.getAuthor();
                                                        price = borrowForm.getPrice();
                                                %>
                                                <tr>
                                                    <td align="center">&nbsp;<%=degree%></td>
                                                    <td style="padding:5px;">&nbsp;<%=barcode_book%></td>
                                                    <td style="padding:5px;"><%=bookname%></td>
                                                    <td style="padding:5px;"><%=typename%></td>
                                                    <td align="center">&nbsp;<%=bookcase%></td>
                                                    <td align="center">&nbsp;<%=pub%></td>
                                                    <td width="11%" align="center"><%=author%></td>
                                                    <td width="8%" align="center"><%=price%></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
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
