<%@ page import="java.sql.*" %>
<html>
<head>
<title>Admin Remove Action</title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");

%>
<% 
String fname=request.getParameter("fname");
String type=request.getParameter("type");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 
 Class.forName("com.mysql.cj.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/jobsite";

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
  stmt=con.createStatement();
  
  if(type=="jobseeker")
  {
  rs=stmt.executeQuery("select *from jobseekerprofile where email='"+email+"' ");
  if(rs.next())
  {
	  
	  rs1=stmt.executeQuery("delete from jobseekerprofile where email='"+email+"' ");
	  rs2=stmt.executeQuery("delete from login where email='"+email+"'");
	  rs.close();
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("adminjobseekerreport.jsp");
  }
  else if(type=="recruiter")
  {	  
  rs=stmt.executeQuery("select * from recruiterprofile where email='"+email+"' ");
  if(rs.next())
  {
	  
	  rs1=stmt.executeQuery("delete from recruiterprofile where email='"+email+"' ");
	  rs2=stmt.executeQuery("delete from login where email ='"+email+"'");
	  rs.close();
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("adminrecruiterreport.jsp");
  }
  
%>
</body>
</html>