<%@page import="java.security.SecureRandom"%>
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
<style>
table{
width:80%;
margin:0px auto;
border-collapse:collapse;
}
#myTable{
font-size:14px;

}
table,td{
border:1px solid ;
}
textarea{
font: 14px "Times New Roman", Times, serif;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBCSE | E-FORMS</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.19.custom.min.js"></script>

</head>

<body>

<% String UID=null; 
if(request.getQueryString() != null)
 	UID=request.getQueryString();
	String uid=UID.replace("id=","");
//System.out.println(UID);
 %>
 
 <table id="myTable" >
<tr><th>HOMI BHABHA CENTRE FOR SCIENCE EDUCATION, TIFR</th></tr>
<tr><th>Online Vehicle Requistion Form</th></tr>
</table>

	<table  id="myTable" align="center" cellpadding="1" cellspacing="2" border="1" width>
	<tr bgcolor="#f2e609">
	</tr>	
	<%
	Statement statement = null;
	ResultSet resultSet = null;
	try{ 
	//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
	statement=connection.createStatement();
	//System.out.println(UID);
	String sql ="SELECT * FROM vehicle_form_data WHERE id="+uid;
	ResultSet resultSet12 = statement.executeQuery(sql);
	while(resultSet12.next()){
	
	%>
	<tr><td>Sr.No.:</td><td bgcolor="#a2cbef"><%=resultSet12.getString("id")%></td></tr> 
	 
	<tr><td>Full_Name</td><td bgcolor="#a2cbef"><%=resultSet12.getString("Full_Name") %></td></tr>
	<tr><td>Phone_Number</td><td bgcolor="#a2cbef"><%=resultSet12.getString("Phone_Number") %></td></tr>
	<tr><td>Journey Date</td><td bgcolor="#a2cbef"><%=resultSet12.getString("Date") %></td></tr>
	<tr><td>Time From</td><td bgcolor="#a2cbef"><%=resultSet12.getString("TimeFrom") %></td></tr>
	<tr><td>Time To</td><td bgcolor="#a2cbef"><%=resultSet12.getString("TimeTo") %></td></tr>
	<tr><td>No.OfPersons</td><td bgcolor="#a2cbef"><%=resultSet12.getString("NoOfPersons") %></td></tr>
	<tr><td>PurposeOfVisit</td><td bgcolor="#a2cbef"><%=resultSet12.getString("PurposeOfVisit") %></td></tr>
	<tr><td>PlaceToVisit</td><td bgcolor="#a2cbef"><%=resultSet12.getString("PlaceToVisit") %></td></tr>
	<tr><td>PlaceAndTime</td><td bgcolor="#a2cbef"><%=resultSet12.getString("PlaceAndTime") %></td></tr>
	<tr><td>SpecialInstructions </td><td bgcolor="#a2cbef"><%=resultSet12.getString("SpecialInstructions") %></td></tr>
	<tr><td>ApprovedBy</td><td bgcolor="#a2cbef"><%=resultSet12.getString("ApprovingMember") %></td></tr>
	<tr><td width="50%">Driver Name</td><td bgcolor="#a2cbef"><%=resultSet12.getString("DriverName") %></td></tr>
	<tr><td>Vehicle Number</td><td bgcolor="#a2cbef"><%=resultSet12.getString("VehicleNumber") %></td></tr>
	<tr><td>Status:</td><td bgcolor="#a2cbef"><%=resultSet12.getString("Status") %></tr>
	<tr><td>Reason:</td><td bgcolor="#a2cbef"><%=resultSet12.getString("Reason") %></td></tr>
	<tr><td>Duty Officer Name </br>OR Supervisor Name : </td><td bgcolor="#a2cbef"><%=resultSet12.getString("DutyOfficerName") %></td></tr>
				
	<% 
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	</table>
 
 	
</body>
</html>