<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<html>
<head>
<title>JobSeeker- Send Message Action</title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp

%>
<% 
Date dnow=new Date();
SimpleDateFormat ft=new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss");
String user=request.getParameter("user");
String jobid=request.getParameter("jobid");
String message="Applied for ";

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 
 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/jobsite";

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("insert into message values('"+email+"','"+user+"','"+message+"','"+jobid+"','"+ft.format(dnow)+"')");
    
	  rs.close();
	  stmt.close();
	  con.close();

  response.sendRedirect("jobseekersearchresult.jsp");
  
%>
</body>
</html>