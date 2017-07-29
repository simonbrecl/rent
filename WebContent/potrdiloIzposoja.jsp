<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>
<%@page import="si.um.feri.rentacar.IzposojaDao"%>
<%@page import="si.um.feri.rentacar.Izposoja"%>
<%@page import="si.um.feri.rentacar.RacunDao"%>
<%@page import="si.um.feri.rentacar.Racun"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
</head>
<body id="zaposleniBody">
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span></h1>
		</div>
	</div>

	<div id="besedilo1">
			<div id="razlaga">
			<h3><span>Izposoja</span></h3>
			 <ul>
	<%
		UporabnikDao ud = new UporabnikDao();
		IzposojaDao id = new IzposojaDao();
		RacunDao rd = new RacunDao();
			int st_dni = id.st_dni(request.getParameter("datum1"), request.getParameter("datum2"));
			double cena_na_dan = id.select2(Integer.parseInt(request.getParameter("idVozilo")));
			double znesek = cena_na_dan*st_dni;
			if (request.getParameter("izposoja1") != null) {
				if(!request.getParameter("idVozilo").equals("") && !request.getParameter("datum1").equals("")  && !request.getParameter("datum2").equals("")  && !request.getParameter("ime").equals("") && !request.getParameter("priimek").equals("")  && !request.getParameter("telefon").equals("")){
					if(ud.check2(new Uporabnik(request.getParameter("ime"),request.getParameter("priimek"),Integer.parseInt(request.getParameter("telefon")),0))==true){
						ud.insert(new Uporabnik(request.getParameter("ime"),request.getParameter("priimek"),Integer.parseInt(request.getParameter("telefon")),0));
						Uporabnik u = ud.select2(request.getParameter("ime"),request.getParameter("priimek"),request.getParameter("telefon"));
						id.insert(new Izposoja(0,Integer.parseInt(request.getParameter("idVozilo")),1,request.getParameter("datum1"),request.getParameter("datum2"),u.getId()));
					}else{
						Uporabnik u = ud.select2(request.getParameter("ime"),request.getParameter("priimek"),request.getParameter("telefon"));
						id.insert(new Izposoja(0,Integer.parseInt(request.getParameter("idVozilo")),1,request.getParameter("datum1"),request.getParameter("datum2"),u.getId()));
					}
					out.println("Izposoja je uspela. Cena storitve: " + znesek+ " € <a href='zaposleni.jsp'>Nazaj</a>");
				}else
					out.println("Nepopolni podatki <a href='odlocitev.jsp'>Poizkusi ponovno</a>");
			}else {
				id.insert(new Izposoja(0,Integer.parseInt(request.getParameter("idVozilo")),1,request.getParameter("datum1"),request.getParameter("datum2"), Integer.parseInt(request.getParameter("uporabnik"))));	
				out.println("Izposoja je uspela. Cena storitve: " + znesek + " € <a href='zaposleni.jsp'>Nazaj</a>");
			}
	%>
          </ul>
		<div id="noga">
		© 2015 Simon Brecl, Aljaž Vodeb, Gašper Podergajs, Luka Horvatič
		</div>
	
	<div id="seznam1">
		<div id="seznam2">
			<div id="izbira">
				<ul>
					<li><a href="zaposleni.jsp">Domov</a></li>
					<li><a href="odlocitev.jsp">Izposoja</a></li>
					<li><a href="pregledIzposoj.jsp">Pregled izposoj</a></li>
					<li><a href="pregledRezervacij.jsp">Pregled rezervacij</a></li>				
									
			<% if (session.getAttribute("upoime")!=null){
				
				out.println("Prijavljeni ste kot: " + session.getAttribute("upoime"));
				out.println("<a href='index.jsp?odjava'>Odjava</a>");
				
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