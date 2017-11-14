<%-- 
    Document   : generate.jsp
    Created on : Feb 17, 2016, 12:11:47 AM
    Author     : Ranjith Dontamsetti
--%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.awt.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.entity.*"%>
<%@ page import="org.jfree.data.general.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
table, th, td {
   border: 2px solid black;
}
table {
    border-collapse: collapse;
}
</style>

    </head>
    <body>
        
         
        <% 
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","isdm", "isdm");
    //String email=request.getParameter("emailid");
    String table=String.valueOf(session.getAttribute("tablename"));
PreparedStatement ps=con.prepareStatement("select count(*) from "+table+" where Type='FF' and `Dpmt.`='SET'");

ResultSet rs;
int ffset=0;
rs = ps.executeQuery();
rs.next();
ffset=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFM' and `Dpmt.`='SET'");

int vfmset=0;
rs = ps.executeQuery();
rs.next();
vfmset=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFL' and `Dpmt.`='SET'");

int vflset=0;
rs = ps.executeQuery();
rs.next();
vflset=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='AF' and `Dpmt.`='SET'");

int afset=0;
rs = ps.executeQuery();
rs.next();
afset=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='FF' and `Dpmt.`='SERD'");

int ffserd=0;
rs = ps.executeQuery();
rs.next();
ffserd=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFM' and `Dpmt.`='SERD'");

int vfmserd=0;
rs = ps.executeQuery();
rs.next();
vfmserd=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFL' and `Dpmt.`='SERD'");

int vflserd=0;
rs = ps.executeQuery();
rs.next();
vflserd=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='AF' and `Dpmt.`='SERD'");

int afserd=0;
rs = ps.executeQuery();
rs.next();
afserd=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='FF' and `Dpmt.`='SOM'");

int ffsom=0;
rs = ps.executeQuery();
rs.next();
ffsom=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFM' and `Dpmt.`='SOM'");

int vfmsom=0;
rs = ps.executeQuery();
rs.next();
vfmsom=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='VFL' and `Dpmt.`='SOM'");

int vflsom=0;
rs = ps.executeQuery();
rs.next();
vflsom=rs.getInt(1);

ps=con.prepareStatement("select count(*) from "+table+" where Type='AF' and `Dpmt.`='SOM'");

int afsom=0;
rs = ps.executeQuery();
rs.next();
afsom=rs.getInt(1);
ps=con.prepareStatement("select count(*) from "+table+" where `Dpmt.` in('SOM','SERD','SET')");

int total=0;
rs = ps.executeQuery();
rs.next();
total=rs.getInt(1);
double ffsetf=ffset;
double vfmsetf=vfmset;
double vflsetf=vflset*0.5;
double afsetf=afset*0.25;

double ffserdf=ffserd;
double vfmserdf=vfmserd;
double vflserdf=vflserd*0.5;
double afserdf=afserd*0.25;

double ffsomf=ffsom;
double vfmsomf=vfmsom;
double vflsomf=vflsom*0.5;
double afsomf=afsom*0.25;
double ffait=ffset+ffserd+ffsom;
double ffaitf=ffsetf+ffserdf+ffsomf;
double vfmait=vfmset+vfmserd+vfmsom;
double vfmaitf=vfmsetf+vfmserdf+vfmsomf;
double vflait=vflset+vflserd+vflsom;        
double vflaitf=vflsetf+vflserdf+vflsomf;
double afait=afset+afserd+afsom;
double afaitf=afsetf+afserdf+afsomf;
%>
<h3> Report Generated : </h3>

<table>
<tr>
<td colspan="2">
<td><strong>FACULTY HEADCOUNT</strong></td>
<td><strong>FACULTY STRENGTH IN FTE*</strong></td>
    <tr>
        <td rowspan="5"><center><strong>SET</strong></center></td>
        <td>Full-time Faculty</td>
        <td><%=ffset%></td>
        <td><%=ffsetf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty>1y</td>
        <td><%=vfmset%></td>
        <td><%=vfmsetf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty<1y</td>
        <td><%=vflset%></td>
        <td><%=vflsetf%></td>
    </tr>
    <tr>
        <td>Adjunct Faculty</td>
        <td><%=afset%></td>
        <td><%=afsetf%></td>
    </tr>
<tr>
        <td><b>SET Total</b></td>
        <td><%=afset+vfmset+vflset+ffset%></td>
        <td><%=afsetf+vfmsetf+vflsetf+ffsetf%></td>
    </tr>
<tr>
        <td rowspan="5"><center><strong>SERD</strong></center></td>
        <td>Full-time Faculty</td>
        <td><%=ffserd%></td>
        <td><%=ffserdf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty>1y</td>
        <td><%=vfmserd%></td>
        <td><%=vfmserdf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty<1y</td>
        <td><%=vflserd%></td>
        <td><%=vflserdf%></td>
    </tr>
    <tr>
        <td>Adjunct Faculty</td>
        <td><%=afserd%></td>
        <td><%=afserdf%></td>
    </tr>
<tr>
        <td><b>SERD Total</b></td>
        <td><%=afserd+vfmserd+vflserd+ffserd%></td>
        <td><%=afserdf+vfmserdf+vflserdf+ffserdf%></td>
    </tr>
    <tr>
        <td rowspan="5"><center><strong>SOM</strong></center></td>
        <td>Full-time Faculty</td>
        <td><%=ffsom%></td>
        <td><%=ffsomf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty>1y</td>
        <td><%=vfmsom%></td>
        <td><%=vfmsomf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty<1y</td>
        <td><%=vflsom%></td>
        <td><%=vflsomf%></td>
    </tr>
    <tr>
        <td>Adjunct Faculty</td>
        <td><%=afsom%></td>
        <td><%=afsomf%></td>
    </tr>
<tr>
        <td><b>SOM Total</b></td>
        <td><%=afsom+vfmsom+vflsom+ffsom%></td>
        <td><%=afsomf+vfmsomf+vflsomf+ffsomf%></td>
    </tr>
    <tr>
        <td rowspan="5"><center><strong>AIT</strong></center></td>
        <td>Full-time Faculty</td>
        <td><%=ffait%></td>
        <td><%=ffaitf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty>1y</td>
        <td><%=vfmait%></td>
        <td><%=vfmaitf%></td>
    </tr>
    <tr>
        <td>Visiting Faculty<1y</td>
        <td><%=vflait%></td>
        <td><%=vflaitf%></td>
    </tr>
    <tr>
        <td>Adjunct Faculty</td>
        <td><%=afait%></td>
        <td><%=afaitf%></td>
    </tr>
<tr>
        <td><b>Total</b></td>
        <td><%=ffait+vfmait+vflait+afait%></td>
        <td><%=ffaitf+vfmaitf+vflaitf+afaitf%></td>
    </tr>
        
</table>

<br>
(Diversity Report has to be done in the similar manner)<br>
<a href="form.jsp"> Back to the form </a><br>
    <a href="generate.jsp"> Refresh </a>
    
    
    
    <%
            DefaultPieDataset dataset = new DefaultPieDataset( );
        dataset.setValue("Full-time Faculty",ffset);
        dataset.setValue("More Year Faculty",vfmset);
        dataset.setValue("Less Year Faculty",vflset);
        dataset.setValue("Adjunct Faculty",afset);
        
        JFreeChart chart = ChartFactory.createPieChart(
         "SET",  // chart title           
         dataset,         // data           
         true,            // include legend          
         true,           
         false );
        

      int width = 100; /* Width of the image */
      int height = 100; /* Height of the image */ 
   BufferedImage bi = chart.createBufferedImage(640, 480);
    ImageIO.write(bi, "png", response.getOutputStream());
     

      //ChartUtilities.saveChartAsJPEG(, chart , width , height );
//ChartUtilities.saveChartAsJPEG(,chart,width, height )  ;  
    %>
    
    
    </body>
</html>
