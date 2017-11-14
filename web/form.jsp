<%-- 
    Document   : form
    Created on : Feb 16, 2016, 9:36:16 PM
    Author     : Ranjith Dontamsetti
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
<link href="css/table_1.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        
        
        
        
        
        
        <form action="change.jsp" method="post">

            <h2>Please Specify the Type for each of the employees. To help us proceed to generate a report.</h2>
<div align="center"><input type="submit" value="Submit"> 
    
    
 <table border="1" width="1200" height="172">    
    <tr><th>EMPLOYEE ID</th><th>FIRST NAME</th><th>MIDDLE NAME</th><th>LAST NAME</th><th>TYPE</th></tr> 
    
    
<% 
    String table=request.getParameter("tselect");
    session.setAttribute("tablename",table);
      if(table!=null)
      {
 String sql="select employee_id,first_name,middle_name,last_name,Type from"+" "+table;

Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement(sql);


ResultSet rs;

rs = ps.executeQuery();
  while(rs.next())
  {
      String EMPID=rs.getString("employee_id");
      String FNAME = rs.getString("first_name");
	String MNAME=rs.getString("middle_name");
        String LNAME=rs.getString("last_name");
        String type=rs.getString("Type");
	
%>

   
  <td><b><font color='#663300'><%=EMPID%></font></b></td>
<td><b><font color='#663300'><%=FNAME%></font></b></td>
<td><b><font color='#663300'><%=MNAME%></font></b></td>
<td><b><font color='#663300'><%=LNAME%></font></b></td>
<td><input type="radio" name=<%=EMPID%> value="FF" checked>Full-time Faculty
<input type="radio" name=<%=EMPID%> value="VFM">Visiting Faculty>1y
<input type="radio" name=<%=EMPID%> value="VFL">Visiting Faculty<1y
<input type="radio" name=<%=EMPID%> value="AF">Adjunct Faculty</td>
</tr>
<%
  }}
 %>
 </table>
 
 </div></form>
                                
      
      
      
    </body>
</html>
