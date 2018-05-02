<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UofT Foodies!</title>
<style>
#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}


#title{
	position: absolute;
	left: 600px;
	top: 100px;
}
#subtitle{
	position: absolute;
	left: 250px;
	top: 150px;
	width: 1000px;
}
#register{
	position: absolute;
	left: 450px;
	top: 300px;
}
#login{
	position: absolute;
	left: 900px;
	top: 300px;
}

</style>
</head>
<body >
<div id = "p">
	<%@ include file="mood_sidebar.jsp" %>
	<%@ include file="menu.jsp" %>
	<h1 id="title">Welcome Vendor</h1> 
	<h4 id="subtitle">Welcome to U of T Foodies, the go-to provider of student food deals at the University
		of Toronto. We are committed to providing a strong advertising platform for restaurants and 
		food establishments around the U of T campus. Register with us to increase your student traffic
		by posting deals.
	</h4> 
	<div id="register">
		<form method="post" action="vendor_signup_1.jsp">
			<button id = "button" type="submit">Register</button>
		</form>		
	</div>
	
	<div id="login">
		<form method="post" action="vendor_signin.jsp">
			<button id = "button" type="submit">Login</button>
		</form>		
	</div>
</div>
</body>
</html>