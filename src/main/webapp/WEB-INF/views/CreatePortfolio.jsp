<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Portfolio </title>
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
	<h2>Create Portfolio</h2>
				<form action="saveportfolio" method="post">
					
					<div class="form-group">
					        <label for="title">Portfolio Name:</label>
					        <input type="text" id="title" name="portfolioName" required><br><br>
							<br><br>
					</div>	 
	 			<input type="submit" value="Create" class="btn btn-success"/>
	 			</form>
			</div>   
		</div>
	</div>
</body>
</html>