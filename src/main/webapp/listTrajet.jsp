<%@page import="java.sql.ResultSet"%>
<%@page import="jee.covoiturage.DBconnect"%>
<%
DBconnect conn = new DBconnect();
/*if(session.getAttribute("id")==null || session.getAttribute("id").equals("null") || session.getAttribute("id").toString().isEmpty()){
    response.sendRedirect("connecter.html");   
}
*/
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />
    <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
       <link rel="stylesheet" href="style.css"/>
    <title>Covoiturage</title>
</head>
<body>
    <ion-header>
        <ion-toolbar>
       
          <ion-buttons slot="end">
                   <%
                   out.print("<ion-button  href='trajet.jsp'><ion-icon name='add-outline'></ion-icon> Ajouter un trajet</ion-button>");
                   if(session.getAttribute("id")==null || session.getAttribute("id").equals("null") || session.getAttribute("id").toString().isEmpty()){
                  session.setAttribute("id", session.getAttribute("id"));
                   out.print("<ion-button href='inscription.html'>S'inscrire</ion-button>");
                   out.print("<ion-button href='connecter.html'>connecter</ion-button>");
                   }
                   %>

          </ion-buttons>
        
          <ion-title>Covoiturage</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-content [fullscreen]="true">
<div id="trajetlist">
<ion-list>

      <%
      String depart= request.getParameter("depart");
      String destination= request.getParameter("destination");
      String date= request.getParameter("date");
      ResultSet r = conn.getTrajet(depart, destination, date);
      String html ;
      while(r.next()){
  
    	  html=" <ion-item-sliding> <ion-item> <div class='it'> <div class='item'> <div class='item-left'> <h5>%s</h5> <p>%s -> %s</p> <p>Date : %s</p> </div>"
         +" <div class='item-right'> <p>Time : %s</p>  <p>%s</p> <p>Nombre de place: %s</p>  <p>Numero de telephone: %s</p></div> </div> <h4>Prix du place : %s TD</h4> </div> </ion-item> </ion-item-sliding>";
         
         out.print(String.format(html,r.getString("name"), r.getString("voyage.depart") ,r.getString("voyage.destination"),r.getString("voyage.date"), r.getString("voyage.time"), 
        	r.getString("voyage.vehicule"),r.getString("voyage.places"), r.getString("clientuser.tlf") ,r.getString("voyage.prix")	 ));
    	   
         
         
      }
      
      
      %>

  

    

  </ion-list>

</div>

</ion-content>

</body>
</html>