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
<link rel="stylesheet" href="css/style-print.css" type="text/css" media="print"/>
<title>HBCSE | E-Forms </title>
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
<style type="text/css">
@media print {
    .dontprint #PButton{
	 display:none; 
	}
	#DivOfSearchDate{
	display:none;
	}
    }
</style>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.19.custom.min.js"></script>

<script>
$(function() {
	  $(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
	  });
$(document).ready(function(){
	$("#Show_Info").on('click', function(){

	
	var FromDate = $("#FromDate").val();
	var ToDate = $("#ToDate").val();
	
	htmlObj=$.ajax({
        url : "SearchVehicleInfoUsingDate",
        type : "POST",
        data : {
		FromDate  : FromDate,
		ToDate:ToDate
      },
      async:false
    
		});//ajax closed
	$("#show_vehicle_availability1").empty();
	$("#show_vehicle_availability1").append(htmlObj.responseText);
		
});
});

</script>
<style>
#header{
width:80%;
margin:0px auto;
align:center;
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
table ,td{
border-collapse:collapse;
}

</style>
</head>
<body>
<table id="header" align="center">
<tr><th>HOMI BHABHA CENTRE FOR SCIENCE EDUCATION, TIFR</th></tr>
<tr><th>Online Vehicle Requistion Form</th></tr>
</table>

<div id="DivOfSearchDate">
	<table">
	<tr>
	<td style="font-size:16px;">Select Date:</td>
	<td><input size="12" type="text" readonly class="textstyle datepicker" name="FromDate" id="FromDate"></td>
	<td><input size="12" type="text" readonly class="textstyle datepicker" name="ToDate" id="ToDate"></td>
	<td><input type="button" id="Show_Info" value="Generate Report"></td>
	
	<td><button id="PButton" onClick="window.print();">Print</button></td>
	<td><input type="button" value="Back" id="GenerateReport" onClick="location.href='admin.jsp'"></td>
	</tr>
	</table>
	</div> 	
    	
<div id="show_vehicle_availability1"> </div>


</body>


</html>