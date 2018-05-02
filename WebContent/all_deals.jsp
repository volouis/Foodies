<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="vendor.Vendor"%>
    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Deals</title>
<!-- <link rel="stylesheet" media="screen, projection" href="bootstrap.min.css"> -->
<style>
#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}
#dealresults{
	position: absolute;
	width:1200px;
	left: 250px;
	top: 175px;
	text-align: center;
	background-color: #FFFFFF;
	border-color: #6495ED;
	border-style: solid;
    border-width: 5px; 
}
h1{
	position: absolute;
	top: 80px;
	left: 650px;
}
h3{
	position: absolute;
	top: 120px;
	left: 400px;
}
#VNames{
	border-width: 2px;
	border-radius: 5px;
  	margin:5px;
 	height: 40px;
 	padding:0px;
    text-align: center;
    background-color: #FFFFFF;    
}
</style>
</head>
<body>
<div id="p">
<%@ include file="menu.jsp" %>
<%@ include file="mood_sidebar.jsp" %>
<% ArrayList<Vendor> Vendors = new ArrayList<Vendor>(); %>
<h1 align="center">UofT Foodlovers</h1>
<h3 align="center">Exclusive food deals dor the U of T St.George community, all redeemable with your T Card</h3>
	<%
		sql = "SELECT *"
		+ " FROM Deals INNER JOIN Vendors"
		+ " ON Deals.V_ID = Vendors.ID"
		+ " ORDER BY Deals.Rating DESC";
	
	ResultSet allDeals = stmt.executeQuery(sql);
	
	//put into arraylist
	while(allDeals.next()){
		Vendor V = new Vendor(
				allDeals.getInt("ID"),
				allDeals.getString("VName"),
				allDeals.getString("Address"),
				allDeals.getString("Postal Code"),
				allDeals.getString("Email"),
				allDeals.getString("Website_URL"),
				allDeals.getDouble("Rating"),
				allDeals.getString("Tag1"),
				allDeals.getString("Tag2"),
				allDeals.getString("Tag3"),
				allDeals.getString("Tag4"),
				allDeals.getString("Tag5"),
				allDeals.getString("Neighbourhood_Tag"),
				allDeals.getString("Genre1"),
				allDeals.getString("Genre2"),
				allDeals.getString("Time_Of_Day"),
				allDeals.getString("Time_Of_Day_2"),
				allDeals.getDouble("Number_Votes"),
				allDeals.getString("Image_URL")
				);
		Vendors.add(V);
	}
%>
<%	allDeals = stmt.executeQuery(sql); %>
<!-- scrollable if needed later <div style="height:1000px; overflow:auto;"> -->
	<div id= "dealresults">
		<table id = "table" border="4" cellpadding=6>
			<tr>
				<th>Title</th>
				<th>Vendor</th>
				<th>Description</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Rating</th>
				<th>Meal Time</th>
			</tr>
	<%int i=0; %>
		<% while(allDeals.next()){ %>
			<tr>
				<td><%= allDeals.getString("Title") %></td>
				<td>
					<!-- form to allow passing of variables to vendor details page -->
					<form method="post" action="vendor_details.jsp">
						<input id= "VNames" type="submit" value="<%= Vendors.get(i).getVName()%>">
						<input type="hidden" name= "VID" value ="<%=Vendors.get(i).getID() %>">
						<input type="hidden" name= "VName" value ="<%=Vendors.get(i).getVName() %>">
						<input type="hidden" name= "Address" value ="<%=Vendors.get(i).getAddress() %>">
						<input type="hidden" name= "Postal Code" value ="<%=Vendors.get(i).getPostalCode() %>">
						<input type="hidden" name= "Email" value ="<%=Vendors.get(i).getEmail() %>">
						<input type="hidden" name= "Website_URL" value ="<%=Vendors.get(i).getWebsite_URL() %>">
						<input type="hidden" name= "Rating" value ="<%=Vendors.get(i).getRating() %>">
						<input type="hidden" name= "Tag1" value ="<%=Vendors.get(i).getTag1() %>">
						<input type="hidden" name= "Tag2" value ="<%=Vendors.get(i).getTag2() %>">
						<input type="hidden" name= "Tag3" value ="<%=Vendors.get(i).getTag3() %>">
						<input type="hidden" name= "Tag4" value ="<%=Vendors.get(i).getTag4() %>">
						<input type="hidden" name= "Tag5" value ="<%=Vendors.get(i).getTag5() %>">
						<input type="hidden" name= "Neighbourhood" value ="<%=Vendors.get(i).getNeighbourhood() %>">
						<input type="hidden" name= "Genre1" value ="<%=Vendors.get(i).getGenre1() %>">
						<input type="hidden" name= "Genre2" value ="<%=Vendors.get(i).getGenre2() %>">
						<input type="hidden" name= "Time_Of_Day_1" value ="<%=Vendors.get(i).gettimeOfDay1() %>">
						<input type="hidden" name= "Time_Of_Day_2" value ="<%=Vendors.get(i).gettimeOfDay2() %>">
						<input type="hidden" name= "Number_Votes" value ="<%=Vendors.get(i).getnumberOfVotes() %>">
						<input type="hidden" name= "Image_URL" value ="<%=Vendors.get(i).getImage_URL() %>">
					</form>
				</td>
				<td><%= allDeals.getString("Description") %></td>
				<td><%= allDeals.getString("Start_date") %></td>
				<td><%= allDeals.getString("End_date") %></td>
				<td><%= allDeals.getString("Rating") %></td>
				<td><%= allDeals.getString("Meal_Time") %></td>
			</tr>
		<%
		i++;} %>
		
		</table>
	</div>
	
	
	<%
	//close db connections
	stmt.close();
	con.close();
	%>
</div>
</body>
</html>