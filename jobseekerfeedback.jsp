<%@include file="jobseekermenu.jsp"%>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Feedback </title>
</head>
<body>

<h1> JobSeeker </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp

%>
<p style="text-align:right;"> Welcome <%=email%> <a href="logout.jsp"> Logout </a></p>

<fieldset>
<legend>Feedback</legend>
<form method="post" action="" name="messageform">
<table>
<tr>
<td>Email</td>
<td><input type="text" name="name" value="<%=email %>" disabled></td>
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
<jsp:include page="footer.jsp"/>
</body>
</html>