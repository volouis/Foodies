<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px; 	
}
#button{
    border-width: 2px;
	border-radius: 10px;
    margin:5px;
    height: 40px;
    width: 100px; 
    padding:0px;
    text-align: center;
    background-color: #FFFFFF;  
    text-align: center;
    position: absolute;
    top:480px;
    left: 330px;
}
#space{
	height:20px;
}
a{
	font-weight: bold;
}
#qw{
	width:200px;
}
#headline{
position: absolute;
    left: 530px;
}
#info{
position: absolute;
top:100px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SignUp Confirmation</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="p">
<div id="headline">
<h1 align="center">SignUp Confirmation</h1>
<h2 align="center">Is this information correct?</h2>
</div>
<table id="info">

	<tr id="qw">
		<td>
		<a>Store Name:</a>
		</td>
		<td>
		<%= request.getParameter("VName")%>
		</td>
	</tr>
		
	<tr>
		<td>	
		<a>Address:</a> 
		</td>
		<td>
		<%= request.getParameter("Address")%> <br>
		</td>
	</tr>
	<tr>
		<td>
		<a>Postal Code:</a> 
		</td>
		<td><%= request.getParameter("Postal Code")%> 
		</td>
	</tr>
	<tr>
		<td>
		<a>Email:</a> 
		</td>
		<td>
		<%= request.getParameter("Email")%> 
		</td>
	</tr>
	<tr>
		<td>
		<a>Website URL:</a> 
		</td>
		<td>
		<%= request.getParameter("Website_URL")%> 
		</td>
	</tr>
	<tr>
		<td>
		<a>Imagine URL: </a>
		</td>
		<td>
		<%= request.getParameter("Image_URL")%> 
		</td>
	</tr>
	<tr>
	<td>
		<hr size=3>
	</td>
	</tr>
	<tr>
		<td>
		<a>Genre 1:</a>
		</td>
		<td>
		 <%= request.getParameter("Genre1") %> 
		</td>
	</tr>
	<tr>
		<td>
		<a>Genre 2: </a>
		</td>
		<td>
		<%= request.getParameter("Genre2") %> 
		</td>
	</tr>
	<tr id="space"></tr>		
	<tr>
		<td>
		<a>Neighbourhood:</a>
		</td>
		<td>
		 <%= request.getParameter("Neighbourhood") %> 
		</td>
	</tr>
	<tr id="space"></tr>		
	<tr>
		<td>
		<a>Tag 1:</a>
		</td>
		<td>
		 <%= request.getParameter("Tag1") %> 
		</td>
	</tr>		
	<tr>
		<td>
		<a>Tag 2:</a>
		</td>
		<td>
		 <%= request.getParameter("Tag2") %> 
		</td>
	</tr>		
	<tr>
		<td>
		<a>Tag 3:</a>
		</td>
		<td>
		 <%= request.getParameter("Tag3") %> 
		</td>
	</tr>		
	<tr>
		<td>
		<a>Tag 4:</a>
		</td>
		<td>
		 <%= request.getParameter("Tag4") %> 
		</td>
	</tr>		
	<tr>
		<td>
		<a>Tag 5: </a>
		</td>
		<td>
		<%= request.getParameter("Tag5") %> 
		</td>
	</tr>		
	<tr id="space"></tr>
	<tr>
		<td>
		<a>Optimal Time of Day 1: </a>
		</td>
		<td>
		<%= request.getParameter("Time_of_Day1") %> 
		</td>
	</tr>		
	<tr>
		<td>
		<a>Optimal Time of Day 2:</a>
		</td>
		<td>
		<%= request.getParameter("Time_of_Day2") %> 
		</td>
	</tr>

		<form method="post" action="vendor_signup_insert.jsp">
			<input type="hidden" name="VName" value="<%=request.getParameter("VName")%>">
			<input type="hidden" name="Address" value="<%=request.getParameter("Address") %>">
			<input type="hidden" name="Postal Code" value="<%=request.getParameter("Postal Code")%>">
			<input type="hidden" name="Email" value="<%=request.getParameter("Email")%>">
			<input type="hidden" name="Website_URL" value="<%=request.getParameter("Website_URL")%>">
			<input type="hidden" name="Image_URL" value="<%=request.getParameter("Image_URL") %>">
		
			<input type="hidden" name="Genre1" value="<%=request.getParameter("Genre1") %>">
			<input type="hidden" name="Genre2" value="<%=request.getParameter("Genre2") %>">
			<input type="hidden" name="Neighbourhood" value="<%=request.getParameter("Neighbourhood") %>">
			<input type="hidden" name="Tag1" value="<%=request.getParameter("Tag1") %>">
			<input type="hidden" name="Tag2" value="<%=request.getParameter("Tag2") %>">
			<input type="hidden" name="Tag3" value="<%=request.getParameter("Tag3") %>">
			<input type="hidden" name="Tag4" value="<%=request.getParameter("Tag4") %>">
			<input type="hidden" name="Tag5" value="<%=request.getParameter("Tag5") %>">
			<input type="hidden" name="Time_of_Day1" value="<%=request.getParameter("Time_of_Day1") %>">
			<input type="hidden" name="Time_of_Day2" value="<%=request.getParameter("Time_of_Day2") %>">
	
			<button id = "button" type="submit">Confirm</button>
		</form>
</table>
</div>

</body>
</html>




<%
//close db connections
stmt.close();
con.close();
%>