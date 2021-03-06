<%-- 
    Document   : reader
    Created on : 2015-4-17, 23:47:57
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.ReaderDAO" %>
<%@ page import="Form.ReaderForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("reader");
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
                                <table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="22" valign="top" class="word_orange">Now: Reader Management &gt; Reader Info &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                            %>
                                            <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">No Reader Info!</td>
                                                </tr>
                                            </table>
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <a href="reader_add.jsp">Add Reader Info</a> 
                                                    </td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {

                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String name = "";
                                                String barcode = "";
                                                String paperType = "";
                                                String paperNO = "";
                                                String tel = "";
                                                String email = "";
                                            %>
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="87%">&nbsp;      </td>
                                                    <td width="13%">
                                                        <a href="reader_add.jsp">Add Reader Info</a>
                                                    </td>	  
                                                </tr>
                                            </table>  
                                            <table width="95%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td width="13%" bgcolor="#F9D16B">Reader Bar Code</td>  
                                                    <td width="10%" bgcolor="#F9D16B">Reader Name:</td>
                                                    <td width="12%" bgcolor="#F9D16B">Visa Type</td>
                                                    <td width="20%" bgcolor="#F9D16B">Visa Id</td>
                                                    <td width="12%" bgcolor="#F9D16B">Phone Number</td>
                                                    <td width="15%" bgcolor="#F9D16B">Email</td>
                                                    <td width="5%" bgcolor="#F9D16B">Modify</td>
                                                    <td width="5%" bgcolor="#F9D16B">Delete</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {
                                                        ReaderForm readerForm = (ReaderForm) it.next();
                                                        ID = readerForm.getId().intValue();
                                                        name = readerForm.getName();
                                                        barcode = readerForm.getBarcode();
                                                        paperType = readerForm.getPaperType();
                                                        paperNO = readerForm.getPaperNO();
                                                        tel = readerForm.getTel();
                                                        email = readerForm.getEmail();
                                                %> 
                                                <tr>
                                                    <td style="padding:5px;"><%=barcode%></td>  
                                                    <td style="padding:5px;"><a href="reader.do?action=readerDetail&ID=<%=ID%>"><%=name%></a></td>
                                                    <td align="center"><%=paperType%></td>
                                                    <td align="center"><%=paperNO%></td>
                                                    <td align="center"><%=tel%></td>
                                                    <td align="center"><%=email%></td>
                                                    <td align="center"><a href="reader.do?action=readerModifyQuery&ID=<%=ID%>">Modify</a></td>
                                                    <td align="center"><a href="reader.do?action=readerDel&ID=<%=ID%>">Delete</a></td>
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
