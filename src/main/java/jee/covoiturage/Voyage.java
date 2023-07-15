package jee.covoiturage;

public class Voyage {
         private int id, clientId , places , prix;
         private String destination , depart , date , time ,vehicule;
		public Voyage( int clientId, int places, int prix, String destination, String depart, String date,
				String time, String vehicule) {

			this.clientId = clientId;
			this.places = places;
			this.prix = prix;
			this.destination = destination;
			this.depart = depart;
			this.date = date;
			this.time = time;
			this.vehicule = vehicule;
		}
		public int getId() {
			return id;
		}

		public int getClientId() {
			return clientId;
		}
	
		public int getPlaces() {
			return places;
		}
		public void setPlaces(int places) {
			this.places = places;
		}
		public int getPrix() {
			return prix;
		}
		public void setPrix(int prix) {
			this.prix = prix;
		}
		public String getDestination() {
			return destination;
		}
		public void setDestination(String destination) {
			this.destination = destination;
		}
		public String getDepart() {
			return depart;
		}
		public void setDepart(String depart) {
			this.depart = depart;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public String getVehicule() {
			return vehicule;
		}
		public void setVehicule(String vehicule) {
			this.vehicule = vehicule;
		}
         
         
         
         
}
