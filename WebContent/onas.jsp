<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Rent a car</title>
	<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
	<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script>
	var map;
	function initialize() {
	  var mapOptions = {
	    zoom: 18,
	    center: new google.maps.LatLng(46.558970, 15.638276)
	  };
	  map = new google.maps.Map(document.getElementById('map-canvas'),
	      mapOptions);
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
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
			<h3><span>Zakaj izbrati nas?</span></h3>
			<p class="p1"><span>Ker smo najboljši in ponujamo največ za vaš denar. </span></p>
		</div>
		<div id="kjesmo">
			<h3><span>Kje se nahajamo?</span></h3>
			<p class="p1"><span>V Ljubljani in Mariboru.</span></p>
			<div id="map-canvas" style="height:300px; width:500px"></div><br>
		<h3><span>Kontakt</span></h3>
		</div>
		<script language="javascript">var sa_email_id = '53723-720ad';var sa_sent_text = 'Hvala';</script>
		<script language="javascript" src="http://s1.smartaddon.com/sa_htmlform.js"></script>
		<div id="sa_contactdiv">
		<form name=sa_htmlform style="margin:0px" onsubmit="return sa_contactform()">
		<table>
		<tr><td>Ime:<br><input type="text" name="name" /></td></tr>
		<tr><td>E-mail:<br><input type="text" name="email" /></td></tr>
		<tr><td>Tema:<br><input type="text" name="subject" /></td></tr>
		<tr><td>Sporočilo: <span style="color:#D70000">*</span><br><textarea name="message" cols="42" rows="9" required="true"></textarea></td></tr>
		<tr><td><input type="submit" value="Pošlji" style="font-weight:bold"></td></tr>
		</table>
		</form></div>
		
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
