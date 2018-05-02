<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#button{
	border-width: 2px;
	border-radius: 10px;
    margin:5px;
    height: 40px;
    width: 100px; 
    padding:0px;
    text-align: center;
    background-color: #FFFFFF;     
   	position: absolute;
   	top:250px;
   	left:360px;
    text-align: center;
}
#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
   	position: absolute;
   	top:100px;  	
}
#space{
	height:20px;
}
#box{
	width:180px;
}

</style>
<title>SignUp Step 2</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>

<%
//get fields from vendor_signup_1, assign them to hidden variables
//so can be passed on to the insert

String VName = request.getParameter("VName"); 
String Address = request.getParameter("Address"); 
String postalCode = request.getParameter("Postal Code");
String Email = request.getParameter("Email"); 
String Website_URL = request.getParameter("Website_URL");
String Image_URL = request.getParameter("Image_URL");
%>
<div id="p">
<form method="post" action="vendor_signup_confirm.jsp">

<!-- assign hidden variables to the values we got from last page-->

<input type="hidden" name="VName" value="<%=VName %>">
<input type="hidden" name="Address" value="<%=Address %>">
<input type="hidden" name="Postal Code" value="<%=postalCode %>">
<input type="hidden" name="Email" value="<%=Email %>">
<input type="hidden" name="Website_URL" value="<%=Website_URL %>">
<input type="hidden" name="Image_URL" value="<%=Image_URL %>">

	<%=VName %>
<table>
<tr>
	<td id="box">
	Genre 1:
	</td>
	<td>
	<select name="Genre1">
		<%
		String sql = "SELECT Genres"
		+ " FROM Genres";
		
		ResultSet Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Genres");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr>

	<td>
	Genre 2:
	</td>
	<td>
	<select name="Genre2">
		<%
		sql = "SELECT Genres"
		+ " FROM Genres";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Genres");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr id="space"></tr>
<tr>
	<td>
	Neighbourhood:
	</td>
	<td>
	<select name="Neighbourhood">
		<%
		sql = "SELECT Neighbourhood"
		+ " FROM Neighbourhoods";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Neighbourhood");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr id="space"></tr>
<tr>
	<td>
	Tag 1:
	</td>
	<td>
	<select name="Tag1">
		<%
		sql = "SELECT Mood_Tag"
		+ " FROM Mood_Tags";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Mood_Tag");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr>
	<td>
	Tag 2:
	</td>
	<td>
	<select name="Tag2">
		<%
		sql = "SELECT Mood_Tag"
		+ " FROM Mood_Tags";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Mood_Tag");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	
</tr>
<tr>
	<td>
	Tag 3:
	</td>
	<td>
	<select name="Tag3">
		<%
		sql = "SELECT Mood_Tag"
		+ " FROM Mood_Tags";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Mood_Tag");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr>
	<td>
	Tag 4:
	</td>
	<td>
	<select name="Tag4">
		<%
		sql = "SELECT Mood_Tag"
		+ " FROM Mood_Tags";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Mood_Tag");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr>
	<td>
	Tag 5:
	</td>
	<td>
	<select name="Tag5">
		<%
		sql = "SELECT Mood_Tag"
		+ " FROM Mood_Tags";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Mood_Tag");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr id="space"></tr>
<tr>
	<td>	
	Optimal Time of Day 1:
	</td>
	<td>
	<select name="Time_of_Day1">
		<%
		sql = "SELECT Time_Of_day"
		+ " FROM Time_Of_Day";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Time_Of_day");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>
<tr>
		<td>
		Optimal Time of Day 2:
		</td>
	<td>
	<select name="Time_of_Day2">
		<%
		sql = "SELECT Time_Of_day"
		+ " FROM Time_Of_Day";
		
		Tags = stmt.executeQuery(sql);
	
		while(Tags.next()) {
		String value = Tags.getString("Time_Of_day");%>
			<option value="<%=value%>"> <%=value%></option>
		<% }%>
	</select>
	</td>
</tr>

</table>	


	
	
	<button id = "button" type="submit">Submit</button>
</form>
</div>


</body>
</html>