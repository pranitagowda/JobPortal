<%@ page import="java.sql.*" %>
<html>
<head>
<title> Recruiter – Update Profile </title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String company=request.getParameter("company");
String designation=request.getParameter("designation");
String location=request.getParameter("location");
String mobile=request.getParameter("mobile");
String gender=request.getParameter("gender");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 ResultSet rs3=null;
 
  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://localhost:3306/jobsite";

  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("select * from login where email='"+email+"'");
  if(rs.next())
  {
  rs1=stmt.executeQuery("select * from recruiterprofile where email='"+email+"'");
	  if(rs1.next())
	  {
            stmt.executeUpdate("update recruiterprofile set email='"+email+"' , fname='"+fname+"' , lname='"+lname+"' , company='"+company+"' , designation='"+designation+"' , location='"+location+"' , email='"+email+"' , mobile='"+mobile+"' , gender='"+gender+"' where email ='"+email+"' ");     
	  }
	  else
	  {
            stmt.executeUpdate("insert into recruiterprofile values('"+email+"','"+fname+"','"+lname+"','"+company+"','"+designation+"','"+location+"','"+email+"','"+mobile+"','"+gender+"')");     
	  }
	 
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("recruiterprofile.jsp");
  
%>
</body>
</html>