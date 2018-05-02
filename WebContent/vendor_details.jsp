<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor Info</title>

<style>
	#head{
		position: absolute;
		left:650px;
		top:100px;
	}
	#picture{
		position: absolute;
		top:200px;
		left:800px;
	}
	#info{
		position: absolute;
		left: 250px;
		top:150px;
	}
	#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
	}
	#rate{
    border-width: 2px;
	border-radius: 10px;
    margin:5px;
    height: 40px;
    width: 100px; 
    padding:0px;
    text-align: center;
    background-color: #FFFFFF;    
	}
	
	#table{
	position: absolute;	
	top: 500px;
	left: 250px;
	border-color: #6495ED;
	border-style: solid;
    border-width: 5px;  
	}
	#GivenRating{
	border-width: 4px;
	border-radius: 5px;
  	margin:5px;
 	height: 40px;
 	width:70px;
 	padding:0px;
    text-align: center;
    background-color: #FFFFFF;    
	}
	
</style>

</head>
<body>
<%@ include file="mood_sidebar.jsp" %>
<%@ include file="menu.jsp" %>
<div id = p>
<% 
//get all info of the vendor
String VID = request.getParameter("VID"); 
String VName = request.getParameter("VName");
String Address = request.getParameter("Address");
String Postal_Code = request.getParameter("Postal Code");
String Email = request.getParameter("Email");
String Website_URL = request.getParameter("Website_URL");
double Rating = Double.parseDouble(request.getParameter("Rating"));
String Tag1 = request.getParameter("Tag1");
String Tag2 = request.getParameter("Tag2");
String Tag3 = request.getParameter("Tag3");
String Tag4 = request.getParameter("Tag4");
String Tag5 = request.getParameter("Tag5");
String Neighbourhood = request.getParameter("Neighbourhood");
String Genre1 = request.getParameter("Genre1");
String Genre2 = request.getParameter("Genre2");
String Time_Of_Day_1 = request.getParameter("Time_Of_Day_1");
String Time_Of_Day_2 = request.getParameter("Time_Of_Day_2");
double Number_Votes = Double.parseDouble(request.getParameter("Number_Votes"));
String Image_URL = request.getParameter("Image_URL");

//truncate the rating to 2 decimal places for display purposes
double displayed_Rating = Math.floor(Rating*100.0)/100.0;

%>


<h1 id="head">Vendor: <%=VName %></h1>
<img id="picture" src="<%=Image_URL %>" style="width:400px;height:200px">

<div id = "info">
<br>
Rating: <%=displayed_Rating %> / 5 <br>

<form method="post" action="rated_a_vendor.jsp">
	How would you rate this vendor?:
	<select name="GivenRating">
		<option value="1"> 1
		<option value="2"> 2
		<option value="3"> 3
		<option value="4"> 4
		<option value="5"> 5
	</select>
	<input type="hidden" name= "VID" value ="<%=VID %>">
	<input id= "GivenRating" type="submit" value="Rate!">
	
	<input type="hidden" name= "VName" value ="<%=VName %>">
	<input type="hidden" name= "Address" value ="<%=Address %>">
	<input type="hidden" name= "Postal Code" value ="<%=Postal_Code %>">
	<input type="hidden" name= "Email" value ="<%=Email %>">
	<input type="hidden" name= "Website_URL" value ="<%=Website_URL %>">
	<input type="hidden" name= "Rating" value ="<%=Rating %>">
	<input type="hidden" name= "Tag1" value ="<%=Tag1 %>">
	<input type="hidden" name= "Tag2" value ="<%=Tag2 %>">
	<input type="hidden" name= "Tag3" value ="<%=Tag3 %>">
	<input type="hidden" name= "Tag4" value ="<%=Tag4 %>">
	<input type="hidden" name= "Tag5" value ="<%=Tag5 %>">
	<input type="hidden" name= "Neighbourhood" value ="<%=Neighbourhood %>">
	<input type="hidden" name= "Genre1" value ="<%=Genre1 %>">
	<input type="hidden" name= "Genre2" value ="<%=Genre2 %>">
	<input type="hidden" name= "Time_Of_Day_1" value ="<%=Time_Of_Day_1 %>">
	<input type="hidden" name= "Time_Of_Day_2" value ="<%=Time_Of_Day_2 %>">
	<input type="hidden" name= "Number_Votes" value ="<%=Number_Votes %>">
	<input type="hidden" name= "Image_URL" value ="<%=Image_URL %>">
</form>
<br>

<b>Contact Information:</b><br>
Address: <%=Address %><br>
Postal Code: <%=Postal_Code %><br>
Neighbourhood: <%=Neighbourhood %><br>
Email: <%=Email %><br>
Website: <a href="<%=Website_URL %>"></a><br><br>

<b>Type of Food</b><br>
Genres: <%=Genre1 %>, <%=Genre2 %><br>
Tags: <%=Tag1%>, <%=Tag2%>, <%=Tag3%>, <%=Tag4%>, <%=Tag5%><br><br>

<b>Best Times to go: </b><%=Time_Of_Day_1 %> and/or <%=Time_Of_Day_2 %><br><br>



</div>



<div id="table">

<b>Offered Deals (present your T-card at vendor to be eligible for these deals)</b>

<%	
sql = "SELECT * " 
	+ " FROM Deals"
	+ " WHERE V_ID = " + VID;

ResultSet deals = stmt.executeQuery(sql);
%>


	<table border="4" cellpadding="6">
		
			<tr>
				<th>Give Rating</th>
				<th>Title</th>
				<th>Description</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Rating</th>
				<th>Meal Time</th>
			</tr>
		<%while(deals.next()){ 
		String Deals_Rating = deals.getString("Rating");%>
			<tr>
				<td>
					<form method="post" action="rated_a_deal.jsp">
						<select name="GivenRating">
							<option value="1"> 1
							<option value="2"> 2
							<option value="3"> 3
							<option value="4"> 4
							<option value="5"> 5
						</select>
						<input type="hidden" name= "VID" value ="<%=VID %>">
						<!-- <input id= "GivenRating" type="submit" value="Rate!"> -->
						<button id= "rate" type="submit" value="Rate!">Rate!</button>
						
						<input type="hidden" name= "VName" value ="<%=VName %>">
						<input type="hidden" name= "Address" value ="<%=Address %>">
						<input type="hidden" name= "Postal Code" value ="<%=Postal_Code %>">
						<input type="hidden" name= "Email" value ="<%=Email %>">
						<input type="hidden" name= "Website_URL" value ="<%=Website_URL %>">
						<input type="hidden" name= "Rating" value ="<%=Rating %>">
						<input type="hidden" name= "Tag1" value ="<%=Tag1 %>">
						<input type="hidden" name= "Tag2" value ="<%=Tag2 %>">
						<input type="hidden" name= "Tag3" value ="<%=Tag3 %>">
						<input type="hidden" name= "Tag4" value ="<%=Tag4 %>">
						<input type="hidden" name= "Tag5" value ="<%=Tag5 %>">
						<input type="hidden" name= "Neighbourhood" value ="<%=Neighbourhood %>">
						<input type="hidden" name= "Genre1" value ="<%=Genre1 %>">
						<input type="hidden" name= "Genre2" value ="<%=Genre2 %>">
						<input type="hidden" name= "Time_Of_Day_1" value ="<%=Time_Of_Day_1 %>">
						<input type="hidden" name= "Time_Of_Day_2" value ="<%=Time_Of_Day_2 %>">
						<input type="hidden" name= "Number_Votes" value ="<%=Number_Votes %>">
						<input type="hidden" name= "Image_URL" value ="<%=Image_URL %>">
						
						<input type="hidden" name= "Deals_Number_Votes" value ="<%=deals.getString("Number_Votes") %>">
						<input type="hidden" name= "Deals_ID" value="<%=deals.getString("ID") %>">	
						<input type="hidden" name= "Deals_Rating" value="<%=Deals_Rating %>">					
					</form>
				</td>
				<td><%= deals.getString("Title") %></td>
				<td><%= deals.getString("Description") %></td>
				<td><%= deals.getString("Start_date") %></td>
				<td><%= deals.getString("End_date") %></td>
				<td><%= Deals_Rating %></td>
				<td><%= deals.getString("Meal_Time") %></td>
			</tr>
		<%}%>
		
		
		
		</table>
	
</div>

</div>

</body>
</html>