<%--
    Document   : diversity
    Created on : Feb 19, 2016, 4:48:02 PM
    Author     : Ranjith Dontamsetti
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.*,newpackage.CheckCountry" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="bar.html" %>


<!DOCTYPE html>
<head>
    <style>
table, th, td {
   border: 2px solid black;
}
table {
    border-collapse: collapse;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/table_1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
     String table=String.valueOf(session.getAttribute("tablename"));
    //String email=request.getParameter("emailid");
PreparedStatement ps=con.prepareStatement("select country_name from "+table+" where Type='FF' and `Dpmt.`='SERD'");
PreparedStatement ps2=con.prepareStatement("select country_name from "+table+" where Type='VFM' and `Dpmt.`='SERD'");
ResultSet rs,rs2;
rs = ps.executeQuery();
rs2=ps2.executeQuery();
CheckCountry serd=new CheckCountry();
String country=null;

while(rs.next())
{
country=rs.getString("country_name");
serd.check(country);
}
while(rs2.next())
{
country=rs2.getString("country_name");
serd.check(country);
}
ps=con.prepareStatement("select country_name from "+table+" where Type='FF' and `Dpmt.`='SET'");
ps2=con.prepareStatement("select country_name from "+table+" where Type='VFM' and `Dpmt.`='SET'");
rs = ps.executeQuery();
rs2=ps2.executeQuery();
CheckCountry set=new CheckCountry();
while(rs.next())
{
country=rs.getString("country_name");
set.check(country);
}
while(rs2.next())
{
country=rs2.getString("country_name");
set.check(country);
}

ps=con.prepareStatement("select country_name from "+table+" where Type='FF' and `Dpmt.`='SOM'");
ps2=con.prepareStatement("select country_name from "+table+" where Type='VFM' and `Dpmt.`='SOM'");
rs = ps.executeQuery();
rs2=ps2.executeQuery();
CheckCountry som=new CheckCountry();
while(rs.next())
{
country=rs.getString("country_name");
som.check(country);
}
while(rs2.next())
{
country=rs2.getString("country_name");
som.check(country);
}

CheckCountry ait=new CheckCountry();
ait.sea=som.sea+serd.sea+set.sea;
ait.ea=som.ea+serd.ea+set.ea;
ait.sa=som.sa+serd.sa+set.sa;
ait.rw=som.rw+serd.rw+set.rw;

double a1=(double)ait.sea/(ait.rw+ait.ea+ait.sa+ait.sea);
double b1=(double)ait.ea/(ait.rw+ait.ea+ait.sa+ait.sea);
double c1=(double)ait.sa/(ait.rw+ait.ea+ait.sa+ait.sea);
double d1=(double)ait.rw/(ait.rw+ait.ea+ait.sa+ait.sea);
int a=(int)Math.round(a1*100);
int b=(int)Math.round(b1*100);
int c=(int)Math.round(c1*100);
int d=(int)Math.round(d1*100);
int s=100;
  


        %>
<br>
        
<h2>Full Time Faculty and Visiting faculty > 1yr Report </h2>
<table>
    <tr>
        <td></td>
        <td><b>SERD</b></td>
        <td><b>SET</b></td>
        <td><b>SOM</b></td>
        <td><b>AIT</b></td>
    </tr>
    <tr>
        <td><b>Southeast Asia</b></td>
        <td><%=serd.sea%></td>
        <td><%=set.sea%></td>
        <td><%=som.sea%></td>
        <td><%=ait.sea%></td>
    </tr>
     <td><b>East Asia</b></td>
        <td><%=serd.ea%></td>
        <td><%=set.ea%></td>
        <td><%=som.ea%></td>
        <td><%=ait.ea%></td>
    </tr>
    <tr>
        <td><b>South Asia</b></td>
        <td><%=serd.sa%></td>
        <td><%=set.sa%></td>
        <td><%=som.sa%></td>
        <td><%=ait.sa%></td>
    </tr>
    <tr>
        <td><b>Rest of the World</b></td>
        <td><%=serd.rw%></td>
        <td><%=set.rw%></td>
        <td><%=som.rw%></td>
        <td><%=ait.rw%></td>
    </tr>
    <tr>
        <td><b>Total</b></td>
        <td><%=serd.rw+serd.ea+serd.sa+serd.sea%></td>
        <td><%=set.rw+set.ea+set.sa+set.sea%></td>
        <td><%=som.rw+som.ea+som.sa+som.sea%></td>
        <td><%=ait.rw+ait.ea+ait.sa+ait.sea%></td>
    </tr>
    <tr>
       
</table>

    <br>
    <br>
    <h3> Full time faculty diversity Report</h3>
      <table>
          <tr>
              <td><b>SE Asia(a)</b></td>
              <td><%=a%></td>
          </tr>
          
          <tr>
              <td><b>East Asia(b)</b></td>
              <td><%=b%></td>
          </tr>
          
          <tr>
              <td><b>South Asia(c)</b></td>
              <td><%=c%></td>
          </tr>
          
          <tr>
              <td><b>The Rest(d)</b></td>
              <td><%=d%></td>
          </tr>
          
          <tr>
              <td><b>Total(s)</b></td>
              <td>100</td>
          </tr>
          
          <tr>
              <td><strong>Div Index<strong></td>
              <td><%=4*Math.pow(0.25*s,2)/(Math.pow(a,2)+Math.pow(b,2)+Math.pow(c,2)+Math.pow(d,2))%></td>
          </tr>
      </table>
                  

   </body>
   </html>
    

