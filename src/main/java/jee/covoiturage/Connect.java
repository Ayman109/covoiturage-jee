package jee.covoiturage;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.SessionCookieConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionAttributeListener;

/**
 * Servlet implementation class Connect
 */
@WebServlet("/Connect")
public class Connect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connect() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
	       PrintWriter w = response.getWriter();
	   
	       if( email.isEmpty() || mdp.isEmpty()) response.sendRedirect("connecter.html");
		DBconnect conn = new DBconnect();
		try {
			   w.print(email+" "+mdp);
			if(conn.verifLogin(email, mdp)) {
		        HttpSession session=request.getSession();  
		        session.setAttribute("id",conn.getId(email, mdp));
				response.sendRedirect("index.jsp?");
			}
			else {
				response.sendRedirect("connecter.html");
			}
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		    w.print(e);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		    w.print(e);
		}
		
		
		
		
	}

}
