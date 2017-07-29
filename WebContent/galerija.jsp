<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Rent a car</title>
	<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
	<style>
	div.img {
	    margin: 5px;
	    padding: 5px;
	    border: 1px solid #ddd1a8;
	    height: auto;
	    width: auto;
	    float: left;
	    text-align: center;
	}
	
	div.img img {
	    display: inline;
	    margin: 5px;
	    border: 1px solid #ffffff;
	}
	
	div.img a:hover img {
	    border:1px solid #ddd1a8;
	}
	
	div.desc {
	    text-align: center;
	    font-weight: normal;
	    width: 120px;
	    margin: 5px;
	}
	</style>
</head>
<body>
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span><hr></hr></h1>
		</div>
	</div>
	<div id="besedilo1">
		<div class="img">
		  <a target="" href="slike/ena.jpg">
		    <img src="slike/ena.jpg" alt="poslovalnica 1" width="110" height="90">
		  </a>
		  <div class="desc">Poslovalnica Ljubljana</div>
		</div>
		<div class="img">
		  <a target="" href="slike/dva.jpg">
		    <img src="slike/dva.jpg" alt="poslovalnica 2" width="110" height="90">
		  </a>
		  <div class="desc">Poslovalnica Maribor</div>
		</div>
		<div class="img">
		  <a target="" href="slike/tri.jpg">
		    <img src="slike/tri.jpg" alt="Uprava" width="110" height="90">
		  </a>
		  <div class="desc">Uprava podjetja</div>
		</div>
		<br><br><br><br><br><br><br><br><br>
		</div>
		
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
