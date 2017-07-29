package si.um.feri.rentacar;

public class Rezervacija {
	
	int idIzposoja;
	int Vozilo_idVozilo;
	int Izposojevalnica_idIzposojevalnica;
	String datum_od;
	String datum_do;
	int Uporabnik_idUporabnik;
	
	public int getIdIzposoja() {
		return idIzposoja;
	}
	
	public void setIdIzposoja(int idIzposoja) {
		this.idIzposoja = idIzposoja;
	}
	
	public int getVozilo_idVozilo() {
		return Vozilo_idVozilo;
	}
	
	public void setVozilo_idVozilo(int vozilo_idVozilo) {
		Vozilo_idVozilo = vozilo_idVozilo;
	}
	
	public int getIzposojevalnica_idIzposojevalnica() {
		return Izposojevalnica_idIzposojevalnica;
	}
	
	public void setIzposojevalnica_idIzposojevalnica(int izposojevalnica_idIzposojevalnica) {
		Izposojevalnica_idIzposojevalnica = izposojevalnica_idIzposojevalnica;
	}
	
	public String getDatum_od() {
		return datum_od;
	}
	public void setDatum_od(String datum_od) {
		this.datum_od = datum_od;
	}
	public String getDatum_do() {
		return datum_do;
	}
	public void setDatum_do(String datum_do) {
		this.datum_do = datum_do;
	}
	public int getUporabnik_idUporabnik() {
		return Uporabnik_idUporabnik;
	}
	public void setUporabnik_idUporabnik(int uporabnik_idUporabnik) {
		Uporabnik_idUporabnik = uporabnik_idUporabnik;
	}

}
