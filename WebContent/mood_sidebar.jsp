<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    import="java.util.Date"
    import="java.util.*"
	import="java.text.*"
	import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>mood sidebar</title>

<style>
#mood{
	position-x: absolute;
	position-y: relative;
	text-align:center;
	
    width:200px;
    height: 690px;
	margin-top: 70px;
    float:left;
    padding:10px;
}
#button{
    border-style: solid;
    border-width: 5px;
    border-radius: 10px;
    margin:5px;
    height: 100px;
    width: 120px;
    border-color: #6495ED;
    background-color: #FFFFFF;    
    padding:10px;
    top: 50%;
    text-align: center;
}
</style>
</head>

<body>
<%@ include file="connect_db.jsp"  %>
<% Date current_date = new Date(); %>
<% String hour = new SimpleDateFormat("k").format(current_date); %>
<% int current_timeofday = 0; %>
<% String time_deal = "Breakfast"; %>
<% String title = "Breakfast Deals"; %>
<% 
if(Integer.parseInt(hour) < 9 && Integer.parseInt(hour) > 5) {
	current_timeofday = 0; //breakfast
	time_deal = "Breakfast";
	title = "Breakfast Deals";
} else if (Integer.parseInt(hour) < 11) {
	current_timeofday = 1; //brunch
	time_deal = "Brunch";
	title = "Brunch Deals";
} else if (Integer.parseInt(hour) < 16) {
	current_timeofday = 2; //lunch
	time_deal = "Lunch";
	title = "Lunch Deals";
} else if(Integer.parseInt(hour) < 21) {
	current_timeofday = 3; //dinner
	time_deal = "Dinner";
	title = "Dinner Deals";
} else {
	current_timeofday = 4;//late night
	time_deal = "Late Night";
	title = "Late Night Deals";
}	
%>

<%
		String sql = "SELECT *"
		+ " FROM Food_Mood"
		+ " WHERE Time_of_Day = '" + time_deal + "'"
		+ " OR Time_of_Day = 'All Day'";
			
		ResultSet mood = stmt.executeQuery(sql); 
%>

<% ArrayList<String> list = new ArrayList<String>(); %>
<% while(mood.next()){ %>
				<% list.add(mood.getString("Mood")); %>
	<%} %>
	
<%Collections.shuffle(list); %>

<div id="mood">
		<h4>Food For Your Mood</h4>
		
				
					<form method="post" action="mood_vendors.jsp">
						<button id = "button" type="submit"  value=<%=list.get(0) %> name = "mood"> <%=list.get(0) %></button>
					</form>					
				
				
				
					<form method="post" action="mood_vendors.jsp">
						<button id = "button" type="submit"  value=<%=list.get(1) %> name = "mood"> <%=list.get(1) %></button>
					</form>	
				
					
				
					<form method="post" action="mood_vendors.jsp">
						<button id = "button" type="submit"  value=<%=list.get(2) %> name = "mood"> <%=list.get(2) %></button>
					</form>	
				
				
				
					<form method="post" action="mood_vendors.jsp">
						<button id = "button" type="submit"  value=<%=list.get(3) %> name = "mood"> <%=list.get(3) %></button>
					</form>	
				
				
				
					<form method="post" action="mood_vendors.jsp">
						<button id = "button" type="submit"  value=<%=list.get(4) %> name = "mood"> <%=list.get(4) %></button>
					</form>	
				
	</div>
	

</body>
</html>
