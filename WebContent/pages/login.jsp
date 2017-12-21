
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
         	
         $('#messageDiv').css({"background-color": "","margin":"0px"});
         $("#front_login").hide();  
         $("#messageDiv").load("pages/leftnav_header.jsp");
         window.location.reload(); 
         
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