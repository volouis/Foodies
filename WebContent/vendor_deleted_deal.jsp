<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#deletedeal{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}
#button1{
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
<title>Deal deleted!</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<div id="deletedeal">

<% String Deal_ID = request.getParameter("Deal_ID"); %>
<%
String sql = "DELETE FROM Deals WHERE ID = " + Deal_ID;
stmt.execute(sql);
//close connections
stmt.close();
con.close();
%>
Deal deleted!
<form action = "vendor_history.jsp"><button id = "button1" type="submit">Return to Deals History!</button></form>

</div>
</body>
</html>