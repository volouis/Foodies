<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.util.Date"
    import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#ratedealpage{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
   	position: absolute;
   	top: 100px;
}
#ratedeal{
	border-width: 4px;
	border-radius: 5px;
  	margin:5px;
 	height: 40px;
 	padding:0px;
    text-align: center;
    background-color: #FFFFFF;    
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thanks for rating!</title>
</head>
<body>
<%@ include file="connect_db.jsp" %>

<div id="ratedealpage">
<% 
//get all info of the vendor to pass back to the vendor page
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

//deal specific
double Deals_Number_Votes = Double.parseDouble(request.getParameter("Deals_Number_Votes"));
String Deals_ID = request.getParameter("Deals_ID");
double Deals_Rating = Double.parseDouble(request.getParameter("Deals_Rating"));

//get new rating
double GivenRating = Double.parseDouble(request.getParameter("GivenRating"));

//get IP address
String IP = request.getRemoteAddr();

//get current Time in needed format
long daysSince1970 = System.currentTimeMillis();
daysSince1970 /= 86400000; //divide by number of milisenconds in a day

//connect to db to perform vote
String sql = "SELECT *"
	+ " FROM IPs"
	+ " WHERE IP = '" + IP + "'";
ResultSet IPs = stmt.executeQuery(sql);
Boolean hasntSubmittedToday = true;	
	while(IPs.next()){
//		System.out.println("LALA" + daysSince1970 + ", " + IPs.getLong("Day"));
		long IPDay = IPs.getLong("Day");
		if(IPDay >= daysSince1970){
			//if greater or equal means that they have already submitted today
			//since current days needs to be greater than last vote
			hasntSubmittedToday = false;
		}
	}
	
if(hasntSubmittedToday){
	//if they haven't submitted today their vote will be sucessful
	//add the new vote into db and recalculate new rating

Deals_Rating *= Deals_Number_Votes;
Deals_Rating += GivenRating;
Deals_Number_Votes++;
Deals_Rating /= Deals_Number_Votes;

sql = "UPDATE Deals"
	+ " SET Rating = " + Deals_Rating + ","
	+ " Number_Votes = " + Deals_Number_Votes + ""
	+ " WHERE ID = " + Deals_ID;

stmt.execute(sql);

//make sure they cant keep voting today, try inserting first to test
//if the IP already exists in our DB
sql = " INSERT INTO IPs"
		+ " VALUES('" + IP + "', " + daysSince1970 + ")";

	try{
	stmt.execute(sql);
	}
	catch(SQLException e){
		//key violation means that IP already exists, if thats the case we
		//simply update the existing IP to the correct day
		sql = " UPDATE IPs"
				+ " SET Day = " + daysSince1970 + ""
				+ " WHERE IP = '" + IP + "'";
		stmt.execute(sql);
	}


%>
Thanks for voting today! You will be able to vote again tomorrow (reset at midnight EST)<br><br>
<%}
else{
%>
Sorry! You have already voted today! You will be able to vote again tomorrow (reset at midnight EST)<br><br>
<%
}
//close connections
stmt.close();
con.close();
%>

<form method="post" action="vendor_details.jsp">
	<input type="hidden" name= "VID" value ="<%=VID %>">
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

	<button id= "ratedeal" type="submit" value="Rate!">Return to vendor page</button>
</form>

</div>

</body>
</html>