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
    String table=String.valueOf(session.getAttribute("tablename"));
    //String email=request.getParameter("emailid");
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

    
    
    <%
            DefaultPieDataset dataset = new DefaultPieDataset( );
        dataset.setValue("Full-time Faculty",ffserd);
        dataset.setValue("More Year Faculty",vfmserd);
        dataset.setValue("Less Year Faculty",vflserd);
        dataset.setValue("Adjunct Faculty",afserd);
        
        
        JFreeChart chart = ChartFactory.createPieChart(
         "SERD",  // chart title           
         dataset,         // data           
         true,            // include legend          
         true,           
         false );
        

      int width = 300; /* Width of the image */
      int height = 250; /* Height of the image */ 
   BufferedImage bi = chart.createBufferedImage(640, 480);
    ImageIO.write(bi, "png", response.getOutputStream());
     

      //ChartUtilities.saveChartAsJPEG(, chart , width , height );
//ChartUtilities.saveChartAsJPEG(,chart,width, height )  ;  
    %>
    
    
    </body>
</html>

