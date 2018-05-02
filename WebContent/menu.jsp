<!-- This is a menu file that's included at the top of all other web pages of this mini-app -->
<head>
<style>
#indexbutton{
	position:absolute;
	font-family:'Verdana',Arial,sans-serif;
	 font-weight: normal;
	 left: 0px; 
}
#dealbutton{
	position:absolute;
	font-family:'Verdana',Arial,sans-serif;
	font-weight: normal;
	left: 124px; 
}
#vendorbutton1{
	position:absolute;
	font-family:'Verdana',Arial,sans-serif;
	font-weight: normal;
	left: 248px; 
}


#a{
	position:absolute;
	left: 1060px;
	font-family:'Verdana',Arial,sans-serif; 
	font-weight: normal;
}
#button1{
    border-width: 2px;
	border-radius: 10px;
    margin:5px;
    height: 40px;
    width: 100px; 
    padding:0px;
    text-align: center;
    background-color: #FFFFFF;      
}
</style>
</head>



<div id="indexbutton">
<form action="index.jsp" method="get">
<button id = "button1" type="submit">Home Page</button> |
</form>
</div>

<div id="dealbutton">
<form action="all_deals.jsp" method="get">
<button id = "button1" type="submit">All Deals</button> |
</form>
</div>

<div id="vendorbutton1"> 
<% if (session.getAttribute("signed_in").equals(true)) {%>
	<form action="vendor_home.jsp" method="get">
	<button id = "button1" type="submit">Vendor Menu</button>
	</form>
<%} else { %>
	<form action="vendor_general.jsp" method="get">
	<button id = "button1" type="submit">Vendor Menu</button>
	</form>
<%} %>
</div>

<div id="a">
<form action="search_results.jsp" method="get">
Search for Vendors: <input type="text" name="searchString">
<button id = "button1" type="submit">Search!</button>
</form>
</div>