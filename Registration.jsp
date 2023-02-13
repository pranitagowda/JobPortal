<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Registration.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<form action="RegistrationAction.jsp" method="POST">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="firstname"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="firstname" id="firstname" required>
  
   <label for="lastname"><b>Last name</b></label>
    <input type="text" placeholder="Enter Last name" name="lastname" id="lastname" required>
     
     <lable for ="Enter Your Gender"><b> Enter Your Gender</b></lable>
<br></br>
   
    <input type="radio" id="male" name="gender" value="m">
    
        <label for="male">Male</label><br>
    
	<input type="radio" id="female" name="gender" value="f">
    	
	<label for="female">Female</label><br>

	<input type="radio" id="other" name="gender" value="o">
    	<label for="other">Other</label>
<br></br>
    

 
    <label for="contactnumber "><b>Contact number</b></label>
    <input type="text" placeholder="Enter Contact Number" name="contactnumber" id="contactnumber" required>

    <label for="address"><b>Address Details </b></label>
    <input type="text" placeholder="Enter Address" name="address" id="address" required>
 
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>
 
   

    <label for="password"><b>Create Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required>

   
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
  <%
  	 String msg=request.getParameter("msg");
     if("valid".equals(msg))
     {
  %>
  <h1> Successfully Registered!</h1>
  <%} %>
  <%
  if("invalid".equals(msg))
  {
  %>
  <h1>Something went WRONG! Try Again!</h1>
  <%} %>
    <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
  </div>
</form>

</body>
</html>