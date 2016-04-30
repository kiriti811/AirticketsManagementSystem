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
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set Timings</title>
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />

<script language="javascript" type="text/javascript" src="/TMS/script/datetimepicker.js"></script>
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">

</head>
<%
int 	stops		=	Integer.valueOf((String)request.getAttribute("nodes"));
Vector 	locations	=	(Vector)request.getAttribute("locations");
%>
<body>
<form name="myform" action="/TMS/setTimings" method="post">
<table>
<tr>
<td>Origin</td>
<td>Destination</td>
<td>From Date</td>
<td>From Time</td>
<td>To Date</td>
<td>To Time</td>
<td>Flight Id</td>
</tr>
<input type="hidden" name="method" id="method" value="add">
<%
for(int i	=	0;	i	<	stops-1;	i++)
{
%>
<tr>
<td><input type=text value="<%=locations.get(i) %> " name="location<%=i%>" ></td>
<td><input type=text value="<%=locations.get(i+1) %> " name="destination<%=i%>" ></td>
<td>		<input type=text value="" name="fromDate<%=i%>" id="fromDate<%=i%>">
	  		<a href="javascript:NewCal('fromDate<%=i%>','mmddyyyy',false,24)">
	  		<img src="/TMS/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>

</td>
<td><input type=text value="" name="fromTime<%=i%>" id="fromTime<%=i%>"></td>


<td>		<input type=text value="" name="toDate<%=i%>" id="toDate<%=i%>"  >
	  		<a href="javascript:NewCal('toDate<%=i%>','mmddyyyy',false,24)">
	  		<img src="/TMS/images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>

</td>

<td><input type=text value="" name="toTime<%=i%>" id="toTime<%=i%>" ></td>

<td>			<td><select id="flightId<%=i %>" name="flightId<%=i %>">
				<%
				Vector	vec	=	dropDown.dropDown("flightId");
				for(int j=0;j<vec.size();j++) {%>
				<option value	=<%=vec.get(j+1) %>><%=vec.get(j+1) %></option>
				<%j++;
				} %>
				</select></td>
</td>

</tr>

<%
}%>	

<tr><td><input type=button  class=button value=submit onclick="add()"></td>
</tr>

</table>
</form>
</body>
</html>