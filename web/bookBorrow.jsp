<%-- 
    Document   : bookBorrow
    Created on : 2015-4-16, 22:18:01
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BorrowDAO" %>
<%@ page import="Form.BorrowForm" %>
<%@ page import="Form.ReaderForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        ReaderForm readerForm = (ReaderForm) request.getAttribute("readerinfo");
        Collection coll = (Collection) request.getAttribute("borrowinfo");
        int borrowNumber = 0;
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
        <script language="javascript">
            function checkreader(form) {
                if (form.barcode.value == "") {
                    alert("Please enter the reader code!");
                    form.barcode.focus();
                    return;
                }
                form.submit();
            }
            function checkbook(form) {
                if (form.barcode.value == "") {
                    alert("Please enter the reader code!");
                    form.barcode.focus();
                    return;
                }
                if (form.inputkey.value == "") {
                    alert("Please enter the key word!");
                    form.inputkey.focus();
                    return;
                }

                if (form.number.value - form.borrowNumber.value <= 0) {
                    alert("You can not borrow any books more!");
                    return;
                }
                form.submit();
            }
        </script>
    </head>
    <body onLoad="clockon(bgclock)">
        <%@include file="loginif_check.jsp"%>
        <%@include file="navigation.jsp"%>
        <table width="778"  border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td valign="top" bgcolor="#FFFFFF">
                    <table width="100%" height="509"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
                        <tr>
                            <td height="27" valign="top" style="padding:5px;" class="word_orange">Now：Book Borrow and Back &gt; Book Borrow &gt;&gt;&gt;</td>
                        </tr>
                        <tr>
                            <td align="center" valign="top" style="padding:5px;">
                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <form name="form1" method="post" action="borrow.do?action=bookborrow">
                                        <tr>
                                            <td height="47" background="Images/borrowBackRenew.gif">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="72" align="center" valign="top" background="Images/main_booksort_1.gif" bgcolor="#F8BF73"><table width="96%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#F8BF73">
                                                    <tr>
                                                        <td valign="top" bgcolor="#F8BF73"><%
                                                            int ID = 0;
                                                            String name = "";
                                                            String sex = "";
                                                            String barcode = "";
                                                            String birthday = "";
                                                            String paperType = "";
                                                            String paperNO = "";
                                                            if (readerForm != null) {
                                                                ID = readerForm.getId().intValue();
                                                                name = readerForm.getName();
                                                                sex = readerForm.getSex();
                                                                barcode = readerForm.getBarcode();
                                                                birthday = readerForm.getBirthday();
                                                                paperType = readerForm.getPaperType();
                                                                paperNO = readerForm.getPaperNO();
                                                            }
                                                            %>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                                <tr>
                                                                    <td>
                                                                        <table width="90%" height="21" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="24%" height="18" style="padding-left:7px;padding-top:7px;"><img src="Images/reader_checkbg.jpg" width="142" height="18"></td>
                                                                                <td width="76%" style="padding-top:7px;">Reader Code：
                                                                                    <input name="barcode" type="text" id="barcode" value="<%=barcode%>" size="24">
                                                                                    &nbsp;
                                                                                    <input name="Button" type="button" class="btn_grey" value="Submit" onClick="checkreader(form1)"></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="13" align="left" style="padding-left:7px;"><hr width="90%" size="1"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center"><table width="96%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td height="27">Name:
                                                                                    <input name="readername" type="text" id="readername" value="<%=name%>"></td>
                                                                                <td>Gender:
                                                                                    <input name="sex" type="text" id="sex" value="<%=sex%>"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="27">Visa Type
                                                                                    <input name="paperType" type="text" id="paperType" value="<%=paperType%>"></td>
                                                                                <td>Visa Id:
                                                                                    <input name="paperNo" type="text" id="paperNo" value="<%=paperNO%>"></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="32" background="Images/borrow_if.gif">&nbsp;Add of reference:
                                                            <input name="f" type="radio" class="noborder" value="barcode" checked>
                                                            Book Code &nbsp;&nbsp;
                                                            <input name="f" type="radio" class="noborder" value="bookname">
                                                            Book Name&nbsp;&nbsp;
                                                            <input name="inputkey" type="text" id="inputkey" size="50">
                                                            <input name="Submit2" type="button" class="btn_grey" value="Submit" onClick="checkbook(form1)">
                                                            <input name="Button" type="button" class="btn_grey" value="Borrow Complete" onClick="window.location.href = 'bookBorrow.jsp'">
                                                        </td>
                                                    </tr> 
                                                    <tr>
                                                        <td valign="top" bgcolor="#FCEC9A" style="padding:5px">
                                                            <table width="99%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#F6B83B" bgcolor="#FFFFFF">
                                                                <tr align="center" bgcolor="#F9D16B">
                                                                    <td width="29%" height="25">Book Name</td>
                                                                    <td width="12%">Time Borrowed</td>
                                                                    <td width="14%">Return Time</td>
                                                                    <td colspan="2">Price</td>
                                                                </tr>
                                                                <%
                                                                    String bookname = "";
                                                                    String borrowTime = "";
                                                                    String backTime = "";
                                                                    Float price = new Float(0);
                                                                    if (coll != null && !coll.isEmpty()) {
                                                                        borrowNumber = coll.size();
                                                                        Iterator it = coll.iterator();
                                                                        while (it.hasNext()) {
                                                                            BorrowForm borrowForm = (BorrowForm) it.next();
                                                                            bookname = borrowForm.getBookName();
                                                                            borrowTime = borrowForm.getBorrowTime();
                                                                            backTime = borrowForm.getBackTime();
                                                                            price = borrowForm.getPrice();
                                                                %>
                                                                <tr>
                                                                    <td height="25" style="padding:5px;">&nbsp;<%=bookname%></td>
                                                                    <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
                                                                    <td style="padding:5px;">&nbsp;<%=backTime%></td>
                                                                    <td width="14%" align="center">&nbsp;<%=price%></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
                                        </tr>
                                    </form>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
