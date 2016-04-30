<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String	message	=	"Data Added Successfully";
%>
<html>
<script type="text/javascript">
	function add() {
		if(document.getElementById("flightId").value==""){
			alert("Enter Flight Id");
			return false;
		}
		else if(document.getElementById("makeType").value=="")
		{
			alert("Enter Make Type");
			return false;
		}
		else if(document.getElementById("makeYear").value==""){
			alert("Enter Make Year");
			return false;
		}
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/flightDetails?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TMS/flightDetails.do" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	flightDetailsBean object	=	new	flightDetailsBean();
	object	=	(flightDetailsBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	flightDetailsBean();
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
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Flight Details</h1></td>
</tr>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">
<tr>
<td>Flight ID</td>
<td><input name="flightId" maxlength="10" id="flightId" type="text" value="<%=object.getFlightId()%>"></td>


</tr>


<tr>
<td>Make Type</td>
<td><input name="makeType" maxlength="10" id="makeType" type="text" value="<%=object.getMakeType()%>"></td>


</tr>

<tr>
<td>Make Year</td>
<td><input name="makeYear" maxlength="4" id="makeYear" type="text" value="<%=object.getMakeYear()%>"></td>


</tr>

<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>
<tr><td>&nbsp;</td><td>	</td></tr>
</table>
	<iframe style="border: 1px; height: 1000px; weight: 1200px"
			 src="/TMS/flightDetails.do?method=list"></iframe> 
</td></tr>
</table>
</form>
</div>
</body>

</html>