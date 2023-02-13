<%@ page import="java.sql.*" %>
<html>
<head>
<title>JobSeeker – Update Profile Action</title>
</head>
<body>
<%

String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
%>

<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String designation=request.getParameter("designation");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String contactnumber=request.getParameter("contactnumber");
String education=request.getParameter("education");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 ResultSet rs3=null;
 
 Class.forName("com.mysql.cj.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/jobsite";

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("select *from login where email='"+email+"'");
  if(rs.next())
  {
	  rs1=stmt.executeQuery("select * from jobseekerprofile where email='"+email+"'");
	  if(rs1.next())
	  {
       rs2=stmt.executeQuery("update jobseekerprofile set email='"+email+"', fname='"+fname+"', lname='"+lname+"', designation='"+designation+"', location='"+location+"', experience='"+experience+"', contactnumber='"+contactnumber+"', education='"+education+"' where email='"+email+"' ");     // toLowerCase() is used to store data into table in LowerCase to remove case senstivity of fields except password. Password is case sensitive for security reasons.
	  }
	  else
	  {
	  rs3=stmt.executeQuery("insert into jobseekerprofile values('"+fname+"','"+lname+"','"+designation+"','"+location+"','"+experience+"','"+contactnumber+"','"+education+"')");     // toLowerCase() is used to store data into table in LowerCase to remove case senstivity of fields except password. Password is case sensitive for security reasons.  
	  }
	  rs.close();
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("jobseekerprofile.jsp");
  
%>
</body>
</html>