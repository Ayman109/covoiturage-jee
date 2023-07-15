package jee.covoiturage;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;

/**
 * Servlet implementation class Inscrit
 */
@WebServlet("/Inscrit")
public class Inscrit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Inscrit() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
		// TODO Auto-generated method stub
		
	     String name = request.getParameter("name");
	     String email = request.getParameter("email");
	     String mdp = request.getParameter("password");
	     String tel  =request.getParameter("tel");
	     
	     if(name.isEmpty() || email.isEmpty() || mdp.isEmpty() || tel.isEmpty()) response.sendRedirect("inscription.html");
	     User user= new User(name, email, mdp, tel);
	     DBconnect c = new DBconnect();
         PrintWriter w = response.getWriter();
	     try {		
	    	 c.creatTable();
			c.insertClient(user);
		    response.sendRedirect("connecter.html");
			
			
		} catch (SQLException e) {
         w.print(e);
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			 w.print(e);
		}
	    
	     
	}
}
