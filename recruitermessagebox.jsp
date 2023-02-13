<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter – Message Box </title>
</head>
<body>
<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="recruiter") //to check user is logged in, if user is not logged email will be null and page will redirect to index.jsp

%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
<center>
<fieldset>
<legend>Messages</legend>
<%

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://local:3306/jobsite";
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
<td><a href="recruiterjobseekerprofile.jsp?user=<%=rs.getString("from_email") %>"><%=rs.getString("from_email") %></a></td>
<td style="text-align:right;"><%=rs.getString("datetime") %></td>
</tr>

<tr>
<td><%=rs.getString("message") %><a href="recruiterjobdetails.jsp?jobid=<%=rs.getString("forjob")%>"><%=rs.getString("forjob") %></a></td>
<td style="text-align:right;"><a href="recruitersendmessageaction.jsp?user=<%=rs.getString("from_email")%>&jobid=<%=rs.getString("forjob")%>">Accept for Interview</a></td>
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