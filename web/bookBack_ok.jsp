<%-- 
    Document   : bookBack_ok
    Created on : 2015-4-17, 22:17:15
    Author     : xuejie87
--%>

<script language="javascript">
	window.location.href="borrow.do?action=bookback&barcode=<%=request.getAttribute("bar")%>";
</script>