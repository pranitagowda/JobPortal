
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter � Send Message </title>
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
<% 
Date dnow=new Date();
SimpleDateFormat ft=new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss");
String user=request.getParameter("user");
%>
<div class="message">
    <center>
<fieldset>
<legend>Message</legend>
<form method="post" action="recruitersendmessageaction.jsp" name="messageform">
<table>

<tr>
<td>To</td>
<td><input type="text" name="to_email" value=<%=email %> disabled></td>
</tr>

<tr>
<td>From</td>
<td><input type="text" name="from_email" value=<%=email %> disabled></td>
</tr>

<tr>
<td>Message</td>
<td><textarea name="message" form="messageform" required></textarea></td>
</tr>

<tr>
<td><input type="hidden" name="time" value=<%=ft.format(dnow) %>></td>
</tr>

<tr>
<td align="center" colspan=2><input type="submit" value="Send"></td>
</tr>

</table>
</form>
</fieldset>
    </center>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>