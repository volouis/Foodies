<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#vendorfeedback{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vendor feedback</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>
<div id="vendorfeedback">
<% String time_of_day = "ok"; %>

<a href="vendor_signup_1.jsp"></a>
<form method="post" action="vendor_feedbackconfirm.jsp">
Subject:
<input type="text" name="feedbacksubject" size="50">
<br>

<br>
Feedback:
<br>
<textarea name="feedback" cols="50" rows="10"></textarea>

<br> <br>
<button id = "button1" type="submit">Submit</button>
</form>
</div>
</body>
</html>