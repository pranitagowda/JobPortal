<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title>JobSeeker – Update Profile</title>
</head>
<body>
<%
String email=(String)session.getAttribute("email");
String usertype=(String)session.getAttribute("usertype");
%>
<h1> JobSeeker </h1>
<jsp:include page="jobseekermenu.jsp"/>
<fieldset>
<legend>Profile Details</legend>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/jobsite";

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobsite","root","Root");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from jobseekerprofile where email='"+email+"'");
 if(!rs.next())
 {
 %>
 	<form method="post" action="jobseekerupdateprofileaction.jsp">
 	<table>

 	<tr>
 	<td>Basic Details</td>
 	</tr>
 	<tr>
 	<td>Name</td>
 	<td><input type="text" name="fname" placeholder="FirstName"></td>
 	</tr>

 	<tr>
 	<td></td>
 	<td><input type="text" name="lname" placeholder="LastName"></td>
 	</tr>

 	<tr>
 	<td>Designation</td>
 	<td><input type="text" name="designation"></td>
 	</tr>
 	<tr>
 	<td>Location</td>
 	<td><input type="text" name="location"></td>
 	</tr>
 	<tr>
 	<td>Experience</td>
 	<td><select name="experience"  class="Form_fields" required>
 						 <option value="">- Select -</option>
 						 <option value="0">0</option>
 						 <option value="1">1</option>

 						 <option value="2">2</option>
 						 <option value="3">3</option>
 						 <option value="4">4</option>
 						 <option value="5">5</option>
 						 <option value="6">6</option>
 						 <option value="7">7</option>

 						 <option value="8">8</option>
 						 <option value="9">9</option>
 						 <option value="10">10</option>
 						 <option value="11">11</option>
 						 <option value="12">12</option>
 						 <option value="13">13</option>

 						 <option value="14">14</option>
 						 <option value="15">15</option>
 						 <option value="16">16</option>
 						 <option value="17">17</option>
 						 <option value="18">18</option>
 						 <option value="19">19</option>

 						 <option value="20">20</option>
 						 <option value="21">21</option>
 						 <option value="22">22</option>
 						 <option value="23">23</option>
 						 <option value="24">24</option>
 						 <option value="25">25</option>

 						 <option value="26">26</option>
 						 <option value="27">27</option>
 						 <option value="28">28</option>
 						 <option value="29">29</option>
 						 <option value="30">30</option>
 						 <option value="31">31</option>

 						 <option value="32">32</option>
 						 <option value="33">33</option>
 						 <option value="34">34</option>
 						 <option value="35">35</option>
 						 <option value="36">36</option>
 						 <option value="37">37</option>

 						 <option value="38">38</option>
 						 <option value="39">39</option>
 						 <option value="40">40</option>
 						 <option value="41">41</option>
 						 <option value="42">42</option>
 						 <option value="43">43</option>

 						 <option value="44">44</option>
 						 <option value="45">45</option>
 						 <option value="46">46</option>
 						 <option value="47">47</option>
 						 <option value="48">48</option>
 						 <option value="49">49</option>

 						 <option value="50">50</option>
 						 </select>&nbsp;Years</td>

 	
 	<tr>
 	<td>Contact Number</td>
 	<td><input type="text" name="contactnumber"></td>
 	</tr>
 	<tr>
 	<td>Education</td>
 	</tr>
 	<tr align=center>
 	<td colspan=2><input type="text" name="education" placeholder="e.g. BCA"></td>
 	</tr>
 	
 	<tr>
 	<td>&nbsp</td>
 	</tr>
 	<tr>
 	<td align="center" colspan=2><input type="submit" value="Update"></td>
 	</tr>
 	</table>
 	</form>
 	<%
 }
 while(rs.next())
 {
%>

<form method="post" action="jobseekerupdateprofileaction.jsp">
<table>

<tr>
<td>Basic Details</td>
</tr>
<tr>
<td>Name</td>
<td><input type="text" name="fname" placeholder="FirstName" value=<%=rs.getString("fname") %>></td>
</tr>

<tr>
<td></td>
<td><input type="text" name="lname" placeholder="LastName" value=<%=rs.getString("lname") %>></td>
</tr>

<tr>
<td>Designation</td>
<td><input type="text" name="designation" value=<%=rs.getString("designation") %>></td>
</tr>
<tr>
<td>Location</td>
<td><input type="text" name="location" value=<%=rs.getString("location") %>></td>
</tr>
<tr>
<td>Experience</td>
<td><select name="experience"  class="Form_fields" required>
					 <option value="">- Select -</option>
					 <option value="0">0</option>
					 <option value="1">1</option>

					 <option value="2">2</option>
					 <option value="3">3</option>
					 <option value="4">4</option>
					 <option value="5">5</option>
					 <option value="6">6</option>
					 <option value="7">7</option>

					 <option value="8">8</option>
					 <option value="9">9</option>
					 <option value="10">10</option>
					 <option value="11">11</option>
					 <option value="12">12</option>
					 <option value="13">13</option>

					 <option value="14">14</option>
					 <option value="15">15</option>
					 <option value="16">16</option>
					 <option value="17">17</option>
					 <option value="18">18</option>
					 <option value="19">19</option>

					 <option value="20">20</option>
					 <option value="21">21</option>
					 <option value="22">22</option>
					 <option value="23">23</option>
					 <option value="24">24</option>
					 <option value="25">25</option>

					 <option value="26">26</option>
					 <option value="27">27</option>
					 <option value="28">28</option>
					 <option value="29">29</option>
					 <option value="30">30</option>
					 <option value="31">31</option>

					 <option value="32">32</option>
					 <option value="33">33</option>
					 <option value="34">34</option>
					 <option value="35">35</option>
					 <option value="36">36</option>
					 <option value="37">37</option>

					 <option value="38">38</option>
					 <option value="39">39</option>
					 <option value="40">40</option>
					 <option value="41">41</option>
					 <option value="42">42</option>
					 <option value="43">43</option>

					 <option value="44">44</option>
					 <option value="45">45</option>
					 <option value="46">46</option>
					 <option value="47">47</option>
					 <option value="48">48</option>
					 <option value="49">49</option>

					 <option value="50">50</option>
					 </select>&nbsp;Years</td>
<tr>
<td>Email</td>
<td><input type="text" name="email" value=<%=rs.getString("email") %>></td>
</tr>
<tr>
<td>Contact Number</td>
<td><input type="text" name="contactnumber" value=<%=rs.getString("contactnumber") %>></td>
</tr>
<tr>
<tr>
<td>Education</td>
</tr>
<tr align=center>
<td colspan=2><input type="text" name="education" placeholder="e.g. BCA" value=<%=rs.getString("education") %>></td>
</tr>
<td>&nbsp</td>
</tr>
<tr>
<td align="center" colspan=2><input type="submit" value="Update"></td>
</tr>
</table>
</form>
<%
}
rs.close();
stmt.close();
con.close();

%>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>