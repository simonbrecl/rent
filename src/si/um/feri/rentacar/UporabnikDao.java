package si.um.feri.rentacar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UporabnikDao {
	
	private Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/baza");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Uporabnik> select() throws Exception {
		List<Uporabnik> ret=new ArrayList<Uporabnik>();
		Connection conn=getConnection();
		try {
			
			ResultSet rs=conn.createStatement().executeQuery("select * from uporabnik");
			while (rs.next()) {
				Uporabnik u=new Uporabnik(rs.getString("ime"),rs.getString("priimek"),rs.getString("upoime"),rs.getString("telefon"),rs.getString("geslo"),rs.getInt("idUporabnik"));
				ret.add(u);
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return ret;
	}
	
	public Uporabnik select(String upoime, String geslo) throws Exception {
		Uporabnik upo=null;
		Connection conn=getConnection();
		try {	
			PreparedStatement ps=conn.prepareStatement("select * from uporabnik where upoime=? and geslo=?");
			ps.setString(1, upoime);
			ps.setString(2, geslo);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				upo=new Uporabnik(rs.getString("ime"),rs.getString("priimek"),rs.getString("upoime"),rs.getString("telefon"),rs.getString("geslo"),rs.getInt("idUporabnik"));
				break;
			}
			rs.close();
			
		} finally {
			conn.close();
		}
		return upo;
	}
	
	public void delete(int id) throws Exception {
		Connection conn=getConnection();
		try {

			PreparedStatement ps=conn.prepareStatement("delete from uporabnik where idUporabnik=?");
			ps.setInt(1, id);
			ps.executeUpdate();

		} finally {
			conn.close();
		}
	}
	
	public void insert(Uporabnik u) throws Exception {
		Connection conn=getConnection();
		try {
			if(!u.getIme().equals("") && !u.getPriimek().equals("") && !u.getUpoime().equals("") && !u.getTelefon().equals("") && !u.getGeslo().equals("")){
				PreparedStatement ps=conn.prepareStatement("insert into uporabnik(ime , priimek, upoime, telefon, geslo) values (?,?,?,?,?)");
				ps.setString(1, u.getIme());
				ps.setString(2, u.getPriimek());
				ps.setString(3, u.getUpoime());
				ps.setString(4, u.getTelefon());
				ps.setString(5, u.getGeslo());
				ps.executeUpdate(); 
    		} 
		} finally {
			conn.close();
		}
	}
	
	public boolean check(Uporabnik u) throws Exception {
		Connection conn=getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("select upoime from uporabnik where upoime=?");  
            ps.setString(1, u.getUpoime());  
            ResultSet rs = ps.executeQuery();  
            if (!rs.next())  
    			return true;
		} finally {
			conn.close();
		}
		return false;
	}

}