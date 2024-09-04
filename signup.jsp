<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    	<input type="text" name="name" placeholder="Enter name" required>
    	<input type="email" name="email" placeholder="Enter email" required>
    	<input type="number" name="mobileNumber" placeholder="Enter phone number" required>
    	<select name="securityQuestion" required>
    		<option value="What was your first car?">What was your first car?</option>
    		<option value="What is name of your first pet?">What is name of your first pet?</option>
    		<option value="What elementary school you studied?">What elementary school you studied?</option>
    		<option value="What is name of town you were born?">What is name of town you were born?</option>
    	</select>
    	<input type="text" name="answer" placeholder="Enter your answer" required>
    	<input type="password" name="password" placeholder="Enter your password" required>
    	<input type="submit" value="signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<% 
	String msg = request.getParameter("msg");
    if("valid".equals(msg))
    {
%>
<h1>Successfully Registered</h1>
<% }%>
<%
if("invalid".equals(msg));
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% }%>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>