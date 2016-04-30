<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body>
	<%
String str = null;
if (session.getAttribute("userName")==str) {
	request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);	
} else {

if(session.getAttribute("userName").equals("admin")){
	%>
	
	<div class=nav1>
	<ul>
	<li><a href="#" style="text-decoration: none">Home</a></li>
	<li><a href="/TMS/tripType.do?method=emptyaction" style="text-decoration: none">Trip Types</a></li>
	<li><a href="/TMS/flightDetails.do?method=emptyaction" style="text-decoration: none">Flight details</a></li>
	<li><a href="/TMS/airportDetails.do?method=emptyaction" style="text-decoration: none">Airport Details</a></li>
	<li><a href="/TMS/route.do?method=emptyaction" style="text-decoration: none">Routing</a></li>
	<li><a href="/TMS/flightSchedule.do?method=emptyaction" style="text-decoration: none">Flight Schedule</a></li>
	<li><a href="/TMS/searchFlights.do?method=emptyaction" style="text-decoration: none">Flight Search</a></li>
	<li><a href="/TMS/searchTicket.do?method=emptyaction" style="text-decoration: none">Search Ticket</a></li>
	<li><a href="/TMS/dailyReport.do?method=emptyaction" style="text-decoration: none">Day to Day Report</a></li>
	<li><a href="/TMS/yearlyReport.do?method=emptyaction" style="text-decoration: none">Yearly Report</a></li>
	<li><a href="/TMS/logout.do?method=logout" style="text-decoration: none">Logout</a></li>
	</ul>
	</div>
	<%
	}
else
{
	%>
	<div class=nav1>
	<ul>
	<li><a href="/TMS/userProfiles.do?method=listId&id=<%=session.getAttribute("id") %>&cc=8" style="text-decoration: none">Edit Profile</a></li>
	<li><a href="/TMS/changePassword.do?method=emptyaction" style="text-decoration: none">Change Password</a></li>
	<li><a href="/TMS/searchFlights.do?method=emptyaction" style="text-decoration: none">Flight Search</a></li>
	<li><a href="/TMS/searchTicket.do?method=emptyaction" style="text-decoration: none">Search Ticket</a></li>
	<li><a href="/TMS/userHistory.do?method=load" style="text-decoration: none">User History</a></li>
	<li><a href="/TMS/logout.do?method=logout" style="text-decoration: none">Logout</a></li>
	</ul>
	</div>
	<%}
}
%>
</body>
</html>