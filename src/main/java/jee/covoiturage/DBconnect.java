package jee.covoiturage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mysql.jdbc.Driver;


public class DBconnect {
	private  Connection con;
      private void connect() throws SQLException, ClassNotFoundException {
    	  Class.forName("com.mysql.jdbc.Driver");
    	   con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/covoiturage", "root", "");
    	
      }
      
      public void creatTable() throws SQLException, ClassNotFoundException {
    	  connect();
    	  String sql = "CREATE TABLE IF NOT EXISTS clientUser("
    	      		+ "    clientId integer PRIMARY KEY AUTO_INCREMENT,"
    	      		+ "    name varchar(100) NOT NULL ,"
    	      		+ "    email varchar(200),"
    	      		+ "    mdp varchar(20),"
    	      		+ "    tlf varchar(8)"
    	      		+ "    );";
    	      PreparedStatement stat = con.prepareStatement(sql);
    		  stat.executeUpdate();

    		  //creat Client table Voyage
    		  sql="CREATE TABLE IF NOT EXISTS voyage ("
    		  		+ "    id integer PRIMARY KEY AUTO_INCREMENT ,"
    				+ "    places integer NOT NULL ,"  
    		  		+ "    depart varchar(50) NOT NULL ,"
    		  		+ "    destination varchar(50) NOT NULL ,"
    		  		+ "    date varchar(11) NOT NULL,"
    		  		+ "    time varchar(6) NOT NULL,"
    		  		+ "    vehicule varchar(20) NOT NULL,"
    		  		+ "    prix integer NOT NULL DEFAULT 0,"
    		  		+ "    clientId integer NOT NULL,"
    		  		+ "    FOREIGN KEY (clientId) REFERENCES clientuser(clientId)"
    		  		+ "    );";
    		        stat = con.prepareStatement(sql);
    		        stat.executeUpdate();
    	  
      }

       public void insertClient(User u) throws ClassNotFoundException, SQLException {
    	   connect();
    	   String sql = "INSERT INTO `clientuser`(`name`, `email`, `mdp`, `tlf`) VALUES (?,?,?,?);";
           PreparedStatement stat =con.prepareStatement(sql);
           stat.setString(1, u.getName());
           stat.setString(2, u.getEmail());
           stat.setString(3, u.getMdp());
           stat.setString(4, u.getTlf());
           stat.executeUpdate();
           con.close();
           
       }
       
       
       
       public void voyage(Voyage v) throws ClassNotFoundException, SQLException {
    	   connect();
    	    String sql = "INSERT INTO `voyage`(`places`, `depart`, `destination`, `date`, `time`, `vehicule`, `prix`, `clientId`) VALUES (?,?,?,?,?,?,?,?)";
           PreparedStatement stat=con.prepareStatement(sql);
           stat.setInt(1,v.getPlaces());
           stat.setString(2, v.getDepart());
           stat.setString(3, v.getDestination());
           stat.setString(4, v.getDate());
           stat.setString(5, v.getTime());
           stat.setString(6, v.getVehicule());
           stat.setInt(7, v.getPrix());
           stat.setInt(8,v.getClientId())  ;
           stat.executeUpdate();
           con.close();
           
       }
       
       
       public boolean verifLogin(String mail , String mdp ) throws ClassNotFoundException, SQLException {
    	  connect();
    	   String sql = "SELECT  count(*) as n from clientuser where email ='"+mail+"' and mdp ='"+mdp+"';";
    	   PreparedStatement  stat=con.prepareStatement(sql);
    	   ResultSet  rs = stat.executeQuery(sql);
    	    rs.next();
         int n=rs.getInt("n");
        // rs.close();
    	    //con.close();
    	  return n!=0; 
       }
       
       public boolean userExiste(String mail) throws ClassNotFoundException, SQLException {
     	  connect();
     	   String sql = "SELECT  count(*) as n from clientuser where email ='"+mail+"';";
     	   PreparedStatement  stat=con.prepareStatement(sql);
     	   ResultSet  rs = stat.executeQuery(sql);
     	    rs.next();
          int n=rs.getInt("n");
          //rs.close();
     	    //con.close();
     	  return n!=0; 
        }
       
       public boolean verifId(String id) throws ClassNotFoundException, SQLException {
    	   connect();
    	   String sql = "SELECT clientId as n from clientuser where clientId='"+id+"';";
    	   PreparedStatement  stat=con.prepareStatement(sql);
    	   ResultSet  rs = stat.executeQuery(sql);
    	    rs.next();
    	    int n=rs.getInt("n");
    	   // rs.close();
    	    //con.close();
    	  return n!=0; 
       }
       
       public String getId(String mail , String mdp ) throws ClassNotFoundException, SQLException {
    	  connect();
    	   String sql = "SELECT clientid  from clientuser where email ='"+mail+"' and mdp ='"+mdp+"';";
    	   PreparedStatement  stat=con.prepareStatement(sql);
    	   ResultSet  rs = stat.executeQuery(sql);
    	    rs.next();
    	    //rs.close();
    	   //con.close();

    	  return rs.getString("clientid"); 
       }
       
       
       public ResultSet getTrajet(String depart , String destination , String date) throws ClassNotFoundException, SQLException {
    	   connect();
    	   String html = "SELECT clientuser.name , voyage.depart ,voyage.places,clientuser.tlf ,voyage.destination , voyage.date , voyage.time , voyage.vehicule , voyage.prix "
    	  			+ "from clientuser , voyage "
    	  			+ "where clientuser.clientId=voyage.clientId and voyage.depart ='%s' and voyage.destination='%s' and voyage.date='%s' ";
    	   
    	  String sql= String.format(html, depart,destination,date);
    	  System.out.print(sql);
    	   PreparedStatement  stat=con.prepareStatement(sql);
    	   //con.close();
    	  return stat.executeQuery(sql);
       }
       
       
}
