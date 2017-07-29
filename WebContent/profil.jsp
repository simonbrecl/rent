<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
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
		 <%  	
		    String upoime = request.getParameter("upoime");  
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://164.8.251.196:3306/p12015rentacar", "p12015rentacar", "gp12015rentacar");
		    Statement st = con.createStatement();
		    ResultSet rs;
		    ResultSet rst;
		    rs = st.executeQuery("select * from Uporabnik where idUporabnik = "+session.getAttribute("idUporabnik"));
		    while (rs.next()) {
		    	%>
		    	Vaši podatki: <br>
		<form action="spremeni.jsp">
		 	 Ime: <input type="text" name="ime" value = "<%out.println(rs.getString("ime"));%>"><br>
		 	 Priimek: <input type="text" name="priimek" value ="<%out.println(rs.getString("priimek")); %>"><br>
		 	 Telefon: <input type="text" name="telefon" value = "<%out.println(rs.getString("telefon")); %>"><br><br>
		 	 Uporabniško ime: <input type="text" name="upoime" value = "<%out.println(rs.getString("upoime")); %>"><br>
		 	 Geslo: <input type="text" name="geslo" value = "<%out.println(rs.getString("geslo")); %>"><br>
  		<input type="submit" value="Spremeni">
	</form>
	
   <% }%>
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
