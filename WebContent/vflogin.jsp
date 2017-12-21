<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script>
 $(document).ready(function(){
	 $("#Username").focus();
 $("#btnLogin").on('click', function(){
	 
     var username = $("#Username").val();
     var password = $("#Password").val();
     if(username == ""){
         //$('#messageDiv').css("display","none");
         alert("Username is required");
         $("#Username").focus();
         return false;
     }
     if(password == ""){
         //$('#messageDiv').css("display","none");
         alert("Password is required");
         $("#Password").focus();
         return false;
     }
     $.ajax({
         url : "ldaplogin",
         type : "POST",
         data : {
             username : username,
             password : password
         },
         
         success : function(results){	
			
          if(results != null && results != ""){
                 showMessage(results);             
                 console.log('the page was loaded', results);
                 
             }else{
                 $('#messageDiv').css("display","none");
                 $('#messageDiv').html("");
                 alert("Some exception occurred! Please try again.");
             }
         }
     });


	 });
 //function to display message to the user
 function showMessage(results){

	 if(results == 'SUCCESS'){
         //$('#messageDiv').html("<font color='green'>You are successfully logged in. </font>");
         	
       window.open('http://localhost:8080/eforms/admin.jsp',"_self");
                 
         
         //document.location='index.jsp';
        
     }else if(results =='FAILURE'){
         $('#messageDiv').html("<font color='red'>Username or password is incorrect.</font>");
         $('#messageDiv').css({"margin-left":"40%","margin-top":"100px"});
     }
    
 	}
  	$('#login-form').keypress(function(event) {
     if (event.keyCode == 13) {
    	 $("#btnLogin").click();
     }
  	 });
 });//ready function closed
 </script>
<style>

table ,td ,th{
border-collapse: collapse;
font:  12px Arial,Helvetica,sans-serif;

}

td{
padding:9px;
}
.tdlogin{
text-align:center;
font-size:20px;
letter-spacing:2px;
color:5F93FE;
}
td{
margin-bottom:20px;
}
input[type=text],input[type=password] {
    width: 100%;
    padding:0px;
    background:white;  
}

#front_login table{
margin:80px auto;
border:1px solid #368CC3;
}

</style>

</head>
<body>
<%
   String username = (String)session.getAttribute("username");
 %>	
<div id="header"><h2 class="main_header_style">Homi Bhabha Centre for Science Education, TIFR </h2>
<br/>
<h3 class="main_header_sub">e-forms </h3>
</div>
<div id="second_bar"><span></span></div>
<div id="ajaxSpinnerContainer" style="display:none;">
<img src="images/ajax-loader.gif" id="ajaxSpinnerImage" title="working...">
</div> 
 
<div id="front_login">
<form action="ldaplogin" id="login-form" method="POST">
<table>
<tr><td class="tdlogin" colspan="2" rowspan="1">Login </td></tr>
<tr><td>Username: </td><td><input type="text" name="Username" id="Username"></td></tr>
<tr><td>Password:</td><td><input type="password" name="Password" id="Password"></td></tr>
<tr><td class="tdlogin" colspan="2" rowspan="1"><input type="button" id="btnLogin" value="Login"></td></tr>
</table>
</form>
</div>

<div id="messageDiv"></div>
</body>

</html>