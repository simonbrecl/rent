<%@page import="si.um.feri.rentacar.RezervacijaDao" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
</head>
<body>
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span><hr></hr></h1>
		</div>
	</div>

	<div id="besedilo1">
			<div id="razlaga">
			<h3><span>Izpis naročila</span></h3>
		<span>Preglejte naročilo. Natisnjen voucher prinesite v našo poslovalnico.</span>
		</div>
		<div id="izpisek">
		<span> <%   
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://164.8.251.196:3306/p12015rentacar", "p12015rentacar", "gp12015rentacar");
		ResultSet rs=conn.createStatement().executeQuery("select * from rezervacija");
		//ResultSet rs1=conn.createStatement().executeQuery("");
		rs.afterLast();
		while(rs.previous()){
			
			
			ResultSet rs3=conn.createStatement().executeQuery("select model,znamka from vozilo where idVozilo='"+rs.getInt("Vozilo_idVozilo")+"'  ");
			
			while(rs3.next()){
				String znamka = rs3.getString("znamka");
				%><br><%out.print("Znamka: ");%><b>
				<%out.print(znamka);%></b><br><%
				
				String model = rs3.getString("model");
				out.print("Model avta: ");%><b>
				<%out.print(model);%></b>
				<br> <%
			}
			
			ResultSet rs2=conn.createStatement().executeQuery("select Priimek,Ime from uporabnik where Upoime='"+session.getAttribute("upoime")+"'  ");
			
			while(rs2.next()){
				
				String ime = rs2.getString("Ime");
				String priimek = rs2.getString("Priimek");
				%><br> <% out.println("Ime: "+ime);%><% 
				%><br> <% out.println("Priimek: "+priimek);%><% 
				
				continue;
			}
			
			
			int idVozilo = rs.getInt("Vozilo_idVozilo");
			String datum_od = rs.getString("datum_od");
			String datum_do = rs.getString("datum_do");
			
			int idRezervacija = rs.getInt("idRezervacija");
			int idUporabnik = rs.getInt("Uporabnik_idUporabnik");
			%><br> <% out.println("Datum prevzema: ");%><b><% 
			out.println(datum_od);
			%><br></b> <%out.println("Datum vracila: ");%><b><% 
			out.println(datum_do);
			%><br></b> <%out.println("ID uporabnika: "+idUporabnik);%><% 
			%><br> <%out.println("ID rezervacije: "+idRezervacija);%><%
			%><br> <%out.println("ID avta: "+idVozilo);%><%
			
			ResultSet rs1 = conn.createStatement().executeQuery("select Cena_na_dan from cenik where idCenik ='"+idVozilo+"' ");
			while(rs1.next()){
			
			double cena = rs1.getDouble("Cena_na_dan");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = formatter.parse(datum_od);
			Date date2 = formatter.parse(datum_do);
			
			RezervacijaDao.znesek(datum_od,datum_do,RezervacijaDao.select2(idVozilo));
		
			int razlika=0;
			long diff =date2.getTime()- date1.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000)+2;
			razlika = (int) diffDays;
			
			%><br><br> <%out.println("Stevilo dni izposoje: "+(razlika-2));%><% 
			
			
			%><br> <%out.print("Skupna cena: ");%><b><% 
			out.print(RezervacijaDao.znesek(datum_od,datum_do,RezervacijaDao.select2(idVozilo))+" evrov"); %></b><% 
			break;
			}
			
			break;
		}
		
		%>
		</span>
		</div>	
		<br><form method="get" action="index.jsp">
    	<button type="submit">Domov</button>
		</form>
		<div id="noga">
		© 2015 Simon Brecl, Aljaž Vodeb, Gašper Podergajs, Luka Horvatič
		</div>
	</div>
	<div id="seznam1">
		<div id="seznam2">
			<div id="izbira">
				<ul>
					<li><a href="index.jsp">Domov</a></li>
					<li><a href="onas.jsp">O nas</a></li>
					<li><a href="galerija.jsp">Galerija</a></li>
					<li><a href="vozila.jsp">Vozila</a></li>
					
					<% if (session.getAttribute("upoime")!=null){
				
						out.println("Prijavljeni ste kot: " + session.getAttribute("upoime"));
						out.println("<a href='index.jsp?odjava'>Odjava</a>");
						out.println("<a href='profil.jsp'>Profil</a>");
				
					}else{
						%><li><a href="prijava.jsp">Prijava</a></li><%
					}%>
				</ul>
			</div>		
		</div>	
  </div>
</div>
</body>
</html>