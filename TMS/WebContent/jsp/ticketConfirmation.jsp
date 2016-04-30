<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function add() {
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/airportDetails?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>


<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Ticket Code</h1></td>
</tr>

<tr><td>&nbsp;</td></tr>

<tr><td><br><br><br><br>Thank You...!! Your Ticket is confirmed and the Ticket Number is <%=request.getAttribute("ticketCode") %></td></tr>
<tr><td>Click to check with the ticket<a href="/TMS/checkTicket.do?method=add&ticketCode=<%=request.getAttribute("ticketCode") %>" target="_blank"> <%=request.getAttribute("ticketCode") %> </a></td></tr>
</table>
</td></tr>
</table>
</form>
</div>
</body>

</html>