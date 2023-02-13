<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker – Search Result </title>
</head>
<body>
<h1> JobSeeker </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");

%>
<p style="text-align:right;"> Welcome <%=email%> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="jobseekermenu.jsp"/>
<fieldset>
<legend>Search Results</legend>
<form action="jobseekersearchresult.jsp">
<input type="search" name="keyword" size="50%"><input type="submit" value="Search">
</form>
<% 
String keyword=request.getParameter("keyword");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String expectedsalary=request.getParameter("expectedsalary");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
stmt=con.createStatement();

rs=stmt.executeQuery("select * from job where title='"+keyword+"' or keyskills='"+keyword+"' or role='"+keyword+"' or recruiter='"+keyword+"' or location='"+location+"' or experience<='"+experience+"' or salary>='"+expectedsalary+"' "); 

while(rs.next())
{
%>
<hr width=30%>
<div>
<table width=30%>
<tr>
<td><b><a href="jobseekerjobdetails.jsp?jobid=<%=rs.getString("jobid") %>"><%=rs.getString("title") %></a></b></td>

</tr>
<tr>
<td><%=rs.getString("experience") %>&nbsp;Years</td>
</tr>
<tr>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td><%=rs.getString("salary") %> p.a.</td>
</tr>
<tr>
<td><%=rs.getString("keyskills") %></td>
</tr>
<tr>
<td>Vacancy-<%=rs.getString("vacancy") %></td>
</tr>
</table>
</div>
<hr width=30%>
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