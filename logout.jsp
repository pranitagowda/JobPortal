<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
request.getSession();
session.removeAttribute("email");
session.removeAttribute("usertype");
session.invalidate();
%>
You are successfully logged out!
<jsp:include page="login.jsp"/>
</body>
</html>