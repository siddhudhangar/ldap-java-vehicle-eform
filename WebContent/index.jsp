<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBCSE | E-Forms</title>
<link rel = "stylesheet" type = "text/css" href = "css/style.css"/>
<script type = "text/javascript" >

   function preventBack(){window.history.forward();}
 
    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
 <%
   String username = (String)session.getAttribute("username");
 %>
<script type="text/javascript">
		$(document).ready(function(){
			
			//$(".navigation").find("ul").css("display","none");
			//$(".navigation ul").css("display","none");
			//$("#header_leftnav").load('pages/leftnav_header.jsp');
		 <% if((username!=null)&&(!username.equals("siddhu1"))){%>
			  $("#second_bar").css({'height':'20px','margin':'0px','background':'transparent linear-gradient(to bottom right,#A2CBEF, #2F5E6B)','color':'#fff','font':'bold 13px Arial,Helvetica,sans-serif'});
		      $("#second_bar span").html("Welcome "+"<%=username%>"+" |  <a href=LogoutServlet>Logout</a>").css({'margin-left':'70%'});
			  $("#loginpage").load('pages/leftnav_header.jsp');
			<%}else if (username==null){%>
			  $("#loginpage").load('pages/login.jsp');
			<%}%>	
});//ready function closed

$(document).ajaxStart(function() {
	$("#ajaxSpinnerImage").show().fadeIn('400');
	
	});
$(document).ajaxStop(function() {
	$("#ajaxSpinnerImage").hide().fadeOut('400');
	});
	
	
</script>
</head>
<body>
<!--  <div id="profile"><span></span></div>-->
<div id="header"><h2 class="main_header_style">Homi Bhabha Centre for Science Education, TIFR </h2>
<br/>
<h3 class="main_header_sub">e-forms </h3>
</div>
<div id="second_bar"><span></span></div>
<div id="ajaxSpinnerContainer">
<img src="images/ajax-loader.gif" id="ajaxSpinnerImage" title="working...">
</div>
<div id="loginpage"></div>

	

</body>


</html>