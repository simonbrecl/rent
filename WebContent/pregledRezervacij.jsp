<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
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
				<h1>
					<span>RENT A CAR</span>
					<hr>
				</h1>
			</div>
		</div>

		<div id="besedilo1">
			<div id="razlaga">
				<h3>
					<span>Pregled rezervacij</span>
				</h3>
				<ul>
					<%
						UporabnikDao ud = new UporabnikDao();

						if (request.getParameter("izbrisi") != null) {
							int id = Integer.parseInt(request.getParameter("izbrisi"));
							ud.delete(id);
						}
						
						if (request.getParameter("vnos") != null) {
							ud.insert(new Uporabnik(request.getParameter("ime"), request.getParameter("priimek"), 0));
						}
					%>
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th>Ime</th>
								<th>Priimek</th>
								<th>Uporabniško ime</th>
								<th>Telefon</th>
								<th>Geslo</th>
							</tr>
						</thead>
						<tbody>
							<%for (Uporabnik u : ud.select()) {%>
							<tr>
								<td><%=u.getId()%></td>
								<td><%=u.getIme()%></td>
								<td><%=u.getPriimek()%></td>
								<td><%=u.getUpoime()%></td>
								<td><%=u.getTelefon()%></td>
								<td><%=u.getGeslo()%></td>

								<td><a href="pregledRezervacij.jsp?izbrisi=<%=u.getId()%>">Odstrani</a></td>
							</tr>
						</tbody>
						<%}%>
					</table>
				</ul>
			</div>
		</div>
		<div id="noga">© 2015 Simon Brecl, Aljaž Vodeb, Gašper Podergajs, Luka Horvatič</div>

		<div id="seznam1">
			<div id="seznam2">
				<div id="izbira">
					<ul>
						<li><a href="zaposleni.jsp">Domov</a></li>
						<li><a href="odlocitev.jsp">Izposoja</a></li>
						<li><a href="pregledIzposoj.jsp">Pregled izposoj</a></li>
						<li><a href="pregledRezervacij.jsp">Pregled rezervacij</a></li>

						<%
							if (session.getAttribute("upoime") != null) {
								out.println("Prijavljeni ste kot: " + session.getAttribute("upoime"));
								out.println("<a href='index.jsp?odjava'>Odjava</a>");

							} else {
								%><li><a href="prijava.jsp">Prijava</a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</div>

	</div>
</body>
</html>