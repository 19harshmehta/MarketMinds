<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">
	
	<div class="pagetitle">
      <h1>Plans</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">AddPlans</li>
        </ol>
      </nav>
    </div>
	<form action="addplan" method="post">
		<div class="form-group">
			Plan Title: <input type="text" id="title" name="title" class="form-control"/>
		</div>
		
		<div class="form-group">
			Plan Duration (in months):</div> <input type="number" id="duration" name="duration" class="form-control"/>
		</div>
		
		<div class="form-group">
			Amount: <input type="number" id="amount" name="amount" class="form-control"/>
		</div>
		
		<div class="form-group">
			Tax: <input type="number" step="0.01" id="tax" name="tax" class="form-control"/>
		</div>
		<br/>
		<div>
			<input type="submit" value="Add" class="btn btn-primary"/>
		</div>
	</form>

	</main>

</body>
</html>