<%-- 
    Document   : login
    Created on : Feb 24, 2016, 8:11:34 PM
    Author     : Ranjith Dontamsetti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    String id = request.getParameter("id");  
    //String name=request.getParameter("name");  
    String password = request.getParameter("password");
    if(id.equals("admin")&&password.equals("admin"))
    {response.sendRedirect("selecttable.jsp");
    } else {
        out.print("Invalid password <br><a href='login.html'>try again</a>");
    } %>
    </body>
</html>
