<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket</title>
<%
	Vector	totalDetails	=	(Vector)request.getAttribute("totalDetails");
	Vector	customerDetails	=	(Vector)totalDetails.get(0);
	String	ticketNumber	=	(String)customerDetails.get(0);
	customerDetails.remove(0);
	Vector	routeDetails	=	(Vector)totalDetails.get(1);
	int		totalcost		=	0;
%>
</head>
<center><body>
<h1>Ticket Management System</h1>
<h2>-------------------------------------------------------------------------------------------</h2>
<table width="50%">
<%for(int i	=	0;	i	<	customerDetails.size()	;	i++) {%>
<tr>
<td>Customer Name</td>
<td><%=customerDetails.get(i) %></td>
</tr>
<%
totalcost	=	totalcost	+	Integer.parseInt((String)customerDetails.get(i+1));
i	=	i	+	1;} %>
<tr><td>Ticket Number</td><td><%=ticketNumber %></td></tr>
</table>
<h2>-------------------------------------------------------------------------------------------</h2>
<table width="50%">
<tr><td><b>Route Details</b></td></tr></table>
<h2>-------------------------------------------------------------------------------------------</h2>

<table width="50%">
<tr><td>&nbsp;</td></tr>
<tr>
<td><b>From</td>
<td><b>From Date</td>
<td><b>From Time</td>
<td><b>To</td>
<td><b>To Date</td>
<td><b>To Time</td>

</tr>
<%for(int i	=0	;	i<	routeDetails.size();i++){ %>

<tr>
<td><%=routeDetails.get(i) %></td>
<td><%=routeDetails.get(i+2) %></td>
<td><%=routeDetails.get(i+3) %></td>
<td><%=routeDetails.get(i+1) %></td>
<td><%=routeDetails.get(i+4) %></td>
<td><%=routeDetails.get(i+5) %></td>
</tr>
<%i	=	i	+	5	;} %>
</table>
<h2>-------------------------------------------------------------------------------------------</h2>
<table width="50%">
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>Total Cost</td>
<td> $<%=totalcost %></td>
</tr>
</table>
</body>
</center>
</html>