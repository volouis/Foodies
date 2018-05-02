<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#venhome{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor home</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<%@ include file="connect_db.jsp"  %>
<div id="venhome">
<%String VID2 = session.getAttribute("VID").toString();%>
<% String name = "nothing"; %>
<% int Id_int = 0; %>
<% int VID = Integer.parseInt(VID2); %>


<%
		String sql = "SELECT * FROM Vendors";
	ResultSet vendor_ids = stmt.executeQuery(sql);
%>

<% while(vendor_ids.next()){ %>
			<% if (VID == vendor_ids.getInt("ID")) { 
				name = vendor_ids.getString("VName"); 
				break;
				 } %>
		<% } %>


Welcome, <%=name %>
<form action = "vendor_deal.jsp"><button id = "button1" type="submit">Post a deal</button></form>
<br><br>
<form action = "vendor_history.jsp"><button id = "button1" type="submit">Deal History</button></form>
<br><br>
<form action = "vendor_feedback.jsp"><button id = "button1" type="submit">Feedback</button></form>
<br><br>
</div>
</body>
</html>