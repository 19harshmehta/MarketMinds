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
<%@include file="UserLayout.jsp" %>
	<main id="main" class="main">
	
	<div class="pagetitle">
      <h1>Add Portfolio</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">Add Portfolio</li>
        
        </ol>
      </nav>
    </div>
				<form action="saveportfolio" method="post">
					     
					<div class="form-group">
						Portfolio Name: <input type="text" id="title" name="portfolioName" required/>
					</div> 
	 			<input type="submit" value="Create" class="btn btn-primary"/>
	 			</form>
			</div>  
			<div class="col-md-3"></div> 
		</div>
	</div>
</body>
</html>