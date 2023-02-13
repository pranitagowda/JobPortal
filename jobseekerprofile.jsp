<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Profile </title>
</head>
<body>
<h1> JobSeeker </h1>
<jsp:include page="jobseekermenu.jsp"/>
<fieldset>
<legend>Profile Details</legend>
<table>
<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
%>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.cj.jdbc.Driver");
 
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select *from jobseekerprofile where email='"+email+"'");
 if(rs.next())
 {
%>

<tr>
<td>Basic Details</td>
</tr>
<tr>
<td>Name</td>
<td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td>
</tr>
<tr>
<td>Designation</td>
<td><%=rs.getString("designation") %></td>
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
<td>Contact Number </td>
<td><%=rs.getString("contactnumber") %></td>
</tr>
<tr>
<td>Location</td>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td>Education</td>
</tr>
<tr align=center>
<td colspan=2><%=rs.getString("education") %></td>
</tr>

<%
 }
 rs.close();
 stmt.close();
 con.close();
 %>
<tr>
<td colspan="2" align="center"><a href="jobseekerupdateprofile.jsp">Edit</a></td>
</tr>
</table>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>