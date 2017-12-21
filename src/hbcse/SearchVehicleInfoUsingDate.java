package hbcse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SearchVehicleInfoUsingDate
 */
@WebServlet("/SearchVehicleInfoUsingDate")
public class SearchVehicleInfoUsingDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchVehicleInfoUsingDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
	String FromDate=request.getParameter("FromDate");
	String ToDate=request.getParameter("ToDate");
	
	System.out.println("sid");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
	
    Connection  con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
    Statement statement2=con1.createStatement();
		String sql ="SELECT  * from vehicle_form_data where verify_status='verify' AND status<>'PENDING' AND Date BETWEEN '"+FromDate+"' AND '"+ToDate+"' ORDER BY Date ASC";
		//System.out.println(NewDate);
		statement2.executeQuery(sql);
		ResultSet resultSet2=statement2.getResultSet();
		
		String MailContent1="<table id=myTable style='font-size:14px;'align=center cellpadding=3 cellspacing=2 border=1>"
		   		+"<tr bgcolor='#A2CBEF'>"
		   		+"<td><b>id</b></td>"
		   		+"<td><b>Full Name</b></td>"
		   		+"<td><b>Phone Number</b></td>"
	  		   	+"<td><b>Journey Date</b></td>"
		   		+"<td><b>TimeFrom</b></td>"
		   		+"<td><b>TimeTo</b></td>"
		   		+"<td><b>NoOf<br/>Persons</b></td>"
		   		+"<td><b>PlaceToVisit</b></td>"
		   		+"<td><b>PurposeOfVisit</b></td>"
		   		+"<td><b>PlaceAndTime</b></td>"
		   		+"<td><b>SpecialInstructions</b></td>"
		   		+"<td><b>DriverName</b></td>"
		   		+"<td><b>VehicleNumber</b></td>"
		   		+"<td><b>Status</b></td>"
		   		
		   		+"</tr>";
		String MailContent2="";
		StringBuffer sb1 = new StringBuffer(MailContent2);;
		
		while(resultSet2.next()){
			MailContent2="<tr bgcolor=e6e6e6>" +
  	       	"<td>"+resultSet2.getString("id")+"</td>"
  	   		+"<td>"+resultSet2.getString("Full_Name")+"</td>"
  	   		+"<td>"+resultSet2.getString("Phone_Number")+"</td>"
  	   		+"<td>"+resultSet2.getString("Date")+"</td>"
  	   		+"<td>"+resultSet2.getString("TimeFrom")+"</td>"
  	   		+"<td>"+resultSet2.getString("TimeTo")+"</td>"
  	   		+"<td>"+resultSet2.getString("NoOfPersons")+"</td>"
  	   		+"<td>"+resultSet2.getString("PlaceToVisit")+"</td>"
  	   		+"<td>"+resultSet2.getString("PurposeOfVisit")+"</td>"
  	   		+"<td>"+resultSet2.getString("PlaceAndTime")+"</td>"
  	   		+"<td>"+resultSet2.getString("SpecialInstructions")+"</td>"
			+"<td>"+resultSet2.getString("DriverName")+"</td>"
			+"<td>"+resultSet2.getString("VehicleNumber")+"</td>"
			+"<td>"+resultSet2.getString("Status")+"</td></tr>"
			;
			System.out.println("siddhu");
			sb1.append(MailContent2); 
			
		}
		
		
      	  response.getWriter().write(MailContent1+sb1.toString());
         
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
	}

}
