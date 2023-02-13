<%@page import="jobsite.ConnectionProvider"%>
<%@include file="adminheader.jsp"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Admin – JobSeeker Profile </title>
</head>
<body>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");

%>
<p style="text-align:right;"> Welcome <%=email %>    <a href="logout.jsp"> Logout </a></p>
<div class="myBox">
<a href="adminHome.jsp"> Home </a> | <a href="adminjobseekerreport.jsp"> JobSeeker Reports </a> 
</div>

<h1>Administrator</h1>

<fieldset>
<legend>Profile Details</legend>
<%


Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.cj.jdbc.Driver");

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select *from jobseekerprofile where email='"+email+"'");
 while(rs.next())
 {
%>
<table width=30%>
<th>
<td>Basic Details</td>
</th>
<tr>
<td>Name</td>
<td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td>
</tr>
<tr>
<td>Designation</td>
<td><%=rs.getString("designation") %></td>
</tr>
<tr>
<td>Location</td>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td>Experience</td>
<td><%=rs.getString("experience") %></td>
</tr>
<tr>
<td>Email</td>
<td><%=rs.getString("email") %></td>
</tr>
<tr>
<td>Contact Number</td>
<td><%=rs.getString("contactnumber") %></td>
</tr>

<tr>
<td>Education</td>

<tr align=center>
<td colspan=2><%=rs.getString("education") %></td>
</tr>




<%
 }
 rs.close();
 stmt.close();
 con.close();
 %>
</table>
</fieldset>
<jsp:include page="adminfooter.jsp"/>
</body>
</html>