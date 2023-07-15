package jee.covoiturage;

public class User {
          private int id ; 
          private String name , email , mdp , tlf ;
		
          public User( String name, String email, String mdp, String tlf) {
			this.name = name;
			this.email = email;
			this.mdp = mdp;
			this.tlf = tlf;
		}

		public int getId() {
			return id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getMdp() {
			return mdp;
		}

		public void setMdp(String mdp) {
			this.mdp = mdp;
		}

		public String getTlf() {
			return tlf;
		}

		public void setTlf(String tlf) {
			this.tlf = tlf;
		} 
          
          
          
}
