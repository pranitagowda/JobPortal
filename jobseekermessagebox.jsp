<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Message Box </title>
</head>
<body>
<h1> JobSeeker </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp

%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="jobseekermenu.jsp"/>
<fieldset>
<legend>Messages</legend>
<%

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/jobsite";

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from message where to_email='"+email+"' order by datetime desc ");
 if(!rs.next())
 {
 %>
 Empty Message Box
 <%
 }
 while(rs.next())
 {
%>

<hr width=30%>
<div class="inbox">
<table width=30%>

<tr>
<td><a href="jobseekerrecruiterprofile.jsp?user=<%=rs.getString("from_email") %>"><%=rs.getString("from_email") %></a></td>
<td style="text-align:right;"><%=rs.getString("datetime") %></td>
</tr>

<tr>
<td><%=rs.getString("message") %><a href="jobseekerjobdetails.jsp?jobid=<%=rs.getString("forjob")%>"><%=rs.getString("forjob") %></a></td>
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