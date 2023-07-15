<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
if(session.getAttribute("id")==null || session.getAttribute("id").equals("null") || session.getAttribute("id").toString().isEmpty()){
 response.sendRedirect("connecter.html");
 
}
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
          <ion-title>Covoiturage</ion-title>
        </ion-toolbar>
      </ion-header>

<ion-content [fullscreen]="true">
    <div id="trajet">
     <form action="Insert" id="inscri" method="post">
         <h1>
            Devenez conducteur Covoiturage et faites des économies en partageant vos frais de voyage
         </h1>
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
            <ion-label><ion-icon name="navigate-circle-outline"></ion-icon>Type de véhicule</ion-label>
            <ion-select name="vehcule" multiple="false" cancelText="Nah" okText="Okay!">
              <ion-select-option value="Voiture" >Voiture</ion-select-option>
              <ion-select-option value="Lowage">Lowage</ion-select-option>
              <ion-select-option value="Bus">Bus</ion-select-option>
            </ion-select>
          </ion-item>

          <ion-item>
            <ion-input   name="date" type="date" data-date="" data-date-format="DD MMMM YYYY" value="">

          </ion-item>
          <ion-item>
            <ion-input  name="time" type="time" data-date="" data-date-format="DD MMMM YYYY" >

          </ion-item>
          <ion-item>
           <ion-label >Nombre de Place</ion-label>
          <ion-input  name="place" type=number >
          </ion-item>
          <ion-item>
            <ion-label>Prix</ion-label>
            <ion-input  name="prix" type="number"  />
          </ion-item>
          <ion-input type="submit" id="log" value="Publier le trajet"></ion-input>

        </form>
    </div>
       
    </div>

</ion-content>

</body>
</html>