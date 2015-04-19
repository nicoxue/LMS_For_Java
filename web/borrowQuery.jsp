<%-- 
    Document   : borrowQuery
    Created on : 2015-4-16, 23:42:20
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.BorrowDAO" %>
<%@ page import="Form.BorrowForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("borrowQuery");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
        <script src="JS/function.js"></script>
        <script language="javascript">
            function check(myform) {
                if (myform.flag[0].checked == false && myform.flag[1].checked == false) {
                    alert("Please select one query option!");
                    return false;
                }
                if (myform.flag[1].checked) {
                    if (myform.sdate.value == "") {
                        alert("Please enter start date");
                        myform.sdate.focus();
                        return false;
                    }
                    if (CheckDate(myform.sdate.value)) {
                        alert("The start date is incorrect （for exmaple：2006-07-05）\n!");
                        myform.sDate.focus();
                        return false;
                    }
                    if (myform.edate.value == "") {
                        alert("Please enter end date");
                        myform.edate.focus();
                        return false;
                    }
                    if (CheckDate(myform.edate.value)) {
                        alert("The end date is incorrect （for exmaple：2006-07-05）\n!");
                        myform.edate.focus();
                        return false;
                    }
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
                                        <td height="22" valign="top" class="word_orange">Now: System Query &gt; Borrow Query &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <form name="myform" method="post" action="borrow.do?action=borrowQuery">
                                                <table width="98%" height="67"  border="0" cellpadding="0" cellspacing="0" bgcolor="#E3F4F7" class="tableBorder_gray">
                                                    <tr>
                                                        <td rowspan="2" align="center" bgcolor="#F9D16B">&nbsp;<img src="Images/search.gif" width="45" height="28"></td>
                                                        <td height="29" bgcolor="#F9D16B"><input name="flag" type="checkbox" class="noborder" value="a" checked>
                                                            Please choose one option:
                                                            <select name="f" class="wenbenkuang" id="f">
                                                                <option value="barcode">Book Bar Code</option>
                                                                <option value="bookname">Book Name</option>
                                                                <option value="readerbarcode">Reader Bar Code</option>
                                                                <option value="readername">Reader Name</option>
                                                            </select>
                                                            <input name="key" type="text" id="key" size="50">
                                                            <input name="Submit" type="submit" class="btn_grey" value="query" onClick="return check(myform)"></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="26" bgcolor="#F9D16B">
                                                            <input name="flag" type="checkbox" class="noborder" value="b">
                                                            Borrow Time:              From
                                                            <input name="sdate" type="text" id="sdate">
                                                            To
                                                            <input name="edate" type="text" id="edate">
                                                            (date format：2006-07-05)</td>
                                                    </tr>
                                                </table>		
                                            </form>
                                            <%
                                                if (coll == null || coll.isEmpty()) {
                                            %>
                                            <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">No Book Borrow Info!</td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {
                                                Iterator it = coll.iterator();
                                                String bookname = "";
                                                String bookbarcode = "";
                                                String readerbar = "";
                                                String readername = "";
                                                String borrowTime = "";
                                                String backTime = "";
                                                int ifback = 0;
                                                String ifbackstr = "";
                                            %>
                                            <table width="98%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td width="11%" bgcolor="#F9D16B">Book Bar Code</td>
                                                    <td width="29%" bgcolor="#F9D16B">Book Name</td>
                                                    <td width="15%" bgcolor="#F9D16B">Reader Bar Code</td>
                                                    <td width="13%" bgcolor="#F9D16B">Reader Name</td>
                                                    <td width="12%" bgcolor="#F9D16B">Borrow Time</td>
                                                    <td width="12%" bgcolor="#F9D16B">Return Time</td>
                                                    <td width="8%" bgcolor="#F9D16B">Back if</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        BorrowForm borrowForm = (BorrowForm) it.next();
                                                        bookname = borrowForm.getBookName();
                                                        bookbarcode = borrowForm.getBookBarcode();
                                                        readerbar = borrowForm.getReaderBarcode();
                                                        readername = borrowForm.getReaderName();
                                                        borrowTime = borrowForm.getBorrowTime();
                                                        backTime = borrowForm.getBackTime();
                                                        ifback = borrowForm.getIfBack();
                                                        if (ifback == 0) {
                                                            ifbackstr = "back no";
                                                        } else {
                                                            ifbackstr = "back ok";
                                                        }
                                                %>
                                                <tr>
                                                    <td style="padding:5px;">&nbsp;<%=bookbarcode%></td>
                                                    <td style="padding:5px;"><%=bookname%></td>
                                                    <td style="padding:5px;">&nbsp;<%=readerbar%></td>
                                                    <td style="padding:5px;">&nbsp;<%=readername%></td>
                                                    <td style="padding:5px;">&nbsp;<%=borrowTime%></td>
                                                    <td style="padding:5px;">&nbsp;<%=backTime%></td>
                                                    <td align="center" style="padding:5px;">&nbsp;<%=ifbackstr%></td>
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
