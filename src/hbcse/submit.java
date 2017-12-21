package hbcse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


 import java.io.IOException;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;
import java.util.UUID;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.util.Date;
import javax.net.ssl.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
/**
 * Servlet implementation class Register
 */
@WebServlet("/submit")
public class submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String UID1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submit() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static void ChkApproval(String userName,String EmailOfMember)
	{
		
		
        // below code for sending mail to approving member
        try{
        	Class.forName("com.mysql.jdbc.Driver");
	    Connection  con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
        Statement statement2=con1.createStatement();
  		String sql ="SELECT  * from vehicle_form_data where mailsend1='PENDING' AND status='PENDING' AND mailsend2='PENDING' AND mailsend3='PENDING'";
  		statement2.executeQuery(sql);
  		ResultSet resultSet2=statement2.getResultSet();
  		
  		String MailContent2=null;
  		String MailContent3="";
  		//String email_id="";
  		String MailContent1;
  		
  		if(EmailOfMember.equals("NoApprovingMember")){
  		 MailContent1="<table id=myTable style='font-size:14px;'align=center cellpadding=3 cellspacing=2 border=1>"
	   		+"<tr bgcolor=#99ccff>"
	   		+"<td><b>id</b></td>"
	   		+"<td><b>Full_Name</b></td>"
	   		+"<td><b>Phone_Number</b></td>"
  		   	+"<td><b>Journey Date</b></td>"
	   		+"<td><b>TimeFrom</b></td>"
	   		+"<td><b>TimeTo</b></td>"
	   		+"<td><b>NoOfPersons</b></td>"
	   		+"<td><b>PlaceToVisit</b></td>"
	   		+"<td><b>PurposeOfVisit</b></td>"
	   		+"<td><b>PlaceAndTime</b></td>"
	   		+"<td><b>SpecialInstructions</b></td>"
	   		+"<td><b>ApprovedBy</b></td>"
	   		+"</tr>";
  		 
  		}else{
  		MailContent1="<table id=myTable style='font-size:14px;'align=center cellpadding=3 cellspacing=2 border=1>"
		   		+"<tr bgcolor=#99ccff>"
		   		+"<td><b>id</b></td>"
		   		+"<td><b>Full_Name</b></td>"
		   		+"<td><b>Phone_Number</b></td>"
	  		   	+"<td><b>Journey Date</b></td>"
		   		+"<td><b>TimeFrom</b></td>"
		   		+"<td><b>TimeTo</b></td>"
		   		+"<td><b>NoOfPersons</b></td>"
		   		+"<td><b>PlaceToVisit</b></td>"
		   		+"<td><b>PurposeOfVisit</b></td>"
		   		+"<td><b>PlaceAndTime</b></td>"
		   		+"<td><b>SpecialInstructions</b></td>"
		   		+"</tr>";
  		}
  		while(resultSet2.next()){
  			
  			//email_id=resultSet2.getString("EmailOfMember");
  			String idnew=resultSet2.getString("id");
  			System.out.println(idnew);
  			
  			MailContent2="<tr bgcolor=e6e6e6>" +
  	       	"<td>"+idnew+"</td>"
  	   		+"<td>"+resultSet2.getString("Full_Name")+"</td>"
  	   		+"<td>"+resultSet2.getString("Phone_Number")+"</td>"
  	   		+"<td>"+resultSet2.getString("Date")+"</td>"
  	   		+"<td>"+resultSet2.getString("TimeFrom")+"</td>"
  	   		+"<td>"+resultSet2.getString("TimeTo")+"</td>"
  	   		+"<td>"+resultSet2.getString("NoOfPersons")+"</td>"
  	   		+"<td>"+resultSet2.getString("PlaceToVisit")+"</td>"
  	   		+"<td>"+resultSet2.getString("PurposeOfVisit")+"</td>"
  	   		+"<td>"+resultSet2.getString("PlaceAndTime")+"</td>"
  	   		+"<td>"+resultSet2.getString("SpecialInstructions")+"</td>";
  			
  
  			if(EmailOfMember.equals("NoApprovingMember")){
  			
  				MailContent2=MailContent2+"<td>"+resultSet2.getString("ApprovingMember")+"</td></tr></table>";
  				MailContent3=MailContent1+MailContent2;
  			}else
  			{
  				MailContent2=MailContent2+"</tr></table>";
  				
  				String MailContent4="Click Below URL to give Approval to user <br/><br/><a href=http://localhost:8080/eforms/verify.jsp?"+ UID1 +">http://localhost:8080/eforms/verify.jsp?"+UID1+"</a><br/><br/>";
  	  			
  				MailContent3=MailContent1+MailContent2+MailContent4;		
  			}
  			
	  		//System.out.println("while end");
	  		
	  		//String sql3="UPDATE vehicle_form_data SET mailsend1=? WHERE id=?";
			//PreparedStatement stmt = con1.prepareStatement(sql3);
			//stmt.setString(1, "SEND");
			//stmt.setInt(2, idnew);	
	  		//int count = stmt.executeUpdate();
			
			String host = "smtp.gmail.com";
			String to;
			if(EmailOfMember.equals("NoApprovingMember")){
				to = "siddhudhangar@gmail.com";
			}
			else{
				to = resultSet2.getString("EmailOfMember");
			}
	       	
	       	//String to = "clabteam@hbcse.tifr.res.in";
	  		String from="noreply.hbcse@gmail.com";
	  		String subject = "Vehicle Requistion E-Form";
	       	//String messageText = request.getParameter("body");
	       	boolean sessionDebug =false;
	       	// Create some properties and get the default Session.
	       		Properties props = System.getProperties();
	   		props.put("mail.transport.protocol", "smtp");
	   		props.put("mail.host", host);
	   		props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.port", "465");    //port is 587 for TLS  if you use SSL then port is 465
			props.put("mail.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			//Session mailSession = Session.getDefaultInstance(props, null);
	       	Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {return new PasswordAuthentication("noreply.hbcse@gmail.com", "noreply123");
	  		}
	  		});
	       	// Set debug on the Session
	       	// Passing false will not echo debug info, and passing True will.
	       	 
	       	mailSession.setDebug(sessionDebug);
	       	 
	       	// Instantiate a new MimeMessage and fill it with the 
	       	// required information.
	       	 
	       	Message msg = new MimeMessage(mailSession);
	       	msg.setFrom(new InternetAddress(from));
	       	InternetAddress[] address = {new InternetAddress(to)};
	       	msg.setRecipients(Message.RecipientType.TO, address);
	       	msg.setSubject(subject);
	       	msg.setSentDate(new java.util.Date());
	       //	msg.setText(MailContent1);
	       	msg.setContent(MailContent3,"text/html");
	 		Transport transport = mailSession.getTransport("smtp");
	 		//transport.connect(host, "siddhu@hbcse.tifr.res.in", "Tiger@123");
	 		transport.connect(host, "noreply.hbcse@gmail.com", "noreply123");
	 		//transport.sendMessage(msg, msg.getAllRecipients());
	       	// Hand the message to the default transport service
	       	// for delivery.
	       	Transport.send(msg);
	       	//out.println("Mail was sent to " + to);
	       	
	       	
	       	
	       	String sql31 = "UPDATE vehicle_form_data SET mailsend1=? WHERE id=?";

			PreparedStatement stmt = con1.prepareStatement(sql31);
			stmt.setString(1, "SEND");
			stmt.setString(2, idnew);	
		
			int count = stmt.executeUpdate();

  		}

        }
        catch(Exception se)
        {
            se.printStackTrace();
        }

}//chk method end


	/**
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		Calendar calendar = Calendar.getInstance();
	    java.sql.Date date1 = new java.sql.Date(calendar.getTime().getTime());
	    String newdate= new SimpleDateFormat("dd-MM-yyyy").format(date1);
	    
	    SimpleDateFormat sdFormat = new SimpleDateFormat("dd-MM-yyyy");
	    long daysDiff=0;
	    
	    String userName = (String)request.getSession().getAttribute("username");
	    
		String Full_Name=request.getParameter("Full_Name");
		String Phone_Number=request.getParameter("Phone_Number");
		//String ApprovingMember=request.getParameter("ApprovingMember");
		String ApprovingMember = request.getParameter("ApprovingMember");;
		
		String ApprovingMember1;
	
		String Date=request.getParameter("Date");
		
		String[] parts = Date.split("-");
		String day = parts[0];
		String month = parts[1];
		String year = parts[2];
		
		String EmailOfMember;
		if(!ApprovingMember.equals(null))
		{
			 System.out.println("IF BLOCK ");
				//System.out.println(request.getParameter("ApprovingMember"));
				EmailOfMember=ApprovingMember;
				ApprovingMember1=ApprovingMember.replace("@hbcse.tifr.res.in",""); 
		}
		else 
		{
			EmailOfMember="NoApprovingMember";
			 ApprovingMember1=userName;			
		
		}
		
		String hm1=request.getParameter("hm1");
		String hm2=request.getParameter("hm2");
		String hm3=request.getParameter("hm3");
		
		String hm=hm1+":"+hm2+""+hm3;
		
		String newhm1=request.getParameter("newhm1");
		String newhm2=request.getParameter("newhm2");
		String newhm3=request.getParameter("newhm3");
		
		String newhm=newhm1+":"+newhm2+""+newhm3;
		
		String NoOfPersons=request.getParameter("NoOfPersons");
		String PlaceToVisit=request.getParameter("PlaceToVisit");
		String PurposeOfVisit=request.getParameter("PurposeOfVisit");
		String PlaceAndTime=request.getParameter("PlaceAndTime");
		String SpecialInstructions=request.getParameter("SpecialInstructions");
		
		String mail=request.getParameter("mail");

		String AreaToTravel=request.getParameter("AreaToTravel");
		
		UUID UniqueID = UUID.randomUUID();
       	String UID=String.valueOf(UniqueID);
       	 UID1=UID.replaceAll("-","");

		
		try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
        PreparedStatement ps=con.prepareStatement("insert into vehicle_form_data (Full_Name,Phone_Number,ApprovingMember,Date,TimeFrom,TimeTo,NoOfPersons,PlaceToVisit,PurposeOfVisit,PlaceAndTime,SpecialInstructions,EmailOfMember,UUID,email_id,day,month,year)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		ps.setString(1,Full_Name);
		ps.setString(2,Phone_Number);
		ps.setString(3,ApprovingMember1);
		ps.setString(4,Date);
		ps.setString(5,hm);
		ps.setString(6,newhm);
		ps.setString(7,NoOfPersons);
		ps.setString(8,PlaceToVisit);
		ps.setString(9,PurposeOfVisit);
		ps.setString(10,PlaceAndTime);
		ps.setString(11,SpecialInstructions);
		ps.setString(12,EmailOfMember);
		ps.setString(13,UID1);
		ps.setString(14,mail);
		ps.setString(15,day);
		ps.setString(16,month);
		ps.setString(17,year);
		
		int i=ps.executeUpdate();
		
          if(i>0)
          {
        	  response.getWriter().write("SUCCESS");
          } 
       	
		if(userName.matches("sugrac|am|director")){
			//send mail to Security officer
			submit.ChkApproval(userName,EmailOfMember);	
		}
		
		else if((AreaToTravel.equals("WithinCity")) && (userName.matches("siddhu"))){
			//send mail to security officer
			submit.ChkApproval(userName,EmailOfMember);
		}
		else if( (AreaToTravel.equals("OutsideCity")) && (userName.matches("siddhu12"))){
			//send mail to approval person
			submit.ChkApproval(userName,EmailOfMember);
		}
		else{
			//send mail to approval person
			submit.ChkApproval(userName,EmailOfMember);
		}
		
		}
		catch(Exception e){
			System.out.println("Exception ocuured");
			
		}
	        
		
		


}


}