<%@page import="jobsite.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String gender=request.getParameter("gender");
String contactnumber=request.getParameter("contactnumber");
String address= request.getParameter("address");
String email=request.getParameter("email");
String password=request.getParameter("password");



try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps= con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
 	ps.setString(1,firstname);
 	ps.setString(2,lastname);
 	ps.setString(3,gender);	
 	ps.setString(4,contactnumber);	
 	ps.setString(5,address);
 	ps.setString(6,email);	
 	ps.setString(7,password);	
 	ps.executeUpdate();
 	response.sendRedirect("Registration.jsp?msg=valid");
 }
catch(Exception e)
{	
	System.out.println(e);
	response.sendRedirect("Registration.jsp?msg=invalid");
	
}
%>