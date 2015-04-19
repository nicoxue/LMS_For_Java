<%-- 
    Document   : manager_Modify
    Created on : 2015-4-18, 15:50:51
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="Form.ManagerForm"%>
<%
    ManagerForm managerForm = (ManagerForm) request.getAttribute("managerQueryif");
    int ID = managerForm.getId().intValue();
    String name = managerForm.getName();
    int sysset = managerForm.getSysset();
    int readerset = managerForm.getReaderset();
    int bookset = managerForm.getBookset();
    int borrowback = managerForm.getBorrowback();
    int sysquery = managerForm.getSysquery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authorization Set</title>
        <link href="CSS/style.css" rel="stylesheet">
    </head>
    <body>
        <table width="292" height="175" border="0" cellpadding="0" cellspacing="0" background="Images/subBG.jpg">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="3%" height="25">&nbsp;</td>
                            <td width="94%">&nbsp;</td>
                            <td width="3%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <table width="100%" height="131"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" valign="top">	
                                            <form name="form1" method="post" action="manager.do?action=managerModify">
                                                <table height="126"  border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="85" height="29" align="center">Administrator Name:	</td>
                                                        <td width="190">
                                                            <input name="id" type="hidden" value="<%=ID%>"><input name="name" type="text" readonly="yes" value="<%=name%>">        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="74" align="center">Authorization:</td>
                                                        <td><table width="100%" height="67" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="47%"><input name="sysset" type="checkbox" class="noborder" id="sysset" value="1" <%if (sysset == 1) {
                                                                            out.println("checked");
                                                                        }%>>
                                                                        System set</td>
                                                                    <td width="53%"><input name="readerset" type="checkbox" class="noborder" id="readerset" value="1" <%if (readerset == 1) {
                                                                            out.println("checked");
                                                                        }%>>
                                                                        Reader Management</td>
                                                                </tr>
                                                                <tr>
                                                                    <td><input name="bookset" type="checkbox" class="noborder" id="bookset" value="1" <%if (bookset == 1) {
                                                                            out.println("checked");
                                                                        }%>>
                                                                        Book Management</td>
                                                                    <td><input name="borrowback" type="checkbox" class="noborder" id="borrowback" value="1" <%if (borrowback == 1) {
                                                                            out.println("checked");
                                                                        }%>>
                                                                        Book Borrow and Back</td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="23"><input name="sysquery" type="checkbox" class="noborder" id="sysquery" value="1" <%if (sysquery == 1) {
                                                                            out.println("checked");
                                                                        }%>>
                                                                        System Query</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>          </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="22" align="center">&nbsp;</td>
                                                        <td><input name="Button" type="submit" class="btn_grey" value="Save">
                                                            &nbsp;
                                                            <input name="Submit2" type="button" class="btn_grey" value="Close" onClick="window.close();"></td>
                                                    </tr>
                                                </table>
                                            </form></td>
                                    </tr>
                                </table></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="17">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>                        
                </td>
            </tr>
        </table>
    </body>
</html>
