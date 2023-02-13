<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Admin –Recruiter Profile</title>
</head>
<body>
<jsp:include page="adminheader.jsp"/>
<h1>Administrator</h1>
<jsp:include page="adminmenu.jsp"/>
<fieldset>
<legend>Profile Details</legend>
<%
String email =request.getParameter("email");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.cj.jdbc.Driver");
 

 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select *from recruiterprofile where email ='"+email+"'");
 while(rs.next())
 {
%>

<table width=30%>
<tr>
<td>Name</td>
<td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td>
</tr>

<tr>
<td>Company Name</td>
<td><%=rs.getString("company") %></td>
</tr>

<tr>
<td>Designation</td>
<td><%=rs.getString("designation")%></td>
</tr>

<tr>
<td>Location</td>
<td><%=rs.getString("location") %></td>
</tr>

<tr>
<td>Email</td>
<td><%=rs.getString("email") %></td>
</tr>

<tr>
<td>Contact Number</td>
<td><%=rs.getString("contactnumber") %></td>
</tr>



<%
}
 rs.close();
 stmt.close();
 con.close();
 %>

</fieldset>
<jsp:include page="adminfooter.jsp"/>
</body>
</html>