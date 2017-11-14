

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
                                     
					<h1>Compare Analysis</h1>
                                   
         <form action="compare.jsp" method="post">
    
             <h3>From</h3><center><select name="tselect">
    
    
<% 
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    //String email=request.getParameter("emailid");

PreparedStatement ps2=con.prepareStatement("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='test'");
ResultSet rs2,rs3;

rs2=ps2.executeQuery();
while(rs2.next())
{
    String option=rs2.getString("TABLE_NAME");
    %>
    
<option><%=option%></option>
    
<%}%>
    </select> 
    <br>

<h3>To</h3> <select name="tselect1">
 <%   

rs3=ps2.executeQuery();
while(rs3.next())
{
    String option1=rs3.getString("TABLE_NAME");
%>


    <option><%=option1%></option>
   <%}%>
</select>
             </center>
<br>
<input type="submit" value="Calculate">
    </form>
                                </div></div></div>
    </body>
</html>
