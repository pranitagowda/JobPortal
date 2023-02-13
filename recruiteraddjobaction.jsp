<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Recruiter – Add Job</title>
</head>
<body>

<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="recruiter") //to check user is logged in, if user is not logged email will be null and page will redirect to index.jsp
%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<hr>
<pre> <a href="recruiterprofile.jsp"> Profile </a> | <a href="recruiterviewjob.jsp"> View Your Jobs </a> | <a href="recruiteraddjob.jsp"> Add New Job </a> | <a href="recruitersearch.jsp"> Search Job Seeker </a> | <a href=""> Response Detail </a> | <a href="recruiterfeedback.jsp"> Feedback </a></pre>
<hr>
<%

Date dnow=new Date();
String jobid=request.getParameter("jobid");
String title=request.getParameter("title");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String salary=request.getParameter("salary");
String description=request.getParameter("description");
String functionalarea=request.getParameter("functionalarea");
String role=request.getParameter("role");
String keyskills=request.getParameter("keyskills");
String vacancy=request.getParameter("vacancy");

String recruiter=request.getParameter("recruiter");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/jobsite";

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 rs=stmt.executeQuery("select *from login where email='"+email+"'");
 stmt.executeUpdate("insert into job values('"+jobid+"','"+title+"','"+location+"','"+experience+"','"+email+"','"+salary+"','"+description+"','"+functionalarea+"','"+role+"','"+keyskills+"','"+vacancy+"','"+recruiter+"')");
 
 rs.close();
 stmt.close();
 con.close();
 
 response.sendRedirect("recruiterjobdetails.jsp?jobid="+jobid+"");
%>
<jsp:include page="footer.jsp"/>
</body>
</html>