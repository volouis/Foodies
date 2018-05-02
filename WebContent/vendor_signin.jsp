<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#submit{
	border-width: 4px;
	border-radius: 5px;
  	margin:5px;
 	height: 40px;
 	padding:0px;
    text-align: center;
    background-color: #FFFFFF;   
}
#displaypage{
	position:absolute;
	top:100px;

}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor sign in</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="displaypage">
<% String VID = "0"; %>

<form method="post" action="vendor_confirmation.jsp">
Vendor ID:
<input type="text" name="VendorID">
<button id= "submit" type="submit">Submit</button>
</form>
</div>
</body>
</html>