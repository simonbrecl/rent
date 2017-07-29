<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>
<%@ page import="java.security.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
</head>
<body>
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span></h1>
		</div>
	</div>

	<div id="besedilo1">
			<div id="razlaga">
			<h3><span>Registriraj se</span></h3>
			 <ul>
	<%
		UporabnikDao ud = new UporabnikDao();
		try{
			if(!request.getParameter("ime").equals("") && !request.getParameter("priimek").equals("") && !request.getParameter("upoime").equals("") && !request.getParameter("telefon").equals("") && !request.getParameter("geslo").equals("")){
				if(ud.check(new Uporabnik(request.getParameter("ime"),request.getParameter("priimek"),request.getParameter("upoime"),Integer.parseInt(request.getParameter("telefon")),request.getParameter("geslo"),0))==true){
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
					ud.insert(new Uporabnik(request.getParameter("ime"),request.getParameter("priimek"),request.getParameter("upoime"),Integer.parseInt(request.getParameter("telefon")), kodiranoGeslo,0));
					out.println("Registracija je uspela <a href='prijava.jsp'>Prijavi se</a>");
					}else
						out.println("Uporabniško ime je zasedeno <a href='registracija.jsp'>Poizkusi ponovno</a>");
				}else
					out.println("Nepopolni podatki <a href='registracija.jsp'>Poizkusi ponovno</a>");
			}catch(Exception e){
				out.println("Nepravilen vnos telefona <a href='registracija.jsp'>Poizkusi ponovno</a>");
			}
	%>
          </ul>
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
					<li><a href="prijava.jsp">Prijava</a></li>
				</ul>
			</div>		
		</div>	
  </div>
</div>
</body>
</html>