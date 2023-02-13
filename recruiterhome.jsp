<%@include file ="header.jsp" %>
<html>
<head>
<<link rel="stylesheet" href="./css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title> Recruiter - Home </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1> Recruiter </h1>
<% 
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
if(email==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("recruitermenu.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=email %> <a href="logout.jsp"> Logout </a></p>

<jsp:include page="footer.jsp"/>
</body>
</html>