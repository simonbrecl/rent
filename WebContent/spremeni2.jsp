<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
</head>
<body>
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span><hr></h1>
		</div>
	</div>
		 <b></b> Posodobi podatke: <br></b>
			<form action="spremeni2.jsp">
		 	 Ime: <input type="text" name="ime"><br>
		 	 Priimek: <input type="text" name="priimek"><br>
		 	 Telefon: <input type="text" name="telefon"><br><br>
		 	 Uporabniško ime: <input type="text" name="upoime"><br>
		 	 Geslo: <input type="text" name="geslo"><br>
		  <input type="submit" value="Posodobi">
		</form>
		<%
		UporabnikDao ud = new UporabnikDao();
	
		if(!request.getParameter("ime").equals("") && !request.getParameter("priimek").equals("") && !request.getParameter("upoime").equals("") && !request.getParameter("telefon").equals("") && !request.getParameter("geslo").equals("")){
			ud.insert(new Uporabnik(request.getParameter("ime"),request.getParameter("priimek"),request.getParameter("upoime"),Integer.parseInt(request.getParameter("telefon")),request.getParameter("geslo"),0));
			out.println("Posodobitev uspela. Ponovno se prijavite!");
		}
			else {
				out.println("Posodobitev ni uspela");
		}
	%>
		<div id="noga">
		© 2015 Simon Brecl, Aljaz Vodeb, Gasper Podergajs, Luka Horvatic
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
