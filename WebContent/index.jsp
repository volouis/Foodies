<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import="vendor.Vendor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UofT Foodies!</title>
<!-- <link rel="stylesheet" media="screen, projection" href="bootstrap.min.css"> -->

<style>
html{
	overflow:scroll;
}

#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}

#topdeal{
	width: 550px;
	height: auto;
	position: absolute;
	padding:0px;
	top: 200px;
	left: 250px;
	float:center;
	/*background-color: #A7DBD8;*/
	
}
#timedeal{
	/*background-color: #A7DBD8;*/
	width: 570px;
	height: auto;
	position: absolute;
	padding:0px;
	top: 200px;
	left: 850px;
	float:center;	

}

#vendorbutton{
    
    border-width: 2px;
	border-radius: 10px;
    margin:5px;
    height: 40px;
    width: 150px; 
    padding:0px;
    text-align: center;
    background-color: #FFFFFF;    
}

#title{
	position: absolute;
	top: 70px;
	left: 650px;
	font-weight: normal;
}
#subtitle{
	position: absolute;
	top: 130px;
	left: 330px;
}

#table{
	border-color: #6495ED;
	border-style: solid;
    border-width: 5px;
    
}



</style>
</head>


<body>
<div id = "p">  
<% if (session.isNew()) { 
	session.setAttribute("signed_in", false); 
	}%>


<%@ include file="mood_sidebar.jsp" %>
<%@ include file="menu.jsp" %>

<% ArrayList<Vendor> Vendors = new ArrayList<Vendor>(); %>
<% ArrayList<Vendor> Vendors_times = new ArrayList<Vendor>(); %>
<div id="title">
<h1>UofT Foodies</h1>
</div>

<div id="subtitle">
<h3>Exclusive food deals for the U of T St.George community, all redeemable with your T Card</h3>
</div>




<%
		sql = "SELECT Deals.V_ID, Vendors.*, Deals.Description, Deals.End_date, Deals.Title"
		+ " FROM Deals INNER JOIN Vendors"
		+ " ON Deals.V_ID = Vendors.ID"
		+ " ORDER BY Deals.Rating DESC";
		
		ResultSet topdeal = stmt.executeQuery(sql);
%>

<%
while(topdeal.next()){
			Vendor V = new Vendor(
			topdeal.getInt("ID"),
			topdeal.getString("VName"),
			topdeal.getString("Address"),
			topdeal.getString("Postal Code"),
			topdeal.getString("Email"),
			topdeal.getString("Website_URL"),
			topdeal.getDouble("Rating"),
			topdeal.getString("Tag1"),
			topdeal.getString("Tag2"),
			topdeal.getString("Tag3"),
			topdeal.getString("Tag4"),
			topdeal.getString("Tag5"),
			topdeal.getString("Neighbourhood_Tag"),
			topdeal.getString("Genre1"),
			topdeal.getString("Genre2"),
			topdeal.getString("Time_Of_Day"),
			topdeal.getString("Time_Of_Day_2"),
			topdeal.getDouble("Number_Votes"),
			topdeal.getString("Image_URL")
			);		
	Vendors.add(V);
}

%>
<%topdeal = stmt.executeQuery(sql); %>
    <div id="topdeal">
    	<h4>Top Deals</h4>
    	
		<table  id = "table" border="4" cellpadding=10>
			<%int i=0;%> 
				<%while(topdeal.next() && i<5){ %>
				<tr> 
					<td><%= topdeal.getString("Title") %></td>
					<td>
					
					<form  method="post" action="vendor_details.jsp">
						<button id= "vendorbutton" type="submit" value="<%= Vendors.get(i).getVName()%>"><%= Vendors.get(i).getVName()%></button>
						<input type="hidden" name= "VID" value ="<%=Vendors.get(i).getID() %>">
						<input type="hidden" name= "VName" value ="<%=Vendors.get(i).getVName()%>">
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
					<td><%= topdeal.getString("Description") %></td>
					<td><%= topdeal.getString("End_date") %></td>
				</tr>
			<%
			i++;} %>
		</table> 
		
		
		
	</div>
	
	<%		

		//sql = "SELECT Deals.ID, Vendors.VName AS VName, Deals.Description, Deals.End_date, Deals.Title"
		sql = "SELECT Deals.V_ID, Vendors.*, Deals.Description, Deals.End_date, Deals.Title"
		+ " FROM Deals INNER JOIN Vendors"
		+ " ON Deals.V_ID = Vendors.ID"
		+ " WHERE Deals.Meal_Time = '" + time_deal + "'"
		+ " OR Deals.Meal_Time = 'All Day'"
		+ " ORDER BY Deals.Rating DESC";
			
		ResultSet timedeal = stmt.executeQuery(sql); 
	%>

<%
while(timedeal.next()){
			Vendor V = new Vendor(
			timedeal.getInt("ID"),
			timedeal.getString("VName"),
			timedeal.getString("Address"),
			timedeal.getString("Postal Code"),
			timedeal.getString("Email"),
			timedeal.getString("Website_URL"),
			timedeal.getDouble("Rating"),
			timedeal.getString("Tag1"),
			timedeal.getString("Tag2"),
			timedeal.getString("Tag3"),
			timedeal.getString("Tag4"),
			timedeal.getString("Tag5"),
			timedeal.getString("Neighbourhood_Tag"),
			timedeal.getString("Genre1"),
			timedeal.getString("Genre2"),
			timedeal.getString("Time_Of_Day"),
			timedeal.getString("Time_Of_Day_2"),
			timedeal.getDouble("Number_Votes"),
			timedeal.getString("Image_URL")
			);
	Vendors_times.add(V);
}

%>
<%timedeal = stmt.executeQuery(sql); %>
 	<div id="timedeal">
    	<h4><%=title %></h4>
		<table id = "table" border="4" cellpadding=10>
			<%i=0;%> 
				<%while(timedeal.next() && i<5){ %>
				<tr>
					<td><%= timedeal.getString("Title") %></td>
					<td>
					<form method="post" action="vendor_details.jsp">
						<button id= "vendorbutton" type="submit" value="<%= Vendors_times.get(i).getVName()%>"><%= Vendors_times.get(i).getVName()%></button>
						<input type="hidden" name= "VID" value ="<%=Vendors_times.get(i).getID() %>">
						<input type="hidden" name= "VName" value ="<%=Vendors_times.get(i).getVName()%>">
						<input type="hidden" name= "Address" value ="<%=Vendors_times.get(i).getAddress() %>">
						<input type="hidden" name= "Postal Code" value ="<%=Vendors_times.get(i).getPostalCode() %>">
						<input type="hidden" name= "Email" value ="<%=Vendors_times.get(i).getEmail() %>">
						<input type="hidden" name= "Website_URL" value ="<%=Vendors_times.get(i).getWebsite_URL() %>">
						<input type="hidden" name= "Rating" value ="<%=Vendors_times.get(i).getRating() %>">
						<input type="hidden" name= "Tag1" value ="<%=Vendors_times.get(i).getTag1() %>">
						<input type="hidden" name= "Tag2" value ="<%=Vendors_times.get(i).getTag2() %>">
						<input type="hidden" name= "Tag3" value ="<%=Vendors_times.get(i).getTag3() %>">
						<input type="hidden" name= "Tag4" value ="<%=Vendors_times.get(i).getTag4() %>">
						<input type="hidden" name= "Tag5" value ="<%=Vendors_times.get(i).getTag5() %>">
						<input type="hidden" name= "Neighbourhood" value ="<%=Vendors_times.get(i).getNeighbourhood() %>">
						<input type="hidden" name= "Genre1" value ="<%=Vendors_times.get(i).getGenre1() %>">
						<input type="hidden" name= "Genre2" value ="<%=Vendors_times.get(i).getGenre2() %>">
						<input type="hidden" name= "Time_Of_Day_1" value ="<%=Vendors_times.get(i).gettimeOfDay1() %>">
						<input type="hidden" name= "Time_Of_Day_2" value ="<%=Vendors_times.get(i).gettimeOfDay2() %>">
						<input type="hidden" name= "Number_Votes" value ="<%=Vendors_times.get(i).getnumberOfVotes() %>">
						<input type="hidden" name= "Image_URL" value ="<%=Vendors_times.get(i).getImage_URL() %>">
					</form>
					</td>
					<td><%= timedeal.getString("Description") %></td>
					<td><%= timedeal.getString("End_date") %></td>
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