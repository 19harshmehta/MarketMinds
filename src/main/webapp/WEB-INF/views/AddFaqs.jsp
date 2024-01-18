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
      <h1>FAQ's</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">AddFaqs</li>
        
        </ol>
      </nav>
    </div>
	<form action="addfaqs" method="post">
		<div class="form-group">
			Question: <input type="text" name="question" class="form-control"/>
		</div><br/>
		
		<div class="form-group">
			Answer: <input type="text" name="answer" class="form-control"/>
		</div><br/>
		<input type="submit" value="Add" class="btn btn-primary"/>
	</form>
	</main>
	</body>
</html>