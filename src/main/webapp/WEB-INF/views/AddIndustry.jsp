<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Add Industry </title>
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
	<h2>Add Industry</h2>
				<form action="addindustry1" method="post">
					
					<div class="form-group">
						Industry Name: <input type="text" name="industryName" class="form-control"/>
					</div>	 
	 			<input type="submit" value="Add Industry" class="btn btn-success"/>
	 			</form>
	 			<h2>OR</h2>
				<form action="addindustry" method="post" enctype="multipart/form-data">	 			
	 			<input type="file" name="file" />
        		<input type="submit" value="Upload" name="industryName"  class="btn btn-success"/>
				</form>
			</div>   
			

		</div>


	</div>
</body>
</html>