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
		window.open("/TMS/flightDetails?method=emptyaction","_self")
	}</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TMS/flightDetails.do" name="myform" id="myform" method="post">
<%
Map test=null;
Map	Data=	(Map)request.getAttribute("Data");
if(request.getAttribute("Data")==test)
{
}
else{
%>

<table style="width: 100%;height: 90%">
<tr>

<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td>

<table>
<tr><br>&nbsp;</tr>
<tr><u>Flight Availability Details</u>	</tr>
<tr><td></td><td>Cost</td><td>No Of Tickets</td></tr>
<% 
	
	Map<Integer, List> map = Data;
	Iterator<Map.Entry<Integer, List>> entries = map.entrySet().iterator();
	while (entries.hasNext()) {
	    Map.Entry<Integer, List> entry = entries.next();
	    %>
	    <tr>
	    <td>
	<table border=1>
		<tr>
		<th>Origin</th>
		<th>Destination</th>
		<th>Start Date</th>
		<th>Start Time</th>
		<th>End Date</th>
		<th>End Time</th>
		</tr>
	    <%  
	    String str	="";
	    String str1	="";
	    List list =	entry.getValue(); 
	    
	    					int i	=	0;
	    					for(int count = 0 ; count< list.size()/5;i++)
	    						
	    					{
	    						%>
	    						<tr>
	    						<td><%=list.get(i) %></td>
	    						<td><%=list.get(i+1) %></td>
	    						<td><%=list.get(i+2) %></td>
	    						<td><%=list.get(i+3) %></td>
	    						<td><%=list.get(i+4) %></td>
	    						<td><%=list.get(i+5) %></td>
	    						</tr>
	    					<%	i	=	i	+	5;
	    						count=count+1;
	    					}
	    %>
	    						</table>
	    
	    </td>
	    <td>$<%=request.getAttribute("cost") %></td>
	    <td><b><input type="text" maxlength="2" size="2" name="noOfTickets"  id="noOfTickets" ></b></td><td>   
	    <td><a onclick="move()">Book</a></td>
	       <input type="hidden" name="book"  id="book" value="<%=entry.getKey() %>">
	</tr>
	
	<% 
	}
	%>
</table>
<%} %>
</td></tr>
</table>
</form>
</div>
</body>
<script>
function move(){
	if(document.getElementById("noOfTickets").value=="")
	{
		alert("Please select the number of tickets");
		return false;
	}
	else{
		window.open("/TMS/bookConfirmation.do?method=book&fscode="+document.getElementById("book").value+"&no="+document.getElementById("noOfTickets").value+"&c=<%=request.getAttribute("cost")%>","_self");
	}
}
</script>
</html>