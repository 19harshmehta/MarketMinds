<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Add Role </title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
	<h2>Add Role</h2>
				<form action="addrole" method="post">
					
					<div class="form-group">
						Role Type: <input type="text" name="roleName" class="form-control"/>
					</div>	 
	 			<input type="submit" value="Add Role" class="btn btn-success"/>
				</form>
			</div>   
			

		</div>


	</div>
</body>
</html>