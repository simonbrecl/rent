<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@page import="si.um.feri.rentacar.UporabnikDao"%>
<%@page import="si.um.feri.rentacar.Uporabnik"%>
<%@page import="si.um.feri.rentacar.RezervacijaDao" %>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %> 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rent a car</title>
</head>
<body>

<% Class.forName("com.mysql.jdbc.Driver"); %>

<%
    Connection con = DriverManager.getConnection("jdbc:mysql://164.8.251.196:3306/p12015rentacar", "p12015rentacar", "gp12015rentacar");
    Statement st = con.createStatement();
    
	
    String upoime =(String)session.getAttribute("upoime");
    request.getSession().getAttribute("upoime");
    ResultSet rs;
    /*System.out.print(upoime);*/
    /*System.out.print(st.executeQuery("select idUporabnik from Uporabnik where  Upoime='" + request.getSession().getAttribute("upoime") + "'"));*/
    rs = st.executeQuery("select idUporabnik from Uporabnik where  Upoime='" + upoime + "'");
	
   
   	String datum_do = (String)request.getParameter("datum2");
    String datum_od= (String)request.getParameter("datum1");
	//String idAvto = (String)request.getParameter("id");
	
	
	
   
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date1 = formatter.parse(datum_od);
	Date date2 = formatter.parse(datum_do);
    
    if (request.getSession(false)!=null){
    	
    	while(rs.first()){
        	
    		String idAvto =request.getParameter("idVozilo");
    		
    		
    		if(RezervacijaDao.check(datum_od,datum_do,upoime,Integer.parseInt(idAvto)) == true){
    				if(date1.after(date2)){
    					%><script>alert("Narobe vnešen datum!");</script><% 
    					response.setHeader("Refresh", "0.5;url=vozila.jsp");
    					break;
    				}else{
    					
    					RezervacijaDao.Rezervacija(datum_od,datum_do,upoime,Integer.parseInt(idAvto));
    				}
    		 %> 
    		 
    		 
    		 <script>
    		
         		alert("Avto je bil najet!");
         	
             
            
         	   </script>
         	   <% response.setHeader("Refresh", "0.5;url=izpisZaPDF.jsp"); %>
         	   <input type="hidden" name="idVozilo" value = "<%out.println(request.getParameter("idVozilo"));%>"/>
         	   </form>
    		<% }else if(RezervacijaDao.check(datum_od,datum_do,upoime,Integer.parseInt(idAvto)) != true){ %>
    			
    			<script>
    		alert("Avto je med tem datumom ze zaseden");
    		<% response.setHeader("Refresh", "0.5;url=vozila.jsp"); %>
          </script>
            
    	<% }break;} %>
    	
   <%  }else if (request.getSession(false)==null){ %>
  			  	
  		<script>
    	alert("Niste prijavljeni!");
    	
    	<% response.setHeader("Refresh", "0.5;url=izposoja.jsp"); %>
    	</script>
  			  	
  			


    				
    <% } %>
</body>
</html>