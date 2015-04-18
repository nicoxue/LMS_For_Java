<%-- 
    Document   : loginif_check
    Created on : 2015-4-18, 0:05:23
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String manager=(String)session.getAttribute("manager");
//Check whether login
if (manager==null || "".equals(manager)){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="118" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="100%" height="33"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="81%" height="10"></td>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td height="20">&nbsp;</td>
        <td width="10%"><a href="#" onClick="window.location.reload();" class="word_dark">Refresh Page</a></td>
        <td width="9%"><a href="#" onClick="myclose()" class="word_dark">Close System</a></td>
		<script language="javascript">
			function myclose(){
				if(confirm("Do you want close window?")){
					window.close();
				}
			}
		</script>
        </tr>
    </table>
      <table width="93%" height="79"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="69" align="right" valign="bottom">Login User：<%=manager%></td>
        </tr>
    </table></td>
  </tr>
</table>
