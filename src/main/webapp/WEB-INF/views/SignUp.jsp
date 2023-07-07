<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page </title>
</head>
<body>
<h1>SignUp Page</h1>
<form method="post" action="saveuser">
<table>
	<tr>
		<td><label>First Name</label></td>
		<td><input type="text" name="firstName"></td>
	</tr>
	<tr>
		<td><label>Last Name</label></td>
		<td><input type="text" name="lastName"></td>
	</tr>
	<tr>
		<td><label>Email :</label></td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td><label>Password</label></td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan="2"><button type="Submit">Submit</button></td>
	</tr>
</table>
</form>

</body>
</html>