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
		window.open("/TravelManagementSystem/route?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TravelManagementSystem/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TravelManagementSystem/route" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	routeBean object	=	new	routeBean();
	object	=	(routeBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	routeBean();
	%>
		<input type=hidden name=method id=method value=add>
	<%}else{
		%>
		<input type=hidden name=method id=method value=edit>
		<%
	}
%>

<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='indexLeft.jsp'></jsp:include></div></td>
<td><table><tr>
<h1>Registered Successfully </h1>

</tr>
<tr>Login for Booking <a href="/TravelManagementSystem/jsp/LoginPage.jsp?userType=customer">Sign In</a></tr>

</table></td></tr></table>
</form>
</div>
</body>
<script>
function rout(){
		document.getElementById("route").value=document.getElementById("route").value+"-"+document.getElementById("location").value;
		var select=document.getElementById("location");
		document.getElementById("nodes").value	=	document.getElementById("nodes").value*1	+	1;
		for (i=0;i<select.length;  i++) {
		   if (select.options[i].value==document.getElementById("location").value) {
		     select.remove(i);
		   }
		}
}
</script>
</html>