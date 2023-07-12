<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Login </title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
</head>
<body>
	<div><button class="btn btn-success"><a href="signup" style="text-decoration:none;color:white" >Sign Up</a></button></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
	<h2>Login</h2>
				<form action="authenticate" method="post">
					
					<div class="form-group">
						Email: <input type="text" name="email" class="form-control"/>
					</div>
					
					
					<div class="form-group">
						Password: <input type="password" name="password" class="form-control"/>
						<br><a align="right" href="forgotpassword">Forgot Password ?</a>
					</div>
					
					
	 
	 			<input type="submit" value="Login" class="btn btn-success"/>
				</form>
				<span class="error">${error }</span>
			</div>   
			<div class="col-md-3"></div>

		</div>


	</div>
</body>
</html>