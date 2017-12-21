package hbcse;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class vehicleavailability
 */
@WebServlet("/vehicleavailability")
public class vehicleavailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vehicleavailability() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//DateFormat df = new SimpleDateFormat("dd/MM/yyyy EEE MMM");
		
		String value111=request.getParameter("value111");
		//String value="1"
		int value1=(int)Integer.valueOf(value111);
		
	
		DateFormat month1 = new SimpleDateFormat("EEE");
		//used for compare
		DateFormat month2 = new SimpleDateFormat("MM");
		DateFormat month3 = new SimpleDateFormat("YYYY");
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.MONTH,value1);
        
        cal.set(Calendar.DATE, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date FirstDay=cal.getTime();
        
        //System.out.println(month2.format(cal.getTime()));
        
        String cmonth=month2.format(cal.getTime());
        String cyear=month3.format(cal.getTime());
        //System.out.println(cyear);
        
        String String_FirstDay=month1.format(FirstDay);
        
        int int_LastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
         Connection connection = null;
         Statement statement = null;
         PreparedStatement preparedStatement = null;
         ResultSet resultSet = null;
         int[] aday1 = new int[100];
         
         aday1[0]=0;
         
         int wcount=0;
         
         
        try {
        Class.forName("com.mysql.jdbc.Driver");
    	 connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
        
    	statement = connection.createStatement();
    	
    	 resultSet = statement.executeQuery("select * from vehicle_form_data where status='Allocated' AND month='"+cmonth+"' AND year='"+cyear+"'");
    	 while (resultSet.next()) {
    	 //int Id = resultSet.getInt("Id");
    	 //String name = resultSet.getString("name");
    		 
    		 int day =resultSet.getInt("day");
    		 
    		 wcount=wcount+1;
    		 aday1[wcount]=day;
    		 
    	}
        }
        catch(NullPointerException e){
        	System.out.println("NUll exception");
        }
        catch(Exception e){
        	System.out.println("Excpeption Ocurred");
        }
        String cal_month="";
        if(cmonth.equalsIgnoreCase("1")){
        	cal_month="Jan";
        }
        else if(cmonth.equalsIgnoreCase("2")){
        	cal_month="Feb";
        }
        else if(cmonth.equalsIgnoreCase("3")){
        	cal_month="Mar";
        }
        else if(cmonth.equalsIgnoreCase("4")){
        	cal_month="Apr";
        }
        else if(cmonth.equalsIgnoreCase("5")){
        	cal_month="May";
        }
        else if(cmonth.equalsIgnoreCase("6")){
        	cal_month="Jun";
        }
        else if(cmonth.equalsIgnoreCase("7")){
        	cal_month="Jul";
        }
        else if(cmonth.equalsIgnoreCase("8")){
        	cal_month="Aug";
        }
        else if(cmonth.equalsIgnoreCase("9")){
        	cal_month="Sep";
        }
        else if(cmonth.equalsIgnoreCase("10")){
        	cal_month="Oct";
        }
        else if(cmonth.equalsIgnoreCase("11")){
        	cal_month="Nov";
        }
        else if(cmonth.equalsIgnoreCase("12")){
        	cal_month="Dec";
        }
        
        String vehicle_availability=""+ 
	    		"<link rel = 'stylesheet' type = 'text/css' href = 'css/table_style.css'>" +
	    		"<script type='text/javascript' src='js/jquery-1.7.2.min.js'></script>"+
	    		"<h2>"+cal_month+" "+cyear+"</h2>"+
	    		"<script>$('#btn_previous').on('click', function(){$( '#btn_previous' ).prop( 'disabled', true );"+
		"$('#btn_next').prop( 'disabled', false );htmlObj=$.ajax({url : 'vehicleavailability', type : 'POST',data : {value111 : 0},async:false});"+
		"$('#show_vehicle_availability').empty();"+
		"$('#show_vehicle_availability').append(htmlObj.responseText);});" +
		 "$('#btn_next').on('click', function(){$( '#btn_next' ).prop( 'disabled', true );$( '#btn_previous' ).prop( 'disabled', false );"+	
		"htmlObj=$.ajax({ url : 'vehicleavailability',type : 'POST',data : {value111 : 1},async:false});$('#show_vehicle_availability').empty();$('#show_vehicle_availability').append(htmlObj.responseText);});"+ 
		 
		"</script>"+
	    		"<div id='div_table'><a href='javascript:void(0);' id='btn_previous' value='0' title='Previous Month'><</a><a href='javascript:void(0);' id='btn_next' value='1' title='Next Month'>></a>" +
	    		"<table  class='table_style' style='width:100px;font-size:18px;' cellpadding:'4px' >" +
	    		"<tr><td style='background:#f2efea;' class='table_style'>Sun</td><td style='background:#f2efea;' class='table_style'>Mon</td><td style='background:#f2efea;' class='table_style'>Tue</td><td style='background:#f2efea;' class='table_style'>Wed</td><td style='background:#f2efea;' class='table_style'>Thu</td><td style='background:#f2efea;' class='table_style'>Fri</td><td style='background:#f2efea;' class='table_style'>Sat</td></tr>"
	    		;
        
        int colno=0;
        if(String_FirstDay.equalsIgnoreCase("Sun")){
        	colno=1;
        }
        else if(String_FirstDay.equalsIgnoreCase("Mon")){
        	colno=2;
        }
        else if(String_FirstDay.equalsIgnoreCase("Tue")){
        	colno=3;
        }
        else if(String_FirstDay.equalsIgnoreCase("Wed")){
        	colno=4;
        }
        else if(String_FirstDay.equalsIgnoreCase("Thu")){
        	colno=5;
        }
        else if(String_FirstDay.equalsIgnoreCase("Fri")){
        	colno=6;
        }
        else if(String_FirstDay.equalsIgnoreCase("Sat")){
        	colno=7;
        }	
       int count=00;
       int total_count=0;
        String first_tr="<tr>";
 	   String last_tr="</tr></div>";
 	   String first_td="<td class='table_style'>";
		String last_td="</td>";
		//style='background:#00ff55;' green color
		String colconcat=null; 
		String rowconcat="";
	    rowconcat=rowconcat.concat(vehicle_availability);

       for(int i=1;i<=6;i++){
    	   
    	    rowconcat=rowconcat.concat(first_tr);
    	
    	for(int j=1;j<=7;j++){
    		
    		if(j==colno){
    			count++;
    			//System.out.println(wcount);
    			for(int k=1;k<=wcount;k++){
    				//System.out.println(wcount);
    				
    				 if(aday1[k]<1){
     					
     					first_td="<td style='background:#a4f77b;' class='table_style'>";
     					System.out.println("1");
 					break;
 					}
    				else if(aday1[k]==count){
    					first_td="<td  style='background:#fc5425;' class='table_style'>";
    					break;
    					//System.out.println("2");
    				}
    				else{
    					first_td="<td style='background:#a4f77b;' class='table_style'>";
    					System.out.println("3");
    				}
    			}//for loop
    			//first_td="<td style='background:#a4f77b;' class='table_style'>";
    			if(wcount==0)
    				{first_td="<td style='background:#a4f77b;' class='table_style'>";}
    		    if(count<10){
    		    	rowconcat=rowconcat+first_td+"<a href='javascript:void(0)' onClick=to_open('"+"0"+count+"-"+cmonth+"-"+cyear+"') style='display:block;'>"+count+"</a>"+last_td;
    		    	//rowconcat=rowconcat+first_td+count+last_td;
    		    }else
    		    {
    		    	rowconcat=rowconcat+first_td+"<a href='javascript:void(0)' onClick=to_open('"+count+"-"+cmonth+"-"+cyear+"') style='display:block;'>"+count+"</a>"+last_td;
    		    }
    			colno=100;
    			first_td="<td style='background:#a4f77b;' class='table_style'>";
    			
    			
    			
    		}//if closed
    		else{
    			
    			if(colno==100){
    				if(count<int_LastDay){
    				count++;
    				
    				for(int k=1;k<=wcount;k++){
        				//System.out.println(wcount);
    				
    					 
    					  if (aday1[k]==count){
        					first_td="<td  style='background:#fc5425;' class='table_style'>";
        					System.out.println("4");
        					break;
        				  }
        				
        				else if(aday1[k]<1){
         					first_td="<td style='background:#a4f77b;' class='table_style'>";
         					System.out.println("5");
         					break;
         					}
 
    				} // for loop 	
    				//String Date="siddhu11";
    				if(count<10){
    				rowconcat=rowconcat+first_td+"<a href='javascript:void(0)' onClick=to_open('"+"0"+count+"-"+cmonth+"-"+cyear+"') style='display:block;'>"+count+"</a>"+last_td;
    				first_td="<td style='background:#a4f77b;' class='table_style'>";
    				}else{
    					rowconcat=rowconcat+first_td+"<a href='javascript:void(0)' onClick=to_open('"+count+"-"+cmonth+"-"+cyear+"') style='display:block;'>"+count+"</a>"+last_td;
        				first_td="<td style='background:#a4f77b;' class='table_style'>";
    					
    				}
    					
    				}
    				
    			}
    		else{
    			
    				rowconcat=rowconcat+first_td+last_td;
    			}
    			
    		
    		}
    		
    	}   //  innner for loop
		rowconcat=rowconcat+last_tr;

       } 	
        	
       response.getWriter().write(
        		
	    		rowconcat	
	    		
	    );
	}

}
