<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.Date"
    import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#feedbackconfirm{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor Feedback Confirm</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="feedbackconfirm">
<%String VID2 = session.getAttribute("VID").toString();%>
<% int VID = Integer.parseInt(VID2); %>
<% String subject = request.getParameter("feedbacksubject"); %>
<% String description = request.getParameter("feedback"); %>
<% Date current_date = new Date();  %>
<% SimpleDateFormat fd = new SimpleDateFormat ("MM/dd/yyyy"); %>
<% String c_date = fd.format(current_date); %>
<% String date = c_date.toString();  %>

<%
		String sql = "INSERT INTO Feedback_Vendor (VID, Subject, FDate, Description)" 
				+ " VALUES ('" + VID + "', '" + subject + "', '" + c_date + "', '" + description + "')";
		stmt.execute(sql);



	stmt.close();
	con.close();
%>
	
Thank you for posting your feedback!
<br>

<br><br>
<form action = "vendor_home.jsp">
<button id = "button1" type="submit">Return</button>
</form>
</div>
</body>
</html>