<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter � Search Result </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("recruiterhome.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
<center>
<fieldset>
<legend>Search Results</legend>
<form action="jobseekersearchresult.jsp">
<input type="search" name="keyword" size="50%"><input type="submit" value="Search">
</form>
<% 
String search=request.getParameter("search");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/jobsite";

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
stmt=con.createStatement();

rs=stmt.executeQuery("select * from jobseekerprofile where email ='"+search+"' or fname='"+search+"' or lname='"+search+"' or designation='"+search+"' or location='"+search+"' or experience='"+search+"' or email='"+search+"' or mobile='"+search+"' or keyskills='"+search+"' or projects='"+search+"' or itskills='"+search+"' or education='"+search+"' or certifications='"+search+"' or workdetails='"+search+"' or dob='"+search+"' or gender='"+search+"' or hometown='"+search+"' or pin='"+search+"' or maritialstatus='"+search+"' or languagesknown='"+search+"'"); 

while(rs.next())
{
%>

<hr width=30%>
<div class="recruitersearchresult">
<table width=30%>
<tr>
<td><b><a href="recruiterjobseekerprofile.jsp?user=<%=rs.getString("email") %>"><%=rs.getString("fname") %> <%=rs.getString("lname") %></a></b></td>
</tr>
<tr>
<td><%=rs.getString("designation") %></td>
</tr>
<tr>
<td><%=rs.getString("experience") %>Years</td>
</tr>
<tr>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td><%=rs.getString("keyskills") %></td>
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
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>