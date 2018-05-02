<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#confirmpage{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;

}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor confirmation</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="confirmpage">
<% int confirmation = 0; %>
<% int Id_int = 0; %>
<% String VID2 = request.getParameter("VendorID"); %>
<% session.setAttribute("VID", VID2); %>
<% //int VID = Integer.parseInt(VID2); %>
<% int VID = 0; %>
<% try {
	VID=Integer.parseInt(VID2);
} catch(NumberFormatException ex) { 
	confirmation = 2;
}%>


<%
		String sql = "SELECT ID FROM Vendors";
		ResultSet allVendors = stmt.executeQuery(sql);
%>

		<% while(allVendors.next()){ %>
			<% Id_int = allVendors.getInt("ID"); %>
			<% if (VID == Id_int) { 
				confirmation = 1; 
				 } %>
			<% if (confirmation == 0 || confirmation == 2) { 
				confirmation = 2; 
				 } %>
		<% } %>
	
	
	<%
	stmt.close();
	con.close();
	%>
<%if (confirmation == 1) {%> 
	<form action="">
	<input type="hidden" name="VendorID" value=<% request.getParameter("VendorID"); %>>
	</form>
	<%="Thank you. Please go to the vendor home page"%>
	<% session.setAttribute("signed_in", true); %>
	<form action="vendor_home.jsp" method="get">
	<button id = "button1" type="submit">GO!</button>
	</form>
	<%} else if (confirmation == 2) { %>
	<%="Sorry, that Vendor ID is incorrect." %>
	<form action="vendor_signin.jsp" method="get">
	<button id = "button1" type="submit">Please try again.</button>
	</form>
<%}%>
 
</div>

</body>
</html>