<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent a car</title>
<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<div id="vsebnik">
		<div id="uvod">
			<div id="glavastrani">
				<h1>
					<span>RENT A CAR<hr></span>
				</h1>
			</div>
		</div>
		<div id="besedilo1">
			<div id="razlaga">
				<h3>
					<span>Vozila na zalogi</span>
				</h3>
				<% if (session.getAttribute("upoime")==null){ %>
				Za najem morate biti prijavljeni.<br><br><%}%>
				Filtri iskanja: <br>
				Stevilo sedezev: <select id="sedezi" onchange="filter()">
				<option>Vsi</option>
				<option>2</option>
				<option>5</option>
				<option>7</option>
				<option>8</option>
				</select>
				<br>
				Tip: <select id="tip" onchange="filter2()">
				<option>Vsi</option>
				<option>Osebni</option>
				<option>Kombi</option>
				<option>Enoprostorec</option>
				<option>Elektricni</option>
				<option>Limuzina</option>
				<option>Luksuzni</option>
				</select>
				<br>
				<button onclick="razveljavi()">Razveljavi</button>
				<br>
				
				
				<table align="center">
				<form method="post" action="rezervacija.jsp">
					<tr class="Limuzina 5">
						<td><a><img src="slike/BMW-M550d-xDrive-Touring.png" alt="BMW M550d xDrive Touring" width="300" height="200"></a></td>
						<td><h4>BMW M550d xDrive Touring</h4>
						<h5>ali podobno</h5>
						Tip: Limuzina<br />
						Število sedežev: 5<br /> 
						Število vrat: 5<br />
						Poraba po ECE, mešan cikel:5,3l/100km<br />
						Cena: 14,90 €</td>
						<td><input type="hidden" value ="1" name="id">
						<input type="submit" value="Rezerviraj"></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Enoprostorec 7">
						<td><a><img src="slike/Volkswagen-Sharan.png" alt="Volkswagen Sharan 2.0 TDI BMT (103 kW) Highline Sky" width="300" height="200"></a></td>
						<td><h4>Volkswagen Sharan 2.0 TDI BMT (103 kW) Highline Sky</h4>
						<h5>ali podobno</h5>
						Tip: Enoprostorec<br />
						Število sedežev: 7<br /> 
						Število vrat: 5<br />
						Poraba po ECE, mešan cikel: 5,5l/100km<br />
						Cena: 12,50 €</td>
						<td><input type="hidden" value ="2" name="id">
						<input type="submit" value="Rezerviraj"></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Kombi 8">
						<td><a><img src="slike/Citroen-Jumper-Seduction.png" alt="Citroën Jumper 33 L2H2 HDi 150 Seduction" width="300" height="200"></a></td>
						<td><h4>Citroën Jumper 33 L2H2 HDi 150 Seduction</h4>
						<h5>ali podobno</h5>
						Tip: Kombi<br /> 
						Število sedežev: 8<br />
						Število vrat: 5<br />
						Poraba po ECE, mešan cikel: 7,0l/100km<br /> 
						Cena: 13,00 €</td>
						<td><input type="hidden" value ="3" name="id">
						<input type="submit" value="Rezerviraj"/></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Osebni 5">
						<td><a><img src="slike/Mini-Countryman-Cooper.jpg" alt="Mini Countryman Cooper SD All4" width="300" height="200"></a></td>
						<td><h4>Mini Countryman Cooper SD All4</h4>
						<h5>ali podobno</h5>
						Tip: Osebni<br /> 
						Število sedežev: 5<br />
						Število vrat: 5<br /> 
						Poraba po ECE, mešan cikel: 4,9l/100km<br /> 
						Cena: 9,90 €</td>
						<td><input type="hidden" value ="4" name="id">
						<input type="submit" value="Rezerviraj"/></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Osebni 5">
						<td><a><img src="slike/Toyota-Aygo.jpg" alt="Toyota Aygo 1.0 VVT-i X-Cite" width="300" height="200"></a></td>
						<td><h4>Toyota Aygo 1.0 VVT-i X-Cite</h4>
						<h5>ali podobno</h5>
						Tip: Osebni<br /> 
						Število sedežev: 5<br /> 
						Število vrat: 5<br /> 
						Poraba po ECE, mešan cikel: 4,1l/100km<br />
						Cena: 7,50 €</td>
						<td><input type="hidden" value ="5" name="id">
						<input type="submit" value="Rezerviraj"/></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Elektricni 5">
						<td><a><img src="slike/Tesla-Model-S.png" alt="Tesla Model S" width="300" height="200"></a></td>
						<td><h4>Tesla Model S</h4>
						<h5>ali podobno</h5>
						Tip: Električni<br /> 
						Število sedežev: 5<br /> 
						Število vrat: 5<br /> 
						Cena: 17,50 €</td>
						<td><input type="hidden" value ="6" name="id">	
						<input type="submit" value="Rezerviraj"/></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Luksuzni 2">
						<td><a><img src="slike/Audi-R8.png" alt="Audi R8" width="300" height="200"></a></td>
						<td><h4>Audi R8</h4>
						<h5>ali podobno</h5>
						Tip: Luksuzni<br /> 
						Število sedežev: 2<br /> 
						Število vrat: 2<br /> 
						Poraba po ECE, mešan cikel: 14,2l/100km<br />
						Cena: 22,50 €</td>
						<td><input type="hidden" value ="7" name="id">
						<input type="submit" value="Rezerviraj"></td>
					</tr>
					</form>
					<form method="post" action="rezervacija.jsp">
					<tr class="Enoprostorec 7">
						<td><a><img src="slike/Renault-Espace.png" alt="Renault Espace" width="300" height="200"></a></td>
						<td><h4>Renault Espace</h4>
						<h5>ali podobno</h5>
						Tip: Enoprostorec<br /> 
						Število sedežev: 7<br /> 
						Število vrat: 5<br /> 
						Poraba po ECE, mešan cikel: 6,1l/100km<br />
						Cena: 17,50 €</td>
						<td><input type="hidden" value ="8" name="id">
						<input type="submit" value="Rezerviraj"></td>
					</tr>
					</form>
				</table>
				
				
				<div id="noga">© 2015 Simon Brecl, Aljaž Vodeb, Gašper Podergajs, Luka Horvatič</div>
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
<script>
	function filter() {
		var sedezi = document.getElementById("sedezi").value;
		$('tr').each(function() {                                                                                                                            
			if(!$(this).hasClass(sedezi)) {
				$(this).css("display", "none");
			}                                                                                                                                    
		});
	}
	
	function filter2() {
		var tip = document.getElementById("tip").value;
		$('tr').each(function() {                                                                                                                            
			if(!$(this).hasClass(tip)) {
				$(this).css("display", "none");
			}                                                                                                                                    
		});
	}
	
	function razveljavi() {
		$('tr').each(function() {                                                                                                                            
		     $(this).css("display", "");                                                                                                                                       
		});
		document.getElementById("sedezi").selectedIndex = 0;
		document.getElementById("tip").selectedIndex = 0;
	}
</script>
</html>