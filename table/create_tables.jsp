<%@page import="jobsite.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1 = "create table users(firstname varchar(100),lastname varchar(100),gender char(1),contactnumber bigint,address varchar(500),email varchar(100),password varchar(100))";
	String q2 = "create table message(from_email varchar(200),to_email varchar(200),message varchar(4000),form_job varchar(100),datetime varchar(100))";
	String q3 = "create table jobseekerresume(email varchar(200),filename blob)";
	String q4 = "create table jobseekerprofile(firstname varchar(100),lastname varchar(100),designation varchar(100),location varchar(200),experience varchar(200),email varchar(200),contactnumber bigint,education varchar(4000))";
	String q5 = "create table job(jobid varchar(30),title varchar(400),location varchar(400),experience varchar(200),email varchar(100),salary varchar(30),description varchar(4000),functionalarea varchar(50),role varchar(50),keyskills varchar(2000),vacancy varchar(10),recruiter varchar(400))";
	String q6 = "create table recruiterprofile(firstname varchar(100),lastname varchar(100),company varchar(200),designation varchar(100),location varchar(200),email varchar(200),contactnumber bigint)";
	String q7 = "create table login(email varchar(100), password varchar(100))";
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	System.out.println(q5);
	System.out.println(q6);
	System.out.println(q7);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	//st.execute(q4);
	//st.execute(q5);
	//st.execute(q6);
	st.execute(q7);
	System.out.print("Table created");
	con.close();
}
catch(Exception e)
{
  System.out.print(e);	
}



%>