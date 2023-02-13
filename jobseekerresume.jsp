<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Resume </title>
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
<legend>Upload Resume</legend>
<br>
<form method="post" action="/uploadServlet" enctype="multipart/form-data">
<input type="file" name="resume"><br><br>
<input type="submit" value="Upload">
</form>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>