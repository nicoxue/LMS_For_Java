<%-- 
    Document   : manager
    Created on : 2015-4-18, 1:35:31
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page import="Form.ManagerForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        Collection coll = (Collection) request.getAttribute("managerQuery");
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
                                        <td height="22" valign="top" class="word_orange">Now：System Set &gt; Manager Set &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top"><%
                                            if (coll == null || coll.isEmpty()) {
                                            %>
                                            <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td height="36" align="center">Manager doesn't exist</td>
                                                </tr>
                                            </table>
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <a href="#" onClick="window.open('manager_add.jsp', '', 'width=292,height=175')">Add Manager</a> </td>
                                                </tr>
                                            </table>
                                            <%
                                            } else {

                                                Iterator it = coll.iterator();
                                                int ID = 0;
                                                String name = "";
                                                int sysset = 0;
                                                int readerset = 0;
                                                int bookset = 0;
                                                int borrowback = 0;
                                                int sysquery = 0;
                                            %>
                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="84%">&nbsp;      </td>
                                                    <td width="16%">
                                                        <a href="#" onClick="window.open('manager_add.jsp', '', 'width=292,height=175')">Add Manager</a> </td>	  
                                                </tr>
                                            </table>  
                                            <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#F6B83B" bordercolorlight="#FFFFFF">
                                                <tr align="center" bgcolor="#e3F4F7">
                                                    <td width="26%" bgcolor="#F9D16B">Manager Name</td>
                                                    <td width="12%" bgcolor="#F9D16B">System Set</td>
                                                    <td width="12%" bgcolor="#F9D16B">Reader Management</td>
                                                    <td width="12%" bgcolor="#F9D16B">Book Management</td>
                                                    <td width="11%" bgcolor="#F9D16B">Book Back</td>
                                                    <td width="10%" bgcolor="#F9D16B">System Query</td>
                                                    <td width="9%" bgcolor="#F9D16B">Authorize Set</td>
                                                    <td width="8%" bgcolor="#F9D16B">Delete</td>
                                                </tr>
                                                <%
                                                    while (it.hasNext()) {

                                                        ManagerForm managerForm = (ManagerForm) it.next();
                                                        ID = managerForm.getId().intValue();
                                                        name = managerForm.getName();
                                                        sysset = managerForm.getSysset();
                                                        readerset = managerForm.getReaderset();
                                                        bookset = managerForm.getBookset();
                                                        borrowback = managerForm.getBorrowback();
                                                        sysquery = managerForm.getSysquery();
                                                %> 
                                                <tr>
                                                    <td style="padding:5px;"><%=name%></td>
                                                    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if (sysset == 1) {
                                                            out.println("checked");
                                                        }%>></td>
                                                    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled="disabled" <%if (readerset == 1) {
                                                            out.println("checked");
                                                        }%>></td>
                                                    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if (bookset == 1) {
                                                            out.println("checked");
                                                        }%>></td>
                                                    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if (borrowback == 1) {
                                                            out.println("checked");
                                                        }%>></td>
                                                    <td align="center"><input name="checkbox" type="checkbox" class="noborder" value="checkbox" disabled <%if (sysquery == 1) {
                                                            out.println("checked");
                                                        }%>></td>
                                                    <td align="center"><%if (!name.equals("tsoft")) {%><a href="#" onClick="window.open('manager.do?action=managerModifyQuery&id=<%=ID%>', '', 'width=292,height=175')">Authorize Set</a><%} else {%>&nbsp;<%}%></td>
                                                    <td align="center">
                                                        <%if (!name.equals("tsoft")) {%><a href="manager.do?action=managerDel&id=<%=ID%>">Delete</a><%} else {%>&nbsp;<%}%></td>
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
