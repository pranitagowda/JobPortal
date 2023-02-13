<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter – JobSeeker Profile </title>
</head>
<body>

<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
<center>
<fieldset>
<legend>Profile Details</legend>
<%
String user=request.getParameter("user");
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
ResultSet rs1=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/jobsite";

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from jobseekerprofile where email='"+user+"'");
 while(rs.next())
 {
%>
<table>
<a href="recruitersendmessage.jsp?user=<%=user %>">Send Message</a>
<th>
<td>Basic Details</td>
</th>
<tr>
<td>Name</td>
<td><%=rs.getString("fname") %> <%=rs.getString("fname") %></td>
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
<th>
<td>Contact Details</td>
</th>
<tr>
<td>Email</td>
<td><%=rs.getString("email") %></td>
</tr>
<tr>
<td>Contact Number</td>
<td><%=rs.getString("contactnumber") %></td>
</tr>
<th>
<th>
<td>Education</td>
</th>
<tr align=center>
<td colspan=2><%=rs.getString("education") %></td>
</tr>
<th>



<%
 }
 rs.close();
 stmt.close();
 con.close();
 %>
</table>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>