<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#vendorhistory{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;

}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor Deal History</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="vendorhistory">
<% String VID2 = session.getAttribute("VID").toString();%>
<% int VID = Integer.parseInt(VID2); %>

<%
		String sql = "SELECT * FROM Deals WHERE V_ID = " + VID;
		ResultSet allDeals = stmt.executeQuery(sql);
%>



	<div style="height:1000px; overflow:auto;">
		<table border="4" cellpadding=6>
			<tr>
				<th>Deal Title</th>
				<th>Deal Description</th>
				<th>Rating</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Delete Deal</th>
			</tr>
	
		<% while(allDeals.next()){ %>
		
			<tr>
				<td><%= allDeals.getString("Title") %></td>
				<td><%= allDeals.getString("Description") %></td>
				<td><%= allDeals.getString("Rating") %></td>
				<td><%= allDeals.getString("Start_date") %></td>
				<td><%= allDeals.getString("End_date") %></td>
				<td>
					<form method="post" action="vendor_deleted_deal.jsp">
						<button id = "button1" type="submit">Delete</button>
						<input type="hidden" name= "Deal_ID" value ="<%=allDeals.getString("ID") %>">
					</form>
				</td>
			</tr>
			
		<%} %>
		
		</table>
	</div>

		<% while(allDeals.next()){ %>
			<%=allDeals.getInt("ID")%>
		<% } %>
		</div>
</body>
</html>