package si.um.feri.rentacar;

import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RezervacijaDao {
	
	public static String izposoja (String datum1,String datum2,String upoime,String idAvto) throws SQLException{
		
	    Connection conn = DriverManager.getConnection("jdbc:mysql://164.8.251.196:3306/p12015rentacar", "p12015rentacar", "gp12015rentacar");
	    Statement st = conn.createStatement();
	        
	    ResultSet rs;
	    rs = st.executeQuery("select idUporabnik from Uporabnik where  Upoime='" + upoime + "'");
	    
		String povezava = "povezava";
		
		
		while(rs.first()){
		
		Statement st1 = conn.createStatement();
		
        st1.executeUpdate("insert into Izposoja( Vozilo_idVozilo, Izposojevalnica_idIzposojevalnica, datum_od , datum_do, Uporabnik_idUporabnik ) values ('"+idAvto+"','1','"+datum1 +"','"+datum2+"','"+rs.getInt("idUporabnik")+"') ");
		break;
		}
		
		return povezava;
	}
	
	public static boolean check(String datum1,String datum2,String upoime ,String idAvto) throws SQLException {
	    
		Connection conn = DriverManager.getConnection("jdbc:mysql://164.8.251.196:3306/p12015rentacar", "p12015rentacar", "gp12015rentacar");

		try{
	    Statement st = conn.createStatement();
	    ResultSet rs;
	    rs= st.executeQuery("select COUNT(Vozilo_idVozilo) from izposoja  where  Vozilo_idVozilo='" + idAvto + "' and datum_od between '"+datum1 +"' and '"+datum2+"'; ");
        
	   // select COUNT(*) from tabela where datum between 1.1.2015 and 1.1.2016	 
	    
	    // èe je datum izposoje torej leto dan in mesec izposoje med e zapisanim rangom datuma pol se izpie true in èe se izpie true pomeni da je zaseden avto
	    
	    
		    Statement st1 = conn.createStatement();
		    
		    rs= st1.executeQuery("select Vozilo_idVozilo from izposoja  where  Vozilo_idVozilo='" + idAvto + "' and datum_od between '"+ datum1+"' and '"+datum2+"' OR datum_do between '"+ datum1+"' and '"+datum2+"' ; ");

	    	if (!rs.next())
	    		return true;
	    	
	    
	    	
	    	
	    }finally{
	    	conn.close();
	    }
	    
		return false;
		
	}
}
