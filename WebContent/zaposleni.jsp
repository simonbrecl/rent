<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
</head>
<body id="zaposleniBody"> 
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span><hr></h1>
		</div>
	</div>
		<a href="odlocitev.jsp">
			<h2>Osebna vozila</h2>
			<img src="slike/osebna.jpg" alt ="osebna" ismap>
			<h2>Dostavna vozila</h2>
			<img src="slike/dostavna.jpg" alt ="dostavna" ismap>
			<h2>Luksuzna vozila</h2>
			<img src="slike/luksuzna.jpg" alt ="luksuzna" ismap>
			<h2>Elektricna vozila</h2>
			<img src="slike/elektricna.jpg" alt ="elektricna" ismap>
		</a>
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