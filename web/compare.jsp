<%-- 
    Document   : compare
    Created on : Feb 25, 2016, 9:50:05 PM
    Author     : Ranjith Dontamsetti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="bar2.html"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/logincss.css" rel="stylesheet" type="text/css"/> 
    </head>
    <body>
        
        <% 
    String table1=request.getParameter("tselect");
    String table2=request.getParameter("tselect1");
    
 if(table1!=null && table2!=null)
      {
          String sql="select count(employee_id) FROM "+table1+" WHERE employee_id NOT IN(SELECT employee_id FROM "+table2+")";


Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    //String email=request.getParameter("emailid");
PreparedStatement ps3=con.prepareStatement(sql);

ResultSet rs3;
String result=null;
rs3 = ps3.executeQuery();
  if(rs3.next())   
  {
      result=rs3.getString(1);
  }
  
	
%>
<div class="main">
                    
			<div class="main-info">
				
				<div class="main-info1">
					<h3>Result</h3>
                                        <h2><font color="black"> No of Employees Resigned:</h2> <%=result%></font>
                                </div>
                        </div>
</div>
<% }
else{
%>
Tables entered not correct.Please try Again
<%}%>
     
     

    </body>
</html>
