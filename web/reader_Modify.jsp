<%-- 
    Document   : reader_Modify
    Created on : 2015-4-17, 23:50:33
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" errorPage=""%>
<%@ page import="DAO.ReaderDAO" %>
<%@ page import="Form.ReaderForm" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%
        ReaderForm readerForm = (ReaderForm) request.getAttribute("readerQueryif");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Library Management System</title>
        <link href="CSS/style.css" rel="stylesheet">
        <script language="jscript">
            function check(form) {
                if (form.name.value == "") {
                    alert("Please enter reader name!");
                    form.name.focus();
                    return false;
                }
                if (form.paperNO.value == "") {
                    alert("Please enter visa id!");
                    form.paperNO.focus();
                    return false;
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
                                        <td height="22" valign="top" class="word_orange">Now: Reader Management &gt; Reader Info &gt; Modify Reader Info &gt;&gt;&gt;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <table width="100%" height="493"  border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <%  int ID = readerForm.getId().intValue();
                                                        String name = readerForm.getName();
                                                        String sex = readerForm.getSex();
                                                        String barcode = readerForm.getBarcode();
                                                        String vocation = readerForm.getVocation();
                                                        String birthday = readerForm.getBirthday();
                                                        String paperType = readerForm.getPaperType();
                                                        String paperNO = readerForm.getPaperNO();
                                                        String tel = readerForm.getTel();
                                                        String email = readerForm.getEmail();
                                                        String createDate = readerForm.getCreateDate();
                                                        String remark = readerForm.getRemark();
                                                    %>
                                                    <td align="center" valign="top">
                                                        <form name="form1" method="post" action="reader.do?action=readerModify">
                                                            <table width="600" height="432"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                                <tr>
                                                                    <td width="173" align="center">Name:</td>
                                                                    <td width="427" height="39">
                                                                        <input name="name" type="text" value="<%=name%>" readonly="yes"> 
                                                                        *         
                                                                        <input name="id" type="hidden" id="id" value="<%=ID%>"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="173" align="center">Gender:</td>
                                                                    <td height="35"><input name="sex" type="radio" class="noborder" id="radiobutton" value="male" <%if ("male".equals(sex)) {
                                                                                                   out.println("checked");%>>
                                                                        <label for="radiobutton">Male</label>
                                                                        <label>
                                                                            <input name="sex" type="radio" class="noborder" value="female" <%if ("female".equals(sex)) {
                                                                                    out.println("checked");
                                                                                }%>>
                                                                            Female</label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Bar Code:</td>
                                                                    <td><input name="barcode" type="text" id="barcode" value="<%=barcode%>" readonly="yes"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Vocation:</td>
                                                                    <td><input name="vocation" type="text" id="vocation" value="<%=vocation%>"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Birth Date</td>
                                                                    <td><input name="birthday" type="text" id="birthday" value="<%=birthday%>"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Visa Type:</td>
                                                                    <td><select name="paperType" class="wenbenkuang" id="paperType">
                                                                            <option value="idcard"<%if ("idcard".equals(paperType)) {
                                                                                    out.println(" selected");%>>ID Card</option>
                                                                            <option value="studentcard"<%if ("studentcard".equals(paperType)) {
                                                                                            out.println(" selected");%>>Student Card</option>
                                                                            <option value="ctofofficer"<%if ("ctofofficer".equals(paperType)) {
                                                                                            out.println(" selected");%>>Certificate of Officers</option>
                                                                            <option value="workpermit"<%if ("workpermit".equals(paperType)) {
                                                                                    out.println(" selected");
                                                                                }%>>Work Permit</option>
                                                                        </select></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Visa ID:</td>
                                                                    <td><input name="paperNO" type="text" id="paperNO" value="<%=paperNO%>"> 
                                                                        * </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Phone Number:</td>
                                                                    <td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Email：</td>
                                                                    <td><input name="email" type="text" id="email" value="<%=email%>" size="50"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">Note:</td>
                                                                    <td><textarea name="remark" cols="50" rows="5" class="wenbenkuang" id="remark"><%=remark%></textarea></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">&nbsp;</td>
                                                                    <td><input name="Submit" type="submit" class="btn_grey" value="Save" onClick="return check(form1)">
                                                                        &nbsp;
                                                                        <input name="Submit2" type="button" class="btn_grey" value="Back" onClick="history.back()"></td>
                                                                </tr>
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
                </td>
            </tr>
        </table>
    </body>
</html>
