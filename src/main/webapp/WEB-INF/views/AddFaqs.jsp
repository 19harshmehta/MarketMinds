<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Change Password</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
			
		<h2>FAQs</h2>
				<form action="addfaqs" method="post">
					
					
					<div class="form-group">
						Question: <input type="text" name="question" class="form-control"/>
					</div>
					
					<div class="form-group">
						Answer: <input type="text" name="answer" class="form-control"/>
					</div>
					
					<br>
	 
	 			<input type="submit" value="Add" class="btn btn-success"/>
				</form>
			</div>
			<div class="col-md-3"></div>

		</div>


	</div>
</body>
</html>