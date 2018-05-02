<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
   	position: absolute;
   	top:100px;  	
}
#button{
    border-style: solid;
    border-width: 5px;
    border-radius: 10px;
    margin:5px;
    height: 100px;
    width: 150px;
    border-color: #6495ED;
    background-color: #FFFFFF;    
    padding:10px;
    text-align: center;
}


</style>
<title>Registered!</title>
</head>
<body>
<%@ page import="java.util.ArrayList" %>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>

<!-- Lets generate a random vendor ID as well as check to make sure the
the id does not already exist in our DB. If it does exist, generate until
it does not. -->

<div id="p">
<%
//gather arraylist of current VID's in DB
ArrayList<String> currentIDList = new ArrayList<String>();
String sql = "SELECT ID"
	+ " FROM Vendors";

ResultSet currentIDs = stmt.executeQuery(sql);

while(currentIDs.next()){
	currentIDList.add(currentIDs.getString("ID"));
}

//generate new ID between 1 and 100000001 as the new VID 
int newID = (int) (100000000*Math.random()) + 1;

while(currentIDList.contains(newID)){
	//if the generated ID is already in the DB then make new one
	newID = (int) (100000000*Math.random()) + 1;
}

//now insert!

sql = "INSERT INTO Vendors"
	+ " VALUES (" + newID + ", '" + request.getParameter("VName") + "', '" + request.getParameter("Address") 
	+ "', '" + request.getParameter("Postal Code") + "', '" + request.getParameter("Email") 
	+ "', '" + request.getParameter("Website_URL") + "', " + "0"
	+ ", '" + request.getParameter("Tag1") + "', '" + request.getParameter("Tag2") 
	+ "', '" + request.getParameter("Tag2") + "', '" + request.getParameter("Tag4")
	+ "', '" + request.getParameter("Tag5") + "', '" + request.getParameter("Neighbourhood")
	+ "', '" + request.getParameter("Genre1") + "', '" + request.getParameter("Genre2") 
	+ "', '" + request.getParameter("Time_of_Day1") + "', " + "0" 
	+ ", '" + request.getParameter("Time_of_Day2") + "', '" +  request.getParameter("Image_URL") + "');";

stmt.execute(sql);

// close database connections
stmt.close();
con.close();
%>

CONGRATS YOU MADE YOUR ACCOUNT!!!!!
<br>
Your vendor ID is: <b><%=newID %></b>
<br>
write this down! You will need it to identify yourself to us! Now go to the vendors page and login

<form method="post" action="vendor_general.jsp">
	<button id = "button" type="submit">Go To Vendor Login</button>
</form>


</div>

</body>
</html>