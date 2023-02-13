<%@ page import="java.sql.*" %>
<%@ include file ="jobseekermenu.jsp"%>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker – Job Details </title>
</head>
<body>
<h1> JobSeeker </h1>


<fieldset>
<legend>Job Details</legend>
<% 
String jobid=request.getParameter("jobid");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
stmt=con.createStatement();

rs=stmt.executeQuery("select *from job where jobid='"+jobid+"'");

while(rs.next())
{
%>

<div class="jobdetails">
<table width=30%>
<tr>
<td><%=rs.getString("experience") %>&nbsp;Years</td>
<td style="text-align:right;">Posted by <%=rs.getString("recruiter") %></td>
</tr>
<tr>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td><%=rs.getString("salary") %> p.a.</td>
</tr>
<tr>
<td>Vacancy-<%=rs.getString("vacancy") %></td>
</tr>
</table>
<hr width=30%>
<table>
<tr>
<td><%=rs.getString("description") %></td>
</tr>
</table>
<hr width=30%>
<table>
<tr>
<td>Functional Area &nbsp; </td>
<td><%=rs.getString("functionalarea") %></td>
</tr>
<tr>
<td>Role &nbsp;</td>
<td><%=rs.getString("role") %></td>
</tr>
<tr>
<td>Key Skills  &nbsp;</td>
<td><%=rs.getString("keyskills") %></td>
</tr>

</table>
</div>
<br>
<a href="jobseekersendmessageaction.jsp?user=<%=rs.getString("recruiter") %>&jobid=<%=jobid %>">Apply for this Job</a>
<%	
}
 rs.close();
 stmt.close();
 con.close();
 %>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>