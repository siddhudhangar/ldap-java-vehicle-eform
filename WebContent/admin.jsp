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
<%
String userName = null;
String SelectedOfApproval = null;
String SelectAdmin = null;
String cn = null;
String mail = null;

Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("username")) userName = cookie.getValue();
	if(cookie.getName().equals("cn")) cn = cookie.getValue();
	if(cookie.getName().equals("mail")) mail = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("vflogin.jsp");
%>
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBCSE | E-Forms </title>
<style>
table{
width:80%;
margin:0px auto;
border-collapse:collapse;
}
#myTable{
font-size:14px;
}
#myTable input[type=text]{
border:none;
text-decoration:none;
background:#f9f2e8;
color:black;
}
</style>
<script>
function myFunction() 
{
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  var Sel = document.getElementById("select");
  var select=Sel.options[Sel.selectedIndex].value; 
  
  for (i = 1; i < tr.length; i++) 
	  {  
    	td1 = tr[i].getElementsByTagName("td")[select];
    		if (td1) 
        		{
    			if ((td1.innerHTML.toUpperCase().indexOf(filter) > -1)) 
        			
      			{
          			
    			tr[i].style.display = "";
 				} 
			 	else 
				{
			 		
    			tr[i].style.display = "none";
  				}

        		}//td1 end bracket
    		
  		}//for loop end bracket
}


</script>
<script>

</script>

</head>
<body>
<table>
<tr><th>HOMI BHABHA CENTRE FOR SCIENCE EDUCATION, TIFR</th></tr>
<tr><th>Online Vehicle Requistion Form</th></tr>
</table>

	Search <input type="text" id="myInput" onclick="myFunction()" onkeyup="myFunction()">
<select id="select" name="sel" onclick="myFunction()" onkeyup="myFunction()">
<option value="0">Sr.No.</option>
<option value="1">Full_Name</option>
<option value="2">Phone_Number</option>
<option value="3">Journey Date</option>
<option value="4">Time From</option>
<option value="5">Time To</option>
<option value="6">NoOfPersons</option>
<option value="7">PlaceToVisit</option>
<option value="8">PurposeOfVisit</option>
<option value="9">PlaceAndTime</option>
<option value="10">SpecialInstructions</option>
<option value="11">ApprovedBy</option>
<option value="12">DriverName</option>
<option value="13">VehicleNumber</option>
<option value="14">DutyOfficerName</option>
<option value="15">Status</option>
</select>
	<input type="button" value="VehicleFormReport" id="GenerateReport" onClick="location.href='VehicleFormReport.jsp'">
	<form action="Logout">
	<input type="submit" value="Logout" id="LogOut">
	</form>
	<table  id="myTable" align="center" cellpadding="1" cellspacing="2" border="1" width="100%">
	<tr bgcolor="#A2CBEF">
	<td>Sr.No.</td>
	<td>Full_Name</td>
	<td>Phone_Number</td>
	<td>Journey Date</td>
	<td>Time From</td>
	<td>Time To</td>
	<td>No.Of<br/>Persons</td>
	<td>Place<br/>ToVisit</td>
	<td>PurposeOfVisit</td>
	<td>PlaceAndTime</td>
	<td>Special<br/>Instructions</td>
	<td>Approved<br/>By</td>
	<td>Driver<br/>Name</td>
	<td>Vehicle<br/>Number</td>
	<td>DutyOfficerName</td>
	<td>Status</td>
	
	</tr>	
	<%
	Statement statement = null;
	ResultSet resultSet = null;
	try{ 
	//connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
	statement=connection.createStatement();
	String sql ="SELECT * FROM vehicle_form_data WHERE verify_status='verify'";
	ResultSet resultSet12 = statement.executeQuery(sql);
	while(resultSet12.next()){
		
		
		
	%>
	
    <tr bgcolor="#f9f2e8">
	<td><input type="text"  size="6" value="<%=resultSet12.getString("id")%>" disabled ></td>
	<td ><%=resultSet12.getString("Full_Name") %></td>
	<td ><%=resultSet12.getString("Phone_Number") %></td>
	<td ><%=resultSet12.getString("Date") %></td>
	<td ><%=resultSet12.getString("TimeFrom") %></td>
	<td ><%=resultSet12.getString("TimeTo") %></td>
	<td ><%=resultSet12.getString("NoOfPersons") %></td>
	<td ><%=resultSet12.getString("PlaceToVisit") %></td>
	<td ><%=resultSet12.getString("PurposeOfVisit") %></td>
	<td ><%=resultSet12.getString("PlaceAndTime") %></td>
	<td ><%=resultSet12.getString("SpecialInstructions") %></td>
	<td ><%=resultSet12.getString("ApprovingMember") %></td>
	<td ><%=resultSet12.getString("DriverName") %></td>
	<td ><%=resultSet12.getString("VehicleNumber") %></td>
	<td ><%=resultSet12.getString("DutyOfficerName") %></td>
	
	<%
	if(resultSet12.getString("status").equals("Rejected")){
		
	%>
	<td bgcolor="#f22c2c"><%=resultSet12.getString("status") %></td>
	<td><input type=button onClick=window.open("chkavailability.jsp?date=<%=resultSet12.getString("Date")%>","demo","width=740,height=600,left=300,top=40,toolbar=0,status=0,"); value="Check Availability" disabled></td>
	<td><input type=button onClick=window.open("edit.jsp?id=<%=resultSet12.getString("id")%>","editform","width=550,height=600,left=200,top=40,toolbar=0,status=0,"); value="Edit" disabled></td>
	<td><input type=button onClick=window.open("PrintVehicleForm.jsp?id=<%=resultSet12.getString("id")%>","printform","width=600,height=600,left=400,top=40,toolbar=0,status=0,scrollbars=1"); value="Print" disabled></td>
	<%
	}
	else if(resultSet12.getString("status").equals("Allocated")){
	%>
	<td bgcolor="#49fc67"><%=resultSet12.getString("status") %></td>
	<td><input type=button onClick=window.open("chkavailability.jsp?date=<%=resultSet12.getString("Date")%>","demo","width=740,height=600,left=300,top=40,toolbar=0,status=0,"); value="Check Availability"></td>
	<td><input type=button onClick=window.open("edit.jsp?id=<%=resultSet12.getString("id")%>","editform","width=550,height=600,left=200,top=40,toolbar=0,status=0,"); value="Edit"></td>
	<td><input type=button onClick=window.open("PrintVehicleForm.jsp?id=<%=resultSet12.getString("id")%>","printform","width=600,height=600,left=300,top=40,toolbar=0,status=0,scrollbars=1"); value="Print"></td>	
	<%
	}
	else if(resultSet12.getString("status").equals("PENDING"))
	{%>
	
	<td bgcolor="#adc4ff"><%=resultSet12.getString("status") %></td>
	<td><input type=button onClick=window.open("chkavailability.jsp?date=<%=resultSet12.getString("Date")%>","demo","width=740,height=600,left=300,top=40,toolbar=0,status=0,"); value="Check Availability"></td>
	<td><input type=button onClick=window.open("edit.jsp?id=<%=resultSet12.getString("id")%>","editform","width=550,height=600,left=200,top=40,toolbar=0,status=0,"); value="Edit"></td>
	<td><input type=button onClick=window.open("PrintVehicleForm.jsp?id=<%=resultSet12.getString("id")%>","printform","width=600,height=600,left=300,top=40,toolbar=0,status=0,scrollbars=1"); value="Print"></td>
	<%
	}
	%>
	
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