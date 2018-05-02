<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#makedeal{
	position:absolute;
	top:100px;
	font-family:'Verdana',Arial,sans-serif;
   	font-size: 14px;
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>U of T Foodies</title>
</head>
<body>
<%@ include file="connect_db.jsp"  %>
<%@ include file="menu.jsp" %>

<div id="makedeal">
<% String time_of_day = "ok"; %>
<% int i =0; %>

<a href="vendor_signup_1.jsp"></a>
<form method="post" action="vendor_dealconfirm.jsp">
Deal Title:
<input type="text" name="dealtitle" size="50">
<br>
Start Date:
Month: 
<select name="startmonth">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>

Day: 
<select name="startday">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>
<option value=21>21</option>
<option value=22>22</option>
<option value=23>23</option>
<option value=24>24</option>
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</select>

Year: 
<select name="startyear">
<option value=2014>2014</option>
<option value=2015>2015</option>
<option value=2016>2016</option>
<option value=2017>2017</option>
<option value=2018>2018</option>

</select>

<br>
End Date-   
Month: 
<select name="endmonth">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>

Day: 
<select name="endday">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>
<option value=21>21</option>
<option value=22>22</option>
<option value=23>23</option>
<option value=24>24</option>
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>
<option value=31>31</option>
</select>

Year: 
<select name="endyear">
<option value=2014>2014</option>
<option value=2015>2015</option>
<option value=2016>2016</option>
<option value=2017>2017</option>
<option value=2018>2018</option>

</select>
<br>
	<%
		String sql = "SELECT Time_of_day FROM Time_Of_Day";
	
	ResultSet alltime_of_day = stmt.executeQuery(sql);
%>
Time of Day: 
<select name="Timeofday">
<% while(alltime_of_day.next()){ %>
			<%time_of_day = alltime_of_day.getString("Time_of_day");
			i++;%>
			<option value="<%=time_of_day%>"><%=time_of_day%></option>			
<%}%>
</select>
<br>
Description:
<br>
<textarea name="dealdescription" cols="50" rows="10"></textarea>

<br> <br>
<button id = "button1" type="submit">Submit</button>
</form>
</div>
</body>
</html>