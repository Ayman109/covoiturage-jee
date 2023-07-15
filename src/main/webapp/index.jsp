
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    session.setAttribute("id",session.getAttribute("id"));
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />
    <link rel="stylesheet" href="style.css">
    <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
    <title>Covoiturage</title>
</head>
<body>
    <ion-header>
        <ion-toolbar>
            <!--Régler avec JSP-->
          <ion-buttons slot="end">
                   <%
                   out.print("<ion-button  href='trajet.jsp'><ion-icon name='add-outline'></ion-icon> Ajouter un trajet</ion-button>");
                   if(session.getAttribute("id")==null || session.getAttribute("id").equals("null") || session.getAttribute("id").toString().isEmpty()){
                   out.print("<ion-button href='inscription.html'>S'inscrire</ion-button>");
                   out.print("<ion-button href='connecter.html'>connecter</ion-button>");
                   }
                   %>

          </ion-buttons>
          <!---------------------->
          <ion-title>Covoiturage</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-content [fullscreen]="true">
          <div id="main">
          <form action="listTrajet.jsp" id="my_form">
            <ion-item>
                <ion-label><ion-icon name="ellipse-outline"></ion-icon> Départ</ion-label>
                <ion-select name="depart" multiple="false" cancelText="Nah" okText="Okay!">                
                  <ion-select-option value="Ariana">Ariana</ion-select-option>
                  <ion-select-option value="Béja"> Béja</ion-select-option>
                  <ion-select-option value="Ben Arous">Ben Arous</ion-select-option>
                  <ion-select-option value="Bizerte">Bizerte</ion-select-option>
                  <ion-select-option value="Gabes">Gabes</ion-select-option>
                  <ion-select-option value="Gafsa">Gafsa</ion-select-option>
                  <ion-select-option value="Jendouba">Jendouba</ion-select-option>
                  <ion-select-option value="Kairouan">Kairouan</ion-select-option>
                  <ion-select-option value="Kasserine">Kasserine</ion-select-option>
                  <ion-select-option value="Kebili">Kebili</ion-select-option>
                   <ion-select-option value="La Manouba">La Manouba</ion-select-option>
                   <ion-select-option value="Le Kef">Le Kef</ion-select-option>
                   <ion-select-option value="Mahdia">Mahdia</ion-select-option>
                  <ion-select-option value="Médenine">Médenine</ion-select-option>
                  <ion-select-option value="Monastir">Monastir</ion-select-option>
                  <ion-select-option value="Nabeul">Nabeul</ion-select-option>
                  <ion-select-option value="Sfax">Sfax</ion-select-option>
                   <ion-select-option value="Sidi Bouzid">Sidi Bouzid</ion-select-option>
                   <ion-select-option value="Siliana">Siliana</ion-select-option>
                    <ion-select-option value="Sousse">Sousse</ion-select-option>
                   <ion-select-option value="Tataouine">Tataouine</ion-select-option>
                    <ion-select-option value="Tozeur">Tozeur</ion-select-option>
                    <ion-select-option value="Tunis">Tunis</ion-select-option>
                    <ion-select-option value="Zaghouan">Zaghouan</ion-select-option>
  
                </ion-select>
              </ion-item>

              <ion-item>
                <ion-label><ion-icon name="navigate-circle-outline"></ion-icon>Destination</ion-label>
                <ion-select name="destination" multiple="false" cancelText="Nah" okText="Okay!">
                  <ion-select-option value="Ariana">Ariana</ion-select-option>
                  <ion-select-option value="Béja"> Béja</ion-select-option>
                  <ion-select-option value="Ben Arous">Ben Arous</ion-select-option>
                  <ion-select-option value="Bizerte">Bizerte</ion-select-option>
                  <ion-select-option value="Gabes">Gabes</ion-select-option>
                  <ion-select-option value="Gafsa">Gafsa</ion-select-option>
                  <ion-select-option value="Jendouba">Jendouba</ion-select-option>
                  <ion-select-option value="Kairouan">Kairouan</ion-select-option>
                  <ion-select-option value="Kasserine">Kasserine</ion-select-option>
                  <ion-select-option value="Kebili">Kebili</ion-select-option>
                   <ion-select-option value="La Manouba">La Manouba</ion-select-option>
                   <ion-select-option value="Le Kef">Le Kef</ion-select-option>
                   <ion-select-option value="Mahdia">Mahdia</ion-select-option>
                  <ion-select-option value="Médenine">Médenine</ion-select-option>
                  <ion-select-option value="Monastir">Monastir</ion-select-option>
                  <ion-select-option value="Nabeul">Nabeul</ion-select-option>
                  <ion-select-option value="Sfax">Sfax</ion-select-option>
                   <ion-select-option value="Sidi Bouzid">Sidi Bouzid</ion-select-option>
                   <ion-select-option value="Siliana">Siliana</ion-select-option>
                    <ion-select-option value="Sousse">Sousse</ion-select-option>
                   <ion-select-option value="Tataouine">Tataouine</ion-select-option>
                    <ion-select-option value="Tozeur">Tozeur</ion-select-option>
                    <ion-select-option value="Tunis">Tunis</ion-select-option>
                    <ion-select-option value="Zaghouan">Zaghouan</ion-select-option>
                </ion-select>
              </ion-item>

              <ion-item>
                <ion-input name="date" type="date" data-date="" data-date-format="DD MMMM YYYY" value="2022-02-08">

              </ion-item>


              <ion-button href="javascript:{}" onclick="document.getElementById('my_form').submit();">
                <ion-icon name="search-outline"></ion-icon> Rechercher
              </ion-button>
              </form>
          </div>

      
 
      </ion-content>


    
</body>
</html>