<%@ page import ="java.sql.*" %>
<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Rent a car</title>
	<link rel="stylesheet" type="text/css" media="screen" href="stili.css" />
	<link rel="stylesheet" type="text/css" media="all" href="jsDatePick_ltr.min.css" />
	<script type="text/javascript" src="jsDatePick.min.1.3.js"></script>
	<script type="text/javascript">
		window.onload = function(){
			new JsDatePick({
				useMode:2,
				target:"inputField1",
				dateFormat:"%Y-%M-%d"
			});
		
			new JsDatePick({
				useMode:2,
				target:"inputField2",
				dateFormat:"%Y-%M-%d"
			});
		};
	</script>
</head>
<body>
<div id="vsebnik">
	<div id="uvod">
		<div id="glavastrani">
			<h1><span>RENT A CAR</span></h1>
			
		</div>
	</div>
	
	<% if (session.getAttribute("upoime")==null)
	{
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Niste prijavljeni');");
		   out.println("location='prijava.jsp';");
		   out.println("</script>");
		   
		}
	
	
	%>
	<div id="besedilo1">
			<div id="razlaga">
			<h3><span>Izbira datuma</span></h3>
			<p class="p1"><span>Izberite datum izposoje in datum vračila vozila. </span></p>
			<form method="post" action="potrdilo2.jsp" >
			
            <table cellpadding="3">
            	 
				<thead>
                    <tr>
                        <th colspan="2">Rezervacija avtomobila</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Datum izposoje:</td>
                        <td><input type="text" name="datum1" value="" id="inputField1" /></td>
                    </tr>
                    <tr>
                        <td>Datum vrnitve:</td>
                        <td><input type="text" name="datum2" value="" id="inputField2" /></td>
                    </tr>
                    
                    <tr>	  
                        <td><input type="hidden" name ="idVozilo" value = "<%out.print(request.getParameter("id"));%>"/>
                     
                        <input type="submit" value="Rezerviraj avto" /></td>              
                    </tr>
                   
                </tbody>
            </table>
        </form>
        <form method="post" action="izpisZaPDF.jsp" >
        <input type="hidden" name ="idVozilo" value = "<%out.print(request.getParameter("id"));%>"/>
        </form>
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
