<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function add() {
		document.getElementById("seatsAvailable").value	=	document.getElementById("totalSeats").value;
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/flightSchedule.do?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/TMS/css/calender.css" type="text/css" media="all" />

<script language="javascript" type="text/javascript" src="/TMS/script/datetimepicker.js"></script>
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">

</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include></div>
<div>
<form action="/TMS/flightSchedule.do" name="myform" id="myform" method="post">
<%	Object obj	=	null;
	flightScheduleBean object	=	new	flightScheduleBean();
	object	=	(flightScheduleBean)request.getAttribute("object");
	if(object==obj)
	{
		object	=	new	flightScheduleBean();
	%>
		<input type=hidden name=method id=method value=add>
	<%}else{
		%>
		<input type=hidden name=method id=method value=edit>
		<%
	}
%>
<%
String	message	=	"Data Added Successfully";
%>
<table style="width: 100%;height: 90%">
<tr>
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Flight Schedule</h1></td>
</tr>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">
<tr>
<td>Route</td>
	<td><select id="route" name="route" onchange="setNodes()">
				<option value	="">SELECT</option>
				<%
				Vector	vec1	=	dropDown.dropDown("route");
				for(int i=0;i<vec1.size();i++) {%>
				<option value	="<%=vec1.get(i+1) %>"><%=vec1.get(i+1) %></option>
				<%i++;
				} %>
				</select></td>
</tr>

<tr>
<td>Nodes</td>
<td><input name="nodes" id="nodes" type="text" value="<%=object.getNodes()%>" readonly="readonly"></td>
</tr>

<tr>
<td>Total Seats</td>
<td><input name="totalSeats" id="totalSeats" type="text" value="<%=object.getTotalSeats()%>"></td>


</tr>


<tr>
<td>Seats Available</td>
<td><input readonly="readonly" name="seatsAvailable" id="seatsAvailable" type="text" value="<%=object.getSeatsAvailable()%>"></td>


</tr>

<tr>
<td>Cost $</td>
<td><input name="cost" id="cost" type="text" value="<%=object.getCost()%>"></td>


</tr>
<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>
<tr><td>&nbsp;</td><td>	</td></tr>
</table>
<table>
<tr>
<td>
<iframe src="" name="setTimings" id="setTimings" src="" style="height:400px;width:600px"></iframe>
</td>
</tr>
</table>

	<iframe style="border: 1px; height: 300px; width: 600px"
			 src="/TMS/flightSchedule.do?method=list"></iframe> 
</td></tr>
</table>
</form>
</div>
</body>
<script>
function setNodes(){
	var	route	=	document.getElementById("route").value;
	var a = route.split("-") // Delimiter is a string
	var 	count	=	0;
	for (var i = 0; i < a.length; i++)
	{
		count	=	i;
	}
	document.getElementById("nodes").value	=	count;
	document.getElementById("setTimings").src	=	"/TMS/setTimings.do?method=emptyaction&nodes="+document.getElementById("nodes").value+"&route="+route;
}
function setSchedule()
{
	var	time	=	document.getElementById("time").value;
	var a = time.split("-") // Delimiter is a string
	var 	count	=	0;
	for (var i = 0; i < a.length; i++)
	{
		count	=	i;
	}
	var node	=	document.getElementById("nodes").value	* 1;
	if(count==(node-1)){
		var	route	=	document.getElementById("route").value;
		var	detail	=	"";
		var a1 = route.split("-") // Delimiter is a string
		for (var j = 1; j < a1.length; j++)
		{
			detail	=	detail+"-"	+a1[j]+"-" +a[j-1]; 
		}
		document.getElementById("scheduleDetails").value=detail;
	}
	else
	{
		alert("Provide Proper Timings for all Locations");
		return false;
	}
	
}
</script>
<script src="/TMS/script/calender.js" type="text/javascript"></script>

</html>