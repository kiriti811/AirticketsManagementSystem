<%@page import="javaActionForms.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String	message	=	"Data Added Successfully";
%>
<script type="text/javascript">
	function add() {
		document.myform.submit();
	}
	function Reset(){
		window.open("/TMS/route.do?method=emptyaction","_self")
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/TMS/css/styles.css">
</head>
<body><center>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action="/TMS/route.do" name="myform" id="myform" method="post">
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
<td width="30%"><div><jsp:include page='left.jsp'></jsp:include></div></td>
<td><table><tr>
<td><h1>Route Details</h1></td>
</tr>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
	<input name="id" id="id" type="hidden" value="<%=object.getId()%>">
<tr>
<td>Route Id</td>
<td><input name="routeId" id="routeId" type="text" value="<%=object.getRouteId()%>"></td>


</tr>


<tr>
<td>Location</td>

			<td><select id="location" name="location">
				<%
				Vector	vec	=	dropDown.dropDown("location");
				for(int i=0;i<vec.size();i++) {%>
				<option value	="<%=vec.get(i+1)%>"><%=vec.get(i+1) %></option>
				<%i++;
				} %>
				</select></td>
				
				<td>
<input class="button" type="button" value="Route" onclick="rout()">
</td></tr>
 
<tr>
<td>Nodes</td>
<td><input name="nodes" id="nodes" type="text" value="<%=object.getNodes()%>"></td>


</tr>


<tr>
<td>Route</td>
<td>
<textarea name="route" id="route" rows="10" cols="30"><%=object.getRoute()%></textarea>

</td>


</tr>

<tr><td><input type=button  class=button value=submit onclick="add()"></td>
<td><input type=button  class=button value=Reset onclick="Reset()"></td>
</tr>
<tr><td>&nbsp;</td><td>	</td></tr>
</table>
	<iframe style="border: 1px; height: 1000px; weight: 1200px"
			 src="/TMS/route.do?method=list"></iframe> 
</td></tr>
</table>
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