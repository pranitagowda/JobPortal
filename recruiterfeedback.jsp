<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter - Feedback </title>
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
<center>
<fieldset>
<legend>Feedback</legend>
<form method="post" action="mailto:ry4761@gmail.com" name="messageform">
<table>
<tr>
<td>E-Mail</td>
<td><input type="text" name="email"></td>
</tr>
<tr>
<td>Message</td>
<td><textarea name="message" form="messageform" required></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Send Message"></td>
</tr>
</table>
</form>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>