package jee.covoiturage;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String depart = request.getParameter("depart")  ;
        String destination = request.getParameter("destination")  ;
        String vehcule = request.getParameter("vehcule")  ;
        String date = request.getParameter("date")  ;
        String time = request.getParameter("time")  ;
        String prix = request.getParameter("prix")  ;
        String place = request.getParameter("place");
       HttpSession session=request.getSession();   	
        String id = session.getAttribute("id").toString();
        PrintWriter w = response.getWriter();
        w.print(depart);
        
      Voyage v =new Voyage( Integer.parseInt(id), Integer.parseInt(place), Integer.parseInt(prix), destination,  depart,  date,time,  vehcule);
        
       DBconnect conn = new DBconnect();
        
		try {
			conn.voyage(v);
			response.sendRedirect("index.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
		w.print(e);
		}
	
        
        


		
	}

}
