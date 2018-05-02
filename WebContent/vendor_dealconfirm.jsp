<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#dealconfirm{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor Deal Confirmation</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>

<div id="dealconfirm">
<%String VID2 = session.getAttribute("VID").toString();%>
<% int VID = Integer.parseInt(VID2); %>
<% String deal_description = request.getParameter("dealdescription"); %>
<% String deal_start_month = request.getParameter("startmonth"); %>
<% String deal_start_day = request.getParameter("startday"); %>
<% String deal_start_year = request.getParameter("startyear"); %>
<% String deal_end_month = request.getParameter("endmonth"); %>
<% String deal_end_day = request.getParameter("endday"); %>
<% String deal_end_year = request.getParameter("endyear"); %>
<% String deal_meal_time = request.getParameter("Timeofday"); %>
<% String deal_title = request.getParameter("dealtitle"); %>
<% String deal_start = deal_start_month + "/" + deal_start_day + "/" +deal_start_year; %>
<% String deal_end = deal_end_month + "/" + deal_end_day + "/" +deal_end_year; %>

<%
		String sql = "INSERT INTO Deals (V_ID, Description, Start_date, End_date, Meal_Time, Title, Rating, Number_Votes)" 
				+ " VALUES ( '" + VID + "', '" + deal_description + "', '" + deal_start + "', '" + deal_end + "', '" + deal_meal_time + "', '" + deal_title + "', 0, 0)";
		//String sql = "INSERT INTO Deals (Description)" 
				//+ " VALUES ( '" + deal_description + "')";
		stmt.execute(sql);
%>

<%
	stmt.close();
	con.close();
%>
Thank you for posting your deal!
<br>
It will be posted on U of T Foodies as soon as the deal begins!

<br><br>
<form action="vendor_home.jsp">
<button id = "button1" type="submit">Return</button>
</form>
</div>
</body>
</html>