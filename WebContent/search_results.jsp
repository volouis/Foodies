<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    import="java.util.ArrayList"
    import="vendor.Vendor"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
	<style type="text/css">
	#VNames {
	vertical-align: middle;
	border-width: 2px;
	border-radius: 5px;
  	margin:5px;
 	height: 40px;
 	padding:0px;
    text-align: center;
    background-color: #FFFFFF;  
	}
	#header{
			position: absolute;
			top: 140px;
			left: 250px;
			font-family:'Verdana',Arial,sans-serif;
   			font-size: 14px;
	}
	#searchResults{
		position: absolute;
		top: 158px;
		left: 250px;
	    font-family:'Verdana',Arial,sans-serif;
		font-size: 14px;
	}	
	#nothing{
		top: 158px;
		left: 250px;
	}	
	
	</style>
</head>
<body>
<!-- /*mood sidebar includes the connect_db*/ -->
<%@ include file="menu.jsp" %>
<%@ include file="mood_sidebar.jsp"%>

<a id="header">Search Results</a>

<%String initialString = request.getParameter("searchString"); 

//split the string on spaces and puncuation (only chars) using regex

//+ means preceeding (character before denoted by the []) can be repeated 1 or more times
//^ means not
// \w is a word character
// double \\ to escape string meta character \
String [] searchWords = initialString.split("[^\\w]+");

ArrayList<Vendor> Vendors = new ArrayList<Vendor>();

//fill the Vendor arraylist with vendors from the database

sql = "SELECT * FROM Vendors";
ResultSet allVendors = stmt.executeQuery(sql);
int highestMatches = 0;

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
	V.setNumberOfMatches(searchWords);
//	System.out.println(V.getNumberOfMatches());
	if(V.getNumberOfMatches() > highestMatches){
		highestMatches = V.getNumberOfMatches();
	}
	Vendors.add(V);
}
//now have arraylist of vendors and the number of matches each has with the search words
//display them only if matches >0 and in order from highest matches to lowest.

//close db connections
stmt.close();
con.close();
%>

<div id= "searchResults">
<%if(highestMatches == 0){%> 
	No Matches!
<%} 

else{%>


	<table border="4" cellpadding=6>
		<tr>
			<th>Vendor Name</th>
			<th>Rating</th>
			<th>Neighbourhood</th>
			<th>Main Genres</th>
			<th>Tags</th>
		</tr>
<%
	while(highestMatches > 0){
		for(Vendor currentVendor : Vendors){
			//display the highest first
			if(currentVendor.getNumberOfMatches() == highestMatches){
				double displayed_Rating = Math.floor(currentVendor.getRating()*100.0)/100.0;
				%>
			<tr>
				<td>
					<!-- form to allow passing of variables to vendor details page -->
					<form method="post" action="vendor_details.jsp">
						<input id= "VNames" type="submit" value="<%= currentVendor.getVName()%>">
						<input type="hidden" name= "VID" value ="<%=currentVendor.getID() %>">
						<input type="hidden" name= "VName" value ="<%=currentVendor.getVName() %>">
						<input type="hidden" name= "Address" value ="<%=currentVendor.getAddress() %>">
						<input type="hidden" name= "Postal Code" value ="<%=currentVendor.getPostalCode() %>">
						<input type="hidden" name= "Email" value ="<%=currentVendor.getEmail() %>">
						<input type="hidden" name= "Website_URL" value ="<%=currentVendor.getWebsite_URL() %>">
						<input type="hidden" name= "Rating" value ="<%=currentVendor.getRating() %>">
						<input type="hidden" name= "Tag1" value ="<%=currentVendor.getTag1() %>">
						<input type="hidden" name= "Tag2" value ="<%=currentVendor.getTag2() %>">
						<input type="hidden" name= "Tag3" value ="<%=currentVendor.getTag3() %>">
						<input type="hidden" name= "Tag4" value ="<%=currentVendor.getTag4() %>">
						<input type="hidden" name= "Tag5" value ="<%=currentVendor.getTag5() %>">
						<input type="hidden" name= "Neighbourhood" value ="<%=currentVendor.getNeighbourhood() %>">
						<input type="hidden" name= "Genre1" value ="<%=currentVendor.getGenre1() %>">
						<input type="hidden" name= "Genre2" value ="<%=currentVendor.getGenre2() %>">
						<input type="hidden" name= "Time_Of_Day_1" value ="<%=currentVendor.gettimeOfDay1() %>">
						<input type="hidden" name= "Time_Of_Day_2" value ="<%=currentVendor.gettimeOfDay2() %>">
						<input type="hidden" name= "Number_Votes" value ="<%=currentVendor.getnumberOfVotes() %>">
						<input type="hidden" name= "Image_URL" value ="<%=currentVendor.getImage_URL() %>">
					</form>
				</td>
				<td><%= displayed_Rating %></td>
				<td><%= currentVendor.getNeighbourhood() %></td>
				<td><%= currentVendor.getGenre1() %>, <%= currentVendor.getGenre2() %></td>
				<td><%= currentVendor.getTag1() %>, <%= currentVendor.getTag2() %>, <%= currentVendor.getTag3() %></td>
			</tr>
				<%
			}
		}
		
		//now list the next highest matches
		highestMatches--;
	}
}%>
	</table>
</div>




</body>
</html>