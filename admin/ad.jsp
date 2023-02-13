<%@page import="jobsite.ConnectionProvider"%>
<%@include file="adminheader.jsp"%>
<%@include file="adminmenu.jsp"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Admin – JobSeeker Profile </title>
</head>
<body>
<h1>Administrator</h1>

<fieldset>
<legend>Profile Details</legend>
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
</th>
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