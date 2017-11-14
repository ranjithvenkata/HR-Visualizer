<%-- 
    Document   : change
    Created on : Feb 16, 2016, 10:43:39 PM
    Author     : Ranjith Dontamsetti
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="bar.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/table_1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    String table=String.valueOf(session.getAttribute("tablename"));
    if(table!=null)
    {
    String sql1="select employee_id from "+table;
        ResultSet rs1;
PreparedStatement ps1=con.prepareStatement(sql1);
rs1 = ps1.executeQuery();
//String[] values=request.getParameterValues("att");
int i; 
String empid,type,sql;
PreparedStatement st = null;
int k;
  while(rs1.next())
  {
      empid = rs1.getString("employee_id");
	type=request.getParameter(empid);
	sql = "UPDATE "+table+" set Type=? WHERE employee_id=?";
      st = con.prepareStatement(sql);
      
      
      st.setString(1,type);  // This would set type
      st.setString(2, empid); // This would set ID
      
      
      int rows = st.executeUpdate();    
    
 }
  
%>
Your entries have been changed successfully
<br>
Your Database:<br>
<table border="1" width="700" height="172">
    <tr><th>EMPLOYEE ID</th><th>FIRST NAME</th><th>MIDDLE NAME</th><th>LAST NAME</th><th>TYPE</th></tr>
<%
    String sql2="select employee_id,first_name,middle_name,last_name,Type from "+table;
PreparedStatement ps=con.prepareStatement(sql2);

ResultSet rs;
rs = ps.executeQuery();
  while(rs.next())
  {
      String EMPID=rs.getString("employee_id");
      String FNAME = rs.getString("first_name");
	String MNAME=rs.getString("middle_name");
        String LNAME=rs.getString("last_name");
	String TYPE=rs.getString("Type");
%>

  <td><b><font color='#663300'><%=EMPID%></font></b></td>
<td><b><font color='#663300'><%=FNAME%></font></b></td>
<td><b><font color='#663300'><%=MNAME%></font></b></td>
<td><b><font color='#663300'><%=LNAME%></font></b></td>
<td><b><font color='#663300'><%=TYPE%></font></b></td> 
</tr>
<%
  }}
else
{

 %>
 </table>
 <h3>Table was not Loaded. Please try after Loading Page</h3>
         <%}%>
         
    </body>
</html>
