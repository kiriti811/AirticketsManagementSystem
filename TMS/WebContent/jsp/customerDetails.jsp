<%@page import="javaActionForms.dropDown"%>
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
		window.close();
	}
	function today(){
		var today = new Date();
		 var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!

	    var yyyy = today.getFullYear();
	  
	    var today = mm+'-'+dd+'-'+yyyy;
	    document.getElementById("bookingDate").value = today;
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />

<script language="javascript" type="text/javascript" src="/TMS/script/datetimepicker.js"></script>
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<center>
</head>
<div><jsp:include page='header.jsp'></jsp:include></div>
<div>
<%
int 	noOfPassengers		=	Integer.valueOf((String)request.getAttribute("noOfPassengers"));
String	fsCode				=	(String)request.getAttribute("fsCode");
%>
<body onload="today()">
<form name="myform" action="/TMS/customerDetails.do" method="post">
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Customer Details</h1></td>
</tr>
<tr><td>
<input type="hidden" name="method" id="method" value="add">
<input type="hidden" name="fsCode" id="fsCode" value="<%=fsCode%>">
<%
for(int i	=	0;	i	<	noOfPassengers;	i++)
{
%>
<tr><td>customer <%=i+1 %> name</td><td><input type=text  	name="name<%=i%>" id="name<%=i%>"></td></tr>
<tr><td>customer <%=i+1 %> email ID</td><td><input type=text  	name="emailId<%=i%>"  id="emailId<%=i%>"></td></tr>
<tr><td>customer <%=i+1 %> phone Number</td><td><input type=text 	name="phoneNumber<%=i%>" id="phoneNumber<%=i%>"></td></tr>
<tr><td>customer <%=i+1 %> Address</td><td>
<textarea rows="5" cols="22" name="address<%=i%>" id="address<%=i%>"></textarea>
</td></tr>
<tr>
	<td>
	  		<input type="hidden" readonly="readonly" id="cost<%=i%>" name="cost<%=i%>" maxlength="13" size="13" value="<%=request.getParameter("c")%>">
	  	</td>


</tr>


<%
}%>	

<tr>
	<td>
	  		<input type="hidden" readonly="readonly" id="bookingDate" name="bookingDate" maxlength="13" size="13">
	  	</td>


</tr>




<tr><td><input type=button  class=button value=add onclick="add()"></td>
</tr>

</table>
</td></tr></table>
</form>
</body>
</html>