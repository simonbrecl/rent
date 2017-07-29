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
			<h1><span>RENT A CAR</span></h1>
		</div>
	</div>

	<div id="besedilo1">
			<div id="razlaga">
			<h3><span>Prijavite se</span></h3>
			 <ul>
            <form method="post" action="index.jsp">
            <table cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Prijava</th>
                    </tr>
                </thead>
                <tbody>
                   	 <tr>
                        <td>Uporabniško ime:</td>
                        <td><input type="text" name="upoime" value="" /></td>
                  	  </tr>
                  	  <tr>
                  	      <td>Geslo:</td>
                   	     <td><input type="password" name="geslo" value="" /></td>
                    </tr>
                    <tr>
                    	<td><input type="reset" value="Zbriši" /></td>
                        <td><input type="submit" name="prijava" value="Prijava" /></td>
                        
                    </tr>
                    <tr>
                       <td colspan="2">Nimate računa? <a href="registracija.jsp">Registriraj se</a></td>
                    </tr>
                </tbody>
            </table>
        </form>
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
