<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>  
<link rel = "stylesheet" type = "text/css" href = "css/style.css">
  
<title>Guest House Booking</title>
<script type="text/javascript">
var $li = $('#accordion li').click(function() {
    $li.removeClass('selected');
    $(this).addClass('selected');
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
		$activeLink.stop().slideUp()
		.removeClass('active');
	});
});
</script>
<style>
table, th, td {
font:  12px Arial,Helvetica,sans-serif;
    border: 2px solid white;
    border-collapse: collapse;
}
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
#width1{width:78%;}
</style>

</head>

<body>

<div class="container">
  <div id="accordion">
  <ul class="panels">
    <li data-panel-id="panel1">Guest House Booking</li>
    <div class="panel panel1"> <a href="#"></a>
    <div class="frfc">
<table  cellpadding="10" >

<tr><td>
नाम  / Name:</td>
<td>

<div class="combine">
<select>
<option value="Mr">Mr.</option>
<option value="Ms">Ms.</option>
</select>
<input id="width1" type="text" name="Name">
</div>

</td>
<td class="colorchange">राष्ट्रीयता  / Nationality:</td><td><input type="text" value="Indian" name="Name">
</td>
</tr>
<tr><td >मेजबान संस्थान  / Host Institution:</td><td><input type="text" name="Name"></td><td >यात्रा का उदेश्य  / Purpose of visit:</td><td><input type="text" name="Name"></td></tr>
<tr><td >अतिथि का स्तर  / Status of visitor:</td><td>
<select>
  <option value="Government">सरकारी   / Government</option>
  <option value="Non-government">गैर सरकारी  / Non-government</option> 
</select>
</td><td>साथ में  / Accompanied By</td><td><input type="text" name="Name"></td></tr>
<tr><td >वयस्क एंव  / Adults:</td><td>
<select>
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select>
</td><td>बच्चे  / Childrens</td><td>
<select>
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
</select>
</td></tr>
<tr><td >आगमन तिथि  / Arrival Date:</td><td><input type="text" name="Name"></td><td>समय  / Time:</td><td><input type="text" name="Name"></td></tr>
<tr><td >वापसी की तिथि  / Departure Date:</td><td><input type="text" name="Name"></td><td>समय  / Time:</td><td><input type="text" name="Name"></td></tr>
<tr><td >आवास का प्रकार  / Type of Accommodation:</td><td>
<select>
<option>वातानुकूलित कक्ष / AC Room</option>
<option>गैर वातानुकूलित कक्ष / Non-AC Room</option>
<option>फ्लैट / Flatlet</option>
<option>एकल / Single</option>
<option>साँझा / Sharing</option>
</select>
</td></tr>
<tr><td >बिल संबंधी आदेश  / Billing Instructions:<p>(कृपया स्पष्ट करें की बिल का निपटान कैसे होगा  <br/>/ Specify how the bill will be settled)</p></td><td><input type="text" name="Name"></td><td></td></tr>

</table>
</div>
<div class="btnAlign" align="center">
<input type="button" value="Submit" >
<input type="button" value="Reset" >
</div>
    
    
    
    </div>
    <li data-panel-id="panel2">Check Availability</li>
    <div class="panel panel2"> <a href="#">Panel 2</a>
      <p></p>
    </div>
   
  </ul>
</div>
</div>



</body>
</html>