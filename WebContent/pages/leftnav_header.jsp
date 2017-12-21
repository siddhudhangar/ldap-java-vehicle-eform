<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBCSE | E-Forms</title>
<link rel = "stylesheet" type = "text/css" href = "css/style.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
			
			$("#page2").click(function(){
			   	$('#result').load('pages/Internet_eform.jsp');		     
			    });
			$("#page3").click(function(){
		   	$('#result').load('pages/Vehicle_booking_form.jsp');		     
		    }); 
		    $("#page4").click(function(){
		   	$('#result').load('pages/display.jsp');
		    });
		   
		  		    		      	    			   
});//ready function closed
</script>
</head>
 <body>
 <%
   String username = (String)session.getAttribute("username");
   if(username!=null){ %>
  
      <% }else{ %> 
       <h3>Your don't have permission to access this page</h3>
      <% } %>
<div  class="navigation">
<ul id="menu">
	<li ><a id="page1" href="#">Home</a></li>
	<li ><a id="page2" href="#">Internet Connection Form</a></li>
	<li > <a id="page3" href="#">Vehicle Booking Form</a></li>
	<li ><a id="page4" href="#">Guest House Booking Form</a></li>
</ul>
</div>
<div id="result"></div>
</body>
</html>