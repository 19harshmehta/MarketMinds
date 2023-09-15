<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Add Stock </title>
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
	<h2>Add Stock</h2>
				<form action="saveequity" method="post">
					
					<div class="form-group">
					        <label for="title">Enter Quantity: </label>
					        <input type="number" id="title" name="qty" required><br><br>
							<br><br>
					</div>	
					<div class="form-group">
					        <label for="price">Enter Price: </label>
					        <input type="number" id="price" name="price" required><br><br>
					        <input type="hidden" name="equityId" value="${equityId}">
							<br><br>
					</div>	 
					<div class="form-group">
					        <label for="pdate">Purchase Date: </label>
					        <input type="date" id="pdate" name="purchasedAt" required><br><br>
							<br><br>
					</div>	 
	 			<input type="submit" value="Add Equity" class="btn btn-success"/>
	 			</form>
			</div>   
		</div>
	</div>
</body>
</html>