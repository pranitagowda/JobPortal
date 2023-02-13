<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker – Search </title>
</head>
<body>
<h1> JobSeeker </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");

%>
<p style="text-align:right;"> Welcome <%=email%><a href="logout.jsp"> Logout </a></p>
<jsp:include page="jobseekermenu.jsp"/>
<fieldset>
<legend>Search Jobs</legend>
<form method="get" action="jobseekersearchresult.jsp">
<table>
 <tr>
 <td>Keywords</td>
 </tr>
 <tr>
 <td><input type="text" name="keyword"></td>
 </tr>

 <tr>
 <td>Location</td>
 </tr>
 <tr>
 <td><input type="text" name="location"></td>
 </tr>
 
 <tr>
 <td>Experience</td>
 <td>Expected Salary</td>
 </tr>
 <tr>
 <td><input type="number" name="experience"></td>
 <td><input type="number" name="expectedsalary"></td>
 </tr>
 
 <tr>
 <td><input type="submit" name="submit" value="Search Jobs"></td>
 </tr>
</table>
</form>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>