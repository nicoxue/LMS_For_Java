<%-- 
    Document   : main
    Created on : 14-Apr-2015, 3:15:29 PM
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ page import="DAO.BorrowDAO"%>

<%@ page import="Form.BorrowForm"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body onLoad="clockon(bgclock)">
        <%@include file="loginif_check.jsp"%>
        <%@include file="navigation.jsp"%>
        <%
            BorrowDAO borrowDAO = new BorrowDAO();
            Collection coll_book = (Collection) borrowDAO.bookBorrowSort();
        %>
        <table width="778" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
            <tr>
                <td align="center" valign="top" style="padding:5px;"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="20" align="right" valign="middle" class="word_orange">Now: Home &gt;&gt;&gt;&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td height="57" background="Images/main_booksort.gif">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="72" valign="top"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="2%" rowspan="2">&nbsp;</td>
                                                    <td width="96%" align="center" valign="top"><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#B7B6B6" bordercolorlight="#FFFFFF">
                                                            <tr align="center">
                                                                <td width="5%" height="25">Rank</td>
                                                                <td width="10%">Book Bar Code</td>
                                                                <td width="24%">Book Name</td>
                                                                <td width="11%">Author</td>
                                                                <td>Price(Dollar)</td>
                                                                <td>Borrow Count</td>
                                                            </tr>
                                                            <%if (coll_book != null && !coll_book.isEmpty()) {
                                                                    Iterator it_book = coll_book.iterator();
                                                                    int i = 1;
                                                                    int degree = 0;
                                                                    String bookname = "";
                                                                    String barcode_book = "";
                                                                    String author = "";
                                                                    String translator = "";
                                                                    Float price = new Float(0);
                                                                    while (it_book.hasNext() && i < 6) {
                                                                        BorrowForm borrowForm = (BorrowForm) it_book.next();
                                                                        bookname = borrowForm.getBookName();
                                                                        barcode_book = borrowForm.getBookBarcode();
                                                                        degree = borrowForm.getDegree();
                                                                        author = borrowForm.getAuthor();
                                                                        price = borrowForm.getPrice();
                                                            %> 
                                                            <tr>
                                                                <td height="25" align="center"><%=i%></td>
                                                                <td style="padding:5px;">&nbsp;<%=barcode_book%></td>
                                                                <td style="padding:5px;"><%=bookname%></td>
                                                                <td width="11%" align="center"><%=author%></td>
                                                                <td width="8%" align="center"><%=price%></td>
                                                                <td width="8%" align="center"><%=degree%></td>
                                                            </tr>
                                                            <%
                                                            i++;
                                                        }
                                                    }%>
                                                        </table>
                                                    </td>
                                                    <td width="2%" rowspan="2">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td height="30" align="right" valign="middle"><a href=borrow.do?action=bookBorrowSort><img src="Images/more.GIF" width="50" height="20" border="0">&nbsp;</a></td>
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
