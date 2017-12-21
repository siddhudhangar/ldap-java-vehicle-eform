<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<link rel = "stylesheet" type = "text/css" href = "css/style.css">
<link rel = "stylesheet" type = "text/css" href = "css/table_style.css">

<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.19.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.19.custom.min.js"></script>

<title>Guest House Booking</title>

<%
String userName = null;
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
if(userName == null) response.sendRedirect("/eforms/");

%> 

<script type="text/javascript">

var $li = $('#accordion li').click(function() {
    $li.removeClass('selected');
    
    $(this).addClass('selected');
});
$(function() {
	  $(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
	  });

$(function() {
	var $navLink = $('#accordion').find('li');
	$navLink.on('click', function() {
		var panelToShow = $(this).data('panel-id');
		var $activeLink = $('#accordion').find('.active');
		// show new panel
		// .stop is used to prevent the animation from repeating if you keep clicking the same link
		$('.' + panelToShow).stop().slideDown();
		$('.' + panelToShow).addClass('active');
		// hide the previous panel 
		$activeLink.stop().slideUp().removeClass('active');
	});
});
function to_open(event){
      var e1="VehicleBookingInfo.jsp?Date="+event;
      
	tm=window.open(e1,"vehicle_info","width=900,height=600,left=300,top=200,status=0,");

	}

$(document).ready(function(){
	//$('#ajaxSpinnerImage').hide().fadeOut('100');

	//$("#ajaxSpinnerContainer").show();
	
	$('#Vehivle_Booking_Form').keypress(function(event) {
	     if (event.keyCode == 13) {
	    	 $("#submit").click();
	     }
	 });
	
	$("#submit").on('click', function(){

	       //$("#ajaxSpinnerContainer").css("display", "inline");
	       
	     if($("#Full_Name").val()==""){
		 alert("Please enter full name field.");
		 $("#Full_Name").focus();
		 return false;
		 }
	     else if($("#Phone_Number").val()==""){
			 alert("Please enter phone number field.");
			 $("#Phone_Number").focus();
			 return false;
		 }
	     else if($("#Phone_Number").val().length>11){
	    	 alert("Please enter valid phone number.kindly re-check phone number field");
			 $("#Phone_Number").focus();
			 return false;
		     }
	     else if($("#Date").val()==""){
			 alert("Please enter vehicle requisition date field.");
			 $("#Date").focus();
			 return false;
			 }
	     else if($("#ApprovingMember option:selected").val()=="SelectOption"){
	    	 alert("Please Select Approving Member Name.");
			 $("#ApprovingMember").focus();
			 return false;
			 }
	     
	     else if($("#NoOfPersons").val()==""){
			 alert("Please enter number of persons field field.");
			 $("#NoOfPersons").focus();
			 return false;
			 }
	     else if($("#PlaceToVisit").val()==""){
			 alert("Please enter place / places of visit field.");
			 $("#PlaceToVisit").focus();
			 return false;
			 }
	     else if($("#PurposeOfVisit").val()==""){
			 alert("Please enter purpose of visit field.");
			 $("#PurposeOfVisit").focus();
			 return false;
			 }
	     else if($("#PlaceAndTime").val()==""){
			 alert("Please enter place and time from where to be picked up field.");
			 $("#PlaceAndTime").focus();
			 return false;
			 }
	     
		
		 var Full_Name = $("#n1").val() +" "+ $("#Full_Name").val();
	     var Phone_Number = $("#Phone_Number").val();
	     var ApprovingMember = $("#ApprovingMember").val();
	     var Date = $("#Date").val();
	     var EmailOfMember = $("#ApprovingMember").val();
	     
	     var hm1 = $("#hm1").val();
	     var hm2 = $("#hm2").val();
	     var hm3 = $("#hm3").val();

	     var newhm1 = $("#newhm1").val();
	     var newhm2 = $("#newhm2").val();
	     var newhm3 = $("#newhm3").val();

	     var NoOfPersons = $("#NoOfPersons").val();
	     var PlaceToVisit = $("#PlaceToVisit").val();
	     var PurposeOfVisit = $("#PurposeOfVisit").val();
	     var PlaceAndTime = $("#PlaceAndTime").val();
	     var SpecialInstructions = $("#SpecialInstructions").val();
	     var mail = $("#host_email").val();
	     var AreaToTravel = $("#AreaToTravel").val();
	     
	     
	     $('#ajaxSpinnerImage').show();
	      
		$.ajax({
	         url : "submit",
	         type : "POST",
	         data : {
			Full_Name : Full_Name,
			Phone_Number : Phone_Number,
			ApprovingMember : ApprovingMember,
			Date : Date,
			ApprovingMember : EmailOfMember,
			hm1:hm1,
			hm2:hm2,
			hm3:hm3,
			newhm1:newhm1,
			newhm2:newhm2,
			newhm3:newhm3,
			NoOfPersons:NoOfPersons,
			PlaceToVisit:PlaceToVisit,
			PurposeOfVisit:PurposeOfVisit,
			PlaceAndTime:PlaceAndTime,
			SpecialInstructions:SpecialInstructions,
			mail:mail,
			AreaToTravel : AreaToTravel
	       },
	               
	       success : function(results){
	             if(results != null && results != ""){
					alert("Data Successfully Saved");
					reset();
	                console.log('the page was loaded', results);
	                 
	             }else{
	            	 console.log('Error', results);
	                 
	           
	             }
	         },
	       complete: function(){
	        	 $('#ajaxSpinnerImage').hide();
	    	   //$("#ajaxSpinnerContainer").css("display", "none");
	           }
		});//ajax closed

	});//click submit button
	function reset(){
		$("#Full_Name").val('');
		$("#Phone_Number").val('');
		
		$("#Date").val('');
		 
	    
	     $("#NoOfPersons").val('');
	     $("#PlaceToVisit").val('');
	     $("#PurposeOfVisit").val('');
	     $("#PlaceAndTime").val('');
	     $("#SpecialInstructions").val('');
		
	}
	$("#reset").on('click', function(){
			reset();
			$('#ajaxSpinnerContainer').hide();
		});

	
		
	$( "#btn_previous" ).prop( "disabled", true );
	$( "#btn_next" ).prop( "disabled", false );
	 
	//var btn_previous = "0";
	
	htmlObj=$.ajax({
        url : "vehicleavailability",
        type : "POST",
        data : {
			value111 : 0
	      },
	      async:false
      
    
		});//ajax closed
	$("#show_vehicle_availability").empty();
	$("#show_vehicle_availability").append(htmlObj.responseText);
		
	
	
	$("#btn_previous").on('click', function(){

		$( "#btn_previous" ).prop( "disabled", true );
		$( "#btn_next" ).prop( "disabled", false ); 

		//var btn_previous = $("#btn_previous").val();
		
		htmlObj=$.ajax({
	        url : "vehicleavailability",
	        type : "POST",
	        data : {
			value111 : 0
	      },
	      async:false
	    
			});//ajax closed
		$("#show_vehicle_availability").empty();
		$("#show_vehicle_availability").append(htmlObj.responseText);
			
		
	});
	$("#btn_next").on('click', function(){
		$( "#btn_next" ).prop( "disabled", true );
		$( "#btn_previous" ).prop( "disabled", false );
		//var btn_next = $("#btn_next").val();
		
		htmlObj=$.ajax({
	        url : "vehicleavailability",
	        type : "POST",
	        data : {
			value111 : 1
	      },
	      async:false
	    
			});//ajax closed
		$("#show_vehicle_availability").empty();
		$("#show_vehicle_availability").append(htmlObj.responseText);
			
	});
	$("#Show_Info").on('click', function(){
		
		var Date1 = $("#Date1").val();
		
		htmlObj=$.ajax({
	        url : "ChkAvailability",
	        type : "POST",
	        data : {
			NewDate  : Date1
	      },
	      async:false
	    
			});//ajax closed
		$("#show_vehicle_availability1").empty();
		$("#show_vehicle_availability1").append(htmlObj.responseText);
			
	});

	
	var options="";
	$("#AreaToTravel").on('change',function(){
	    var value=$(this).val();
	    
		var username=$("#HideWithinCity").val();
	    
	    
	    if(!(username=="siddhu1") && (value=="WithinCity"))
	    {
	        
	         options='<option value="SelectOption">---Select Approving Member---</option>'
	            +'<option value="director@hbcse.tifr.res.in">Prof. K Subramaniam, Centre Director</option>'
				+'<option value="am@hbcse.tifr.res.in">Ajay M Abhyankar</option>'
				+'<option value="sugrac@hbcse.tifr.res.in">Sugra Chunawala</option>'
				+'<option value="nagarjuna@hbcse.tifr.res.in">Nagarjuna G.</option>'
				+'<option value="anikets@hbcse.tifr.res.in">Aniket Sule</option>'
				+'<option value="anwesh@hbcse.tifr.res.in">Anwesh Mazumdar</option>'
				+'<option value="siddhu@hbcse.tifr.res.in">Siddhu B.Dhangar</option>'; 
	        $("#ApprovingMember").html(options);
	    }
	    else if(value=="OutsideCity")
	    {
	    	$("#ApprovingMember").show();
	    	options='<option value="SelectOption">---Select Approving Member---</option>'
	        	+'<option value="director@hbcse.tifr.res.in">Prof. K Subramaniam, Centre Director</option>'
				+'<option value="am@hbcse.tifr.res.in">Ajay M Abhyankar</option>'
				+'<option value="sugrac@hbcse.tifr.res.in">Sugra Chunawala</option>'
				+'<option value="siddhu@hbcse.tifr.res.in">Siddhu B.Dhangar</option>';
	        $("#ApprovingMember").html(options);
	    }
	    else{
	        //$("#ApprovingMember").find('option').remove().find('select').remove();
	    	$("#ApprovingMember").find('option').remove();
	    	$("#ApprovingMember").hide();}
	    
	        
	});

		 
});//ready function closed


</script>
<script>


 </script>

<style>

body{
background:#E0DEDE;
margin:0px auto;
text-decoration:none;
}
tr.alt:hover {background: pink;}
.frfc{
margin:10px auto;
}
.frsc{
margin:10px auto;
}

td{text-align:right;}

select{
float:left;
}
table{
margin:0px auto;

}

input[type=text] {
    width: 100%;
    border: none;
    padding:0px;
    border:none;
    border-bottom:2px solid #3D3E33;
    float:left;
}
.alignment{
text-align:center;
}
p{
font-size:11px;
font-style: italic;
}
.combine{
float:left;
}
.width1{width:78%;}

#PNButton #btn_previous{
	
     float:left;
     margin-left:80px;
     text-decoration:none;
}
#PNButton #btn_next{
display:inline;
     float:left;
     margin-left:80px;
     text-decoration:none;	
}
#btn_previous{


    padding: 4px 4px;

font-size:30px;
font-weight:bold;

}
#btn_next{
font-size:30px;
font-weight:bold;
    padding: 4px 4px;

}
	
}
</style>
</head>
<body>
<div class="container">
  <div id="accordion">
  <ul class="panels">
    <li data-panel-id="panel1">Vehicle Booking Form</li>
    <div class="panel panel1"> <a href="#"></a>
    <div class="frfc">
<form  id="Vehivle_Booking_Form" method="POST">    
<table  cellpadding="10" >
<tr><td>
नाम  / Name:</td>
<td>

<div class="combine">
<select id="n1">
<option value="Mr.">Mr.</option>
<option value="Ms.">Ms.</option>
</select>
<input class="width1" type="text"  name="Full_Name" id="Full_Name">
</div>
</td>
<td>फोन नंबर  / Phone Number:</td><td><input  type="text"  name="Phone_Number" id="Phone_Number">
</td>
</tr>
<% 
if(userName.matches("sugrac|am|director")){

}
else if(userName.matches("siddhu1")){
%>

<tr><input type="hidden" value="<%=userName %>" id="HideWithinCity"><td >Select :</td><td>
<select name="AreaToTravel" id="AreaToTravel">
<option value="WithinCity" >Within City</option>
<option value="OutsideCity" >Outside City</option>		 
</select>
</td>
<td><select name="ApprovingMember" id="ApprovingMember">

</td>
</tr>
<%
}

else {
%>

<tr><td >Select :</td><td>
<select name="AreaToTravel" id="AreaToTravel">
<option value="WithinCity" >Within City</option>
<option value="OutsideCity" >Outside City</option>		 
</select>
</td>
<td><select name="ApprovingMember" id="ApprovingMember">
<option value="SelectOption">---Select Approving Member---</option>
            <option value="director@hbcse.tifr.res.in">Prof. K Subramaniam, Centre Director</option>
			<option value="am@hbcse.tifr.res.in">Ajay M Abhyankar</option>
			<option value="sugrac@hbcse.tifr.res.in">Sugra Chunawala</option>
			<option value="nagarjuna@hbcse.tifr.res.in">Nagarjuna G.</option>
			<option value="anikets@hbcse.tifr.res.in">Aniket Sule</option>
			<option value="anwesh@hbcse.tifr.res.in">Anwesh Mazumdar</option>
			<option value="siddhu@hbcse.tifr.res.in">Siddhu B.Dhangar</option></select>
</td>
</tr>
<%
}
%>
<tr>
<td>वाहन मांग  (तिथि) / Vehicle requisition (Date):</td><td><input size="16" type="text" readonly class="textstyle datepicker" name="Date" id="Date"></td>
<td >विशेष आदेश यदि कोई है / Special instructions, if any</td><td>
<input type="text" name="SpecialInstructions" id="SpecialInstructions"><input type="hidden"  value="<%=mail%>" id="host_email"/></td>
</tr>
<tr><td >समय /Time: बजे से / From (Hrs.)</td>
<td>

<select class="selectionbox" name="hm1" id="hm1">
						 	 <option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
					  </select>
					  <select class="selectionbox" name="hm2" id="hm2">
						 <option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
					  </select>
					  	 <select class="selectionbox" name="hm3" id="hm3">
					  	 <option  value="AM">AM</option>
					  	 <option  value="PM">PM</option>
					  	 </select>

</td>


<td > बजे तक  / To (Hrs.)</td><td>

<select class="selectionbox" name="newhm1" id="newhm1">
						 	 <option  value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
					  </select>
					  <select  class="selectionbox" name="newhm2" id="newhm2">
						 <option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
					  </select>
					  
					  <select class="selectionbox" name="newhm3" id="newhm3">
					  	 <option  value="AM">AM</option>
					  	 <option  value="PM">PM</option>
					  	 </select>

</td>

</tr>

<tr><td>यात्रियोंकी की संख्या  / No. of persons Traveling:</td><td>
<input type="text" name="NoOfPersons" id="NoOfPersons">
</td><td>यात्रा का / के स्थान / (Place / Places of visit):</td><td>
<input type="text" name="PlaceToVisit" id="PlaceToVisit"><div id="ajaxSpinnerContainer">
	       <img src="images/ajax-loader.gif" id="ajaxSpinnerImage" title="working..."  style="display:none">
	       </div>

</td></tr>
<tr><td >यात्रा का उद्देशय / Purpose of visit:</td><td><input type="text" name="PurposeOfVisit" id="PurposeOfVisit"></td><td >यात्रा प्रारंभ करने का स्थायन यव समय / <br/>Place and Time from where to be picked up:</td><td><input type="text" name="PlaceAndTime" id="PlaceAndTime"></td></tr>

</table>

</form>
</div>
<div class="btnAlign" align="center">
<input type="button" value="Submit" id="submit">
<input type="button" value="Reset" id="reset">
</div>


</div>


<li id="chkvehicle_availability" data-panel-id="panel2">Check Availability</li>
    <div  class="panel panel2"> <a href="#"></a>
	
	<div id="DivOfSearchDate">
	<table>
	<tr>
	<td style="font-size:16px;">Select Date:</td><td><input size="12" type="text" readonly class="textstyle datepicker" name="Date1" id="Date1"></td><td><input type="button" id="Show_Info" value="Check Availability"></td>
	</tr>
	</table>
	</div> 	
 <div id="show_vehicle_availability1"> </div>
    </div>
    
   
  </ul>
</div>
</div>
</body>
</html>