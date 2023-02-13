<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter - Search </title>
</head>
<body>
<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email ==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp

%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
<center>
Search Job Seeker<br><br>
<form method="get" action="recruitersearchresult.jsp">
<input type="search" name="search">
<input type="submit" value="Search">
</form>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>