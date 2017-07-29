<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>
<%@page import="java.security.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		
			<a href="vozila.jsp">
			<h2>Osebna vozila</h2>
			<img src="slike/osebna.jpg?" alt ="osebna" ismap >
			<h2>Dostavna vozila</h2>
			<img src="slike/dostavna.jpg" alt ="dostavna" ismap>
			<h2>Luksuzna vozila</h2>
			<img src="slike/luksuzna.jpg" alt ="luksuzna" ismap>
			<h2>Električna vozila</h2>
			<img src="slike/elektricna.jpg" alt ="elektricna" ismap>
			
		</a>
		<div id="noga">
		© 2015 Simon Brecl, Aljaž Vodeb, Gašper Podergajs, Luka Horvatič
		</div>
	
	<div id="seznam1">
		<div id="seznam2">
			<div id="izbira">
				<ul>
					<li><a href="index.jsp">Domov</a></li>
					<li><a href="onas.jsp">O nas</a></li>
					<li><a href="galerija.jsp">Galerija</a></li>
					<li><a href="vozila.jsp">Vozila</a></li>			
									
	<%
		if (request.getParameter("odjava") != null) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	%>
	<%
		try {
			UporabnikDao ud = new UporabnikDao();
			if (request.getParameter("prijava") != null) {
				//kodiranje
				String geslo=request.getParameter("geslo");
				String kodiranoGeslo = null;
				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(geslo.getBytes());
				byte[] bytes = md.digest();
				StringBuilder sb = new StringBuilder();
				for(int i=0; i< bytes.length ;i++){
					sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
				}
				kodiranoGeslo = sb.toString();
				//konec kodiranja
				Uporabnik u = ud.select(request.getParameter("upoime"), kodiranoGeslo);
				session.setAttribute ("idUporabnik", Integer.toString (u.getId()));
				session.setAttribute("upoime", u.getUpoime());

		  		if(u.getUpoime().equals("ZAPOSLENI")){
		  			response.sendRedirect("zaposleni.jsp");
		  		}else{
					out.println("Prijavljeni ste kot: " + u.getUpoime());
					out.println("<a href='index.jsp?odjava'>Odjava</a>");
					out.println("<a href='profil.jsp'>Profil</a>");
		  		}
				

			}else if (session.getAttribute("upoime")!=null){
				
				out.println("Prijavljeni ste kot: " + session.getAttribute("upoime"));
				out.println("<a href='index.jsp?odjava'>Odjava</a>");
				out.println("<a href='profil.jsp'>Profil</a>");
				
			}else{
				%><li><a href="prijava.jsp">Prijava</a></li><%
			}
		} catch (Exception e) {
			out.println("Napačni podatki! <a href='prijava.jsp'>Ponoven vpis</a>");
		}
	%>
			</ul>
			</div>					
		</div>	
  </div>
 
</div>
</body>
</html>
