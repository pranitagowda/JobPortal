<%@ page import="java.sql.*" %>
<html>
<head><link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title> Admin � Recruiter Report </title>
</head>
<body>
<h1>Administrator</h1>
<jsp:include page="adminmenu.jsp"/>
<fieldset>
<legend>List of Registered Recruiters</legend>
<div class="adminlist">
<table width=30% border=1>
<b><tr>
<td width=10%>S.No.</td>
<td width=50%>email</td>
<td width=20%>View Profile</td>
<td width=20%>Remove Profile</td>
</tr></b>
</table>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
int count=1;
Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select *from recruiterprofile");
 while(rs.next())
 {
%>
<table width=30% border=1>
<tr>
<td width=10%><%=count%>.</td>
<td width=50%><%=rs.getString("email") %></td>
<td width=20%><a href="adminrecruiterprofile.jsp?user=<%=rs.getString("email") %>">View</a></td>
<td width=20%><a href="adminremoveaction.jsp?user=<%=rs.getString("email")%>&type=recruiter">Remove</a></td>
</table>
</div>
<%
count++;
} 
 rs.close();
 stmt.close();
 con.close();
%>
</fieldset>
<jsp:include page="adminfooter.jsp"/>
</body>
</html>