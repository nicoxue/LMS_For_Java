<%-- 
    Document   : bookBack_ok
    Created on : 2015-4-16, 22:17:15
    Author     : JIAJUN XUE <nicoxue0324@gmail.com>
--%>

<script language="javascript">
	window.location.href="borrow.do?action=bookback&barcode=<%=request.getAttribute("bar")%>";
</script>