<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.activation.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.servlet.*"%>
<%@ page import="javax.net.ssl.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBCSE | E-Forms</title>
</head>
<style>
table{
width:80%;
margin:0px auto;
}
</style>
</head>
<body>
<table>
<tr><th>HOMI BHABHA CENTRE FOR SCIENCE EDUCATION, TIFR</th></tr>
<tr><th>Vehicle Requistion Booking Details:</th></tr>
</table>
<% String UID=null; 
if(request.getQueryString() != null)
 	UID=request.getQueryString();
	String date=UID.replace("Date=","");
//System.out.println(UID);
 %>
	
	<table  id="myTable" style='font-size:14px'align="center" cellpadding="1" cellspacing="2" border="1" width="100%">
	<tr bgcolor="#f2e609">
	<td>Sr.No.</td>
	<td>Full_Name</td>
	<td>Phone_Number</td>
	<td>Journey Date</td>
	<td>No.OfPersons</td>
	<td>PlaceToVisit</td>
		<td>PlaceAndTime</td>
	<td>DriverName</td>
		<td>VehicleNo.</td>

	
	</tr>	
	<%
	Statement statement = null;
	ResultSet resultSet = null;
	try{ 
	//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
	statement=connection.createStatement();
	System.out.println(date);
	String sql ="SELECT * FROM vehicle_form_data WHERE status='Allocated' AND verify_status='verify' AND Date='"+date+"'";
	ResultSet resultSet12 = statement.executeQuery(sql);
	while(resultSet12.next()){
		
		
	%>
	<style type="text/css">
	input.largerCheckbox
	{
	width: 30px;
	
	height: 30px;
	}
	</style>
    <tr bgcolor="#f9f2e8">
	<td><%=resultSet12.getString("id")%></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("Full_Name") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("Phone_Number") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("Date") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("NoOfPersons") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("PlaceToVisit") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("PlaceAndTime") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("DriverName") %></td>
	<td bgcolor="#98eaf2"><%=resultSet12.getString("VehicleNumber") %></td>
	</tr>	

	<% 
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>
</body>

</html>