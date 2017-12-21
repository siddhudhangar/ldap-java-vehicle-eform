package hbcse;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Hashtable;

import javax.naming.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import javax.naming.directory.*;

/**
 * Servlet implementation class ldaplogin
 */
@WebServlet("/ldaplogin")
public class ldaplogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ldaplogin() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	
		  String username = request.getParameter("username");
		  String password = request.getParameter("password");
		  HttpSession session=request.getSession();
		
		  String cn=null;
          String uid=null;
          String mail=null;
          String sn=null;
          
		  Hashtable<String, String> env = new Hashtable<String, String>();
		  response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
		  boolean b = false;

		  env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		 // env.put(Context.PROVIDER_URL, "ldap://localhost:389");
		  env.put(Context.PROVIDER_URL, "ldap://158.144.44.231:389/dc=hbcse,dc=tifr,dc=res,dc=in");
		  env.put(Context.SECURITY_AUTHENTICATION, "simple");
		  //env.put(Context.SECURITY_PRINCIPAL, "uid=" + username + ", cn=computer_lab,ou=hbcse,dc=example,dc=com");
		  env.put(Context.SECURITY_PRINCIPAL, "uid=" + username + ", ou=People,dc=hbcse,dc=tifr,dc=res,dc=in");		  
		  env.put(Context.SECURITY_CREDENTIALS, password);
		  try { 	
			  // Create initial context
	    	    DirContext ctx = new InitialDirContext(env);
		   // Close the context when we're done
	    	    b = true;
	    	  
	            String filter = "(uid="+username+")"; // Enter User ID here. 
	            String[] attrIDs = {"uid","cn","mail","sn"}; // Enter list of attributes to retrieve from LDAP here
	             
	            SearchControls ctls = new SearchControls();
	            ctls.setSearchScope(SearchControls.SUBTREE_SCOPE);
	            ctls.setReturningAttributes(attrIDs);
	 
	            NamingEnumeration answer = ctx.search("ou=People", filter, ctls);
	 
	            SearchResult searchResult = null;
	           
	 
	            while (answer.hasMore()) {
	                searchResult = (SearchResult) answer.next();
	                Attributes attr = searchResult.getAttributes();
	                cn=attr.get("cn").get(0).toString();
	                uid=attr.get("uid").get(0).toString();
	                mail=attr.get("mail").get(0).toString();
	                sn=attr.get("sn").get(0).toString();
	                 
	                System.out.println("Name: "+cn);
	                System.out.println("User ID: "+uid);
	                System.out.println("E-mail Address: "+mail);
	                System.out.println("sn "+sn);
	                }
	    	    
	    	    ctx.close();
		  }
		  catch (AuthenticationNotSupportedException ex) {
			    System.out.println("The authentication is not supported by the server");
			    b = false;
			} catch (AuthenticationException ex) {
			    
			    response.getWriter().write("FAILURE");
			    System.out.println("incorrect password or username");
				
	               
	               b = false;
			} catch (NamingException ex) {
				//out.print("<h1 style=color:red;text-align:center;>Sorry, username or password is incorrect!<h1>");
				//request.getRequestDispatcher("login.html").include(request, response);
				//response.sendRedirect("index.html")
	            //   out.print("<h1 style=color:red;text-align:center;>Sorry, username or password is incorrect!<h1>");
				b = false;
			
			    System.out.println("error when trying to create the context");
				}
			
		    finally {
		    	if (b) {
		    		
		    		  
		            session.setAttribute("username",username);
		            //session.setMaxInactiveInterval(1 * 60);
		             //response.getWriter().write("SUCCESS");
		            response.getWriter().write("SUCCESS");
		             	Cookie loginCookie1 = new Cookie("username",username);
						Cookie loginCookie2 = new Cookie("cn",cn);
						Cookie loginCookie3 = new Cookie("mail",mail);
			           	//setting cookie to expiry in 4 hours 
			           	loginCookie1.setMaxAge(240*60);
			           	loginCookie2.setMaxAge(240*60);
			           	loginCookie3.setMaxAge(240*60);
			           	
			           	response.addCookie(loginCookie1);
			           	response.addCookie(loginCookie2);
			           	response.addCookie(loginCookie3);
			           		
		    	}	
		    }	
	}
}//class end
	

  

