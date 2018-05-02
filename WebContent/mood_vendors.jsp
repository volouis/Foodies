<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"
    import="java.util.*"
    import="vendor.Vendor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table of vendors according to mood</title>
<style>
	
	#dealresults{
		position: absolute;
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
	#table{
		width:1000px;
	}
	#VNames{
		border-width: 2px;
		border-radius: 10px;
  		margin:5px;
 		height: 40px;
		width: 100px; 
 		padding:0px;
    	text-align: center;
    	background-color: #FFFFFF;    
	}
	#p{
   		font-family:'Verdana',Arial,sans-serif;
   		font-size: 14px;
	}
</style>

</head>
<body>

<%@ include file="mood_sidebar.jsp" %>
<%@ include file="menu.jsp" %>
<div id="p">
<% ArrayList<Vendor> Vendors = new ArrayList<Vendor>(); %>
<% String current_mood = request.getParameter("mood"); %>
<h1><%= current_mood%></h1>
<%
			sql = "SELECT DISTINCT *"
			+ " FROM Vendors V, Food_Mood M"
			+ " WHERE (M.Mood = '" + current_mood + "') AND ((( (M.Mood_Tag1 = V.Tag1) OR (M.Mood_Tag1 = V.Tag2) OR (M.Mood_Tag1 =V.Tag3) OR (M.Mood_Tag1 = V.Tag4) OR (M.Mood_Tag1 = V.Tag5))"
			+ " AND ((M.Mood_Tag2 = V.Tag1) OR (M.Mood_Tag2 = V.Tag2) OR (M.Mood_Tag2 = V.Tag3) OR (M.Mood_Tag2 = V.Tag4) OR (M.Mood_Tag2 = V.Tag5))) OR"
			+ " (((M.Mood_Tag1 = V.Tag1) OR (M.Mood_Tag1 = V.Tag2) OR (M.Mood_Tag1 =V.Tag3) OR (M.Mood_Tag1 = V.Tag4) OR (M.Mood_Tag1 = V.Tag5)) AND ((M.Mood_Tag3 = V.Tag1)"
			+ " OR (M.Mood_Tag3 = V.Tag2) OR (M.Mood_Tag3 = V.Tag3) OR (M.Mood_Tag3 = V.Tag4) OR (M.Mood_Tag3 = V.Tag5))) AND"
			+ " (((M.Mood_Tag2 = V.Tag1) OR (M.Mood_Tag2 = V.Tag2) OR (M.Mood_Tag2 =V.Tag3) OR (M.Mood_Tag2 = V.Tag4)) OR ((M.Mood_Tag2 = V.Tag5) AND (M.Mood_Tag3 = V.Tag1)"
			+ " OR (M.Mood_Tag3 = V.Tag2) OR (M.Mood_Tag3 = V.Tag3) OR (M.Mood_Tag3 = V.Tag4) OR (M.Mood_Tag3 = V.Tag5))));";

		ResultSet allVendors = stmt.executeQuery(sql);
%>
<%
while(allVendors.next()){
			Vendor V = new Vendor(
			allVendors.getInt("ID"),
			allVendors.getString("VName"),
			allVendors.getString("Address"),
			allVendors.getString("Postal Code"),
			allVendors.getString("Email"),
			allVendors.getString("Website_URL"),
			allVendors.getDouble("Rating"),
			allVendors.getString("Tag1"),
			allVendors.getString("Tag2"),
			allVendors.getString("Tag3"),
			allVendors.getString("Tag4"),
			allVendors.getString("Tag5"),
			allVendors.getString("Neighbourhood_Tag"),
			allVendors.getString("Genre1"),
			allVendors.getString("Genre2"),
			allVendors.getString("Time_Of_Day"),
			allVendors.getString("Time_Of_Day_2"),
			allVendors.getDouble("Number_Votes"),
			allVendors.getString("Image_URL")
			);
	Vendors.add(V);
}

%>
<div id= "dealresults">
		<table id = "table" border="4" cellpadding=6>
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>Postal Code</th>
				<th>Email</th>
				<th>Website</th>
				<th>Rating</th>
			</tr>
	
		<% for (int i=0 ; i<Vendors.size();i++){ %>
			<tr>
				<td>
				<form method="post" action="vendor_details.jsp">
						<input id= "VNames" type="submit" value="<%= Vendors.get(i).getVName()%>">
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
				<td><%= Vendors.get(i).getAddress() %></td>
				<td><%= Vendors.get(i).getPostalCode() %></td>
				<td><%= Vendors.get(i).getEmail() %></td>
				<td><%= Vendors.get(i).getWebsite_URL() %></td>
				<td><%= Vendors.get(i).getRating() %></td>
				
				
			</tr>
		<%} %>
		
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