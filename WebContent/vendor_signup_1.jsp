<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
html{
	overflow:scroll;
}

#p{
    font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
   	position: absolute;
   	top:100px;
   	
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
   	position: absolute;
   	top:105px;
   	left:525px;
    text-align: center;
}
#input{
	width:400px;
	left: 100px;
}
#column{
	width:100px;
}


</style>
<title>SignUp Step 1</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>

<div id= "p">

<form method="post" action="vendor_signup_2.jsp">
<table>

	<tr>
		<td id ="column">
			Store Name:
		</td>
		<td>
			<input id="input" type="text" name="VName" />
		</td>
	</tr>
	<tr>
		<td>
			Address:
		</td>
		<td>
			<input id="input"  type="text" name="Address" />
		</td>
	</tr>
	<tr>
		<td>
			Postal Code:
		</td>
		<td>
			<input id="input" type="text" name="Postal Code" />
		</td>
	</tr>
	<tr>
		<td>
			Email:
		</td>
		<td>
			<input id="input" type="text" name="Email" />
		</td>
	</tr>
	<tr>
		<td>
			Website URL:
		</td>
		<td>
			<input id="input" type="text" name="Website_URL" />
		</td>
	</tr>
	<tr>
		<td>
			Image URL:
		</td>
		<td>
			<input id="input" type="text" name="Image_URL" />
		</td>
	</tr>


</table>
	
<button id = "button" type="submit">Submit</button>

</form>

</div>











</body>
</html>