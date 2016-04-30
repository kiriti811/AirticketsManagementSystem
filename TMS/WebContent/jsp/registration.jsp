<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function add() {
		var mailformat 	= 	/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var	uemail		=	document.getElementById("emailId");	
		if(document.getElementById("emailId").value.match(mailformat))
		{
		return true;
		}
		else
		{
		alert("You have entered an invalid email address!");
		uemail.focus();
		return false;
		}
	}
	function Reset(){
		window.open("/TravelManagementSystem/registration?method=emptyaction","_self")
	}
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TravelManagementSystem/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TravelManagementSystem/registration" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	registrationBean object	=	new	registrationBean();
	object	=	(registrationBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	registrationBean();
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
<td><h1>Flight Details</h1></td>
</tr>

	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">
<tr>
<td>First Name</td>
<td><input name="firstName" id="firstName" type="text" value="<%=object.getFirstName()%>"></td>


</tr>


<tr>
<td>Last Name</td>
<td><input name="lastName" id="lastName" type="text" value="<%=object.getLastName()%>"></td>


</tr>

<tr>
<td>Email Id</td>
<td><input name="emailId" id="emailId" type="text" value="<%=object.getEmailId()%>"></td>


</tr>

<tr>
<td>Zip Code</td>
<td><input name="zipCode" id="zipCode" type="text" value="<%=object.getZipCode()%>"></td>


</tr>


<tr>
<td>Phone Number</td>
<td><input name="phoneNumber" id="phoneNumber" type="text" value="<%=object.getPhoneNumber()%>"></td>


</tr>


<tr>
<td>User Name</td>
<td><input name="userName" id="userName" type="text" value="<%=object.getUserName()%>"></td>


</tr>


<tr>
<td>Password</td>
<td><input name="password" id="password" type="password" value="<%=object.getPassword()%>"></td>


</tr>


<tr>
<td>Confirm Password</td>
<td><input name="confirmPassword" id="confirmPassword" type="password" value="<%=object.getConfirmPassword()%>"></td>


</tr>
	<input name="userType" id="userType" type="hidden" value="customer">
<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>
<tr><td>&nbsp;</td><td>	</td></tr>
</table>
</td></tr>
</table>
</form>
</div>
</body>

</html>