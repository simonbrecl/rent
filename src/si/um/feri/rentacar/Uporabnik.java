package si.um.feri.rentacar;

public class Uporabnik {
	
	private String ime;
	private String priimek;
	private String upoime;
	private String telefon;
	private String geslo;
	private int id;
	
	public Uporabnik() {
		this("","","","","",0);
	}
	
	public Uporabnik(String upoime, String geslo, int id) {
		this.upoime = upoime;
		this.geslo = geslo;
		this.id = id;
	}
	
	public Uporabnik(String ime, String priimek, String upoime, String telefon, String geslo) {
		this.ime = ime;
		this.priimek = priimek;
		this.upoime = upoime;
		this.telefon = telefon;
		this.geslo = geslo;
	}

	public Uporabnik(String ime, String priimek, String upoime, String telefon, String geslo, int id) {
		this.ime = ime;
		this.priimek = priimek;
		this.upoime = upoime;
		this.telefon = telefon;
		this.geslo = geslo;
		this.id = id;
	}

	public String getIme() {
		return ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPriimek() {
		return priimek;
	}

	public void setPriimek(String priimek) {
		this.priimek = priimek;
	}

	public String getUpoime() {
		return upoime;
	}

	public void setUpoime(String upoime) {
		this.upoime = upoime;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public String getGeslo() {
		return geslo;
	}

	public void setGeslo(String geslo) {
		this.geslo = geslo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Ime: " + ime + " Priimek: " + priimek + "\nUporabniško ime: "
				+ upoime + " Telefon: " + telefon + " \nGeslo: " + geslo
				+ " Id: " + id;
	}
	
	

}
