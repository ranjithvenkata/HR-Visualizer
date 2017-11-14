<%-- 
    Document   : selecttable
    Created on : Feb 25, 2016, 7:18:09 PM
    Author     : Ranjith Dontamsetti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<link href="css/logincss.css" rel="stylesheet" type="text/css"/>        
    </head>
    <body>
        
        <div class="main">
                    
			<div class="main-info">
				
				<div class="main-info1">
					<h3>Load Table</h3>
         <form action="form.jsp" method="post">
    
    <select name="tselect">
    
    
<% 
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    //String email=request.getParameter("emailid");

PreparedStatement ps2=con.prepareStatement("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='test'");
ResultSet rs2;

rs2=ps2.executeQuery();
while(rs2.next())
{
    String option=rs2.getString("TABLE_NAME");
    %>
    
<option><%=option%></option>
    
<%}%>
    </select> 
    <br>
    <br>
<input type="submit" value="Load Table">
    </form>
                                </div></div></div>
    </body>
</html>
