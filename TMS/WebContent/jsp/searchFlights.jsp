<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function add() {
		if(document.getElementById("from").value=="")
		{
			alert("add From or Origin");
			return	false;
		}
		else if(document.getElementById("to").value=="")
		{
			alert("add To or Destination");
			return	false;
		}
		else if(document.getElementById("travelDate").value=="")
		{
			alert("add Travel Date");
			return	false;
		}
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/searchFlights.do?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />
<script language="javascript" type="text/javascript" src="/TMS/script/datetimepicker.js"></script>
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TMS/searchFlights.do" name="myform" id="myform" method="post">
<input type=hidden name=method id=method value=search>
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Flight </h1></td>
</tr>

<tr>


			<input type="hidden" id="typeOfTrip" name="typeOfTrip" value="OneWay">
</tr>
<tr>
<td>From</td>


			<td><select id="from" name="from" onchange="route()">
					<option value	="">SELECT</option>
		
				<%
				Vector	vec1	=	dropDown.dropDown("location");
				for(int i=0;i<vec1.size();i++) {%>
				<option value	="<%=vec1.get(i+1) %>"><%=vec1.get(i+1) %></option>
				<%i++;
				} %>
				</select></td>


<td>To</td>


			<td><select id="to" name="to">
					<option value	="">SELECT</option>
		
				<%
				for(int i=0;i<vec1.size();i++) {%>
				<option value	="<%=vec1.get(i+1) %>"><%=vec1.get(i+1) %></option>
				<%i++;
				} %>
				</select></td>

</tr>

<tr>
<td>Travel Date</td>
	<td>
	  		<input type="Text" readonly="readonly" id="travelDate" name="travelDate" maxlength="13" size="13">
	  		<a href="javascript:NewCal('travelDate','mmddyyyy',false,24)">
	  		<img src="/TMS/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
	  	</td>


</tr>





<tr><td><input type=button  class=button value=Search onclick="add()"></td>
</tr>
<tr><td>&nbsp;</td><td>	</td></tr>
</table>
</td></tr>
</table>
</form>
</div>

</body>
<script>
function route(){
		var select=document.getElementById("from");
		var select1=document.getElementById("to");
		for (i=0;i<select.length;  i++) {
			if (select.value==select1.options[i].value) {
		     select1.remove(i);
		   }
		}
}
</script>
</html>