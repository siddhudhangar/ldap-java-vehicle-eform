package hbcse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditFormSaveData
 */
@WebServlet("/EditFormSaveData")
public class EditFormSaveData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFormSaveData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		String id=request.getParameter("id");		
		String DriverName=request.getParameter("DriverName");
		String VehicleNumber=request.getParameter("VehicleNumber");
		String Reason=request.getParameter("Reason");
		String Status=request.getParameter("Status");
		String DutyOfficerName=request.getParameter("DutyOfficerName");
		
		try{
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
		
       	String sql = "UPDATE vehicle_form_data SET DriverName=?,VehicleNumber=?,Reason=?,status=?,DutyOfficerName=? WHERE id=?";

		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, DriverName);
		stmt.setString(2, VehicleNumber);
		stmt.setString(3, Reason);
		stmt.setString(4, Status);
		stmt.setString(5, DutyOfficerName);
		stmt.setString(6, id);	
	
		int count = stmt.executeUpdate();
        if(count>0)
        {
      	  response.getWriter().write("SUCCESS");
        } 
        
        Connection  con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hbcse_eforms_database", "root", "root");
        Statement statement2=con1.createStatement();
  		String sql1 ="SELECT  * from vehicle_form_data where id="+id;
  		statement2.executeQuery(sql1);
  		ResultSet resultSet2=statement2.getResultSet();
  		
  		String MailContent2=null;
  		String MailContent3="";
  		//String email_id="";
  		
  		String MailContent1="<table id=myTable style='font-size:12px;margin-bottom:10px;' align=center>"
		   		+"<tr>"
		   		+"<td><b>Homi Bhabha Centre for Science Education | TIFR</b></td>"
		   		+"</tr>";
  		String MailContent4=""; 
  		while(resultSet2.next()){	
  			
  			//email_id=resultSet2.getString("EmailOfMember");
  			String idnew=resultSet2.getString("id");
  			System.out.println(idnew);
  			
  			MailContent2="<table id=myTable style=font-size:14px; align=center cellpadding=3 cellspacing=2 border=1>"+
  				"<tr bgcolor=#e5f6ff>" +
  	       	"<td bgcolor=#f4f3f2>Sr.No.</td><td>"+idnew+"</td></tr>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Full Name</td><td>"+resultSet2.getString("Full_Name")+"</td></tr>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Phone Number</td><td>"+resultSet2.getString("Phone_Number")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Date</td><td>"+resultSet2.getString("Date")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>TimeFrom</td><td>"+resultSet2.getString("TimeFrom")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>TimeTo</td><td>"+resultSet2.getString("TimeTo")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>NoOfPersons</td><td>"+resultSet2.getString("NoOfPersons")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>PlaceToVisit</td><td>"+resultSet2.getString("PlaceToVisit")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>PurposeOfVisit</td><td>"+resultSet2.getString("PurposeOfVisit")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>PlaceAndTime</td><td>"+resultSet2.getString("PlaceAndTime")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>SpecialInstructions</td><td>"+resultSet2.getString("SpecialInstructions")+"</td>" 
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>DriverName</td><td>"+resultSet2.getString("DriverName")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>VehicleNumber</td><td>"+resultSet2.getString("VehicleNumber")+"</td>";
  	   		
  	   		
  	   		if(resultSet2.getString("status").equals("Allocated")){
  	   		MailContent4="<tr bgcolor=#91ff8c><td bgcolor=#f4f3f2>Status</td><td>"+resultSet2.getString("status")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Reason</td><td>"+resultSet2.getString("Reason")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>DutyOfficerName</td><td>"+resultSet2.getString("DutyOfficerName")+"</td>"
  	   		+"</tr>";
  	   		}
  	   		else if(resultSet2.getString("status").equals("Rejected")){
  	   		MailContent4="<tr bgcolor=#ff897c><td bgcolor=#f4f3f2>Status</td><td>"+resultSet2.getString("status")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Reason</td><td>"+resultSet2.getString("Reason")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>DutyOfficerName</td><td>"+resultSet2.getString("DutyOfficerName")+"</td>"
  	   		+"</tr>";
  	   			
  	   		}
  	  	else if(resultSet2.getString("status").equals("Waiting")){
  	   		MailContent4="<tr bgcolor=#ffc58c><td bgcolor=#f4f3f2>Status</td><td>"+resultSet2.getString("status")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Reason</td><td>"+resultSet2.getString("Reason")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>DutyOfficerName</td><td>"+resultSet2.getString("DutyOfficerName")+"</td>"
  	   		+"</tr>";
  	   			
  	   		}
  		else if(resultSet2.getString("status").equals("VehicleNotAvailable")){
  	   		MailContent4="<tr bgcolor=#f7afeb><td bgcolor=#f4f3f2>Status</td><td>"+resultSet2.getString("status")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>Reason</td><td>"+resultSet2.getString("Reason")+"</td>"
  	   		+"<tr bgcolor=#e5f6ff><td bgcolor=#f4f3f2>DutyOfficerName</td><td>"+resultSet2.getString("DutyOfficerName")+"</td>"
  	   		+"</tr>";
  	   			
  	   		}
 
  			
  			MailContent3=MailContent1+MailContent2+MailContent4;
  			
	  		System.out.println("while end");
	  		
	  		//String sql3="UPDATE vehicle_form_data SET mailsend1=? WHERE id=?";
			//PreparedStatement stmt = con1.prepareStatement(sql3);
			//stmt.setString(1, "SEND");
			//stmt.setInt(2, idnew);	
	  		//int count = stmt.executeUpdate();
			
			String host = "smtp.gmail.com";
	       	String to = resultSet2.getString("email_id");	
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
	       	
	       	
	       	
	       	//String sql31 = "UPDATE vehicle_form_data SET mailsend3=? WHERE id=?";

			//PreparedStatement stmt1 = con1.prepareStatement(sql31);
			//stmt1.setString(1, "SEND");
			//stmt1.setString(2, idnew);	
		
		//	int count1 = stmt1.executeUpdate();

  		}//while closed      

		}catch(Exception e){
			System.out.println("Exception Occured");
		}
		
	}

}
