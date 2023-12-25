<%@page import="com.arth.entity.UserEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Data - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

<!-- Option 1: Include in HTML -->

<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
 
<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Users</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Active Users</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="adduser"> Add User</a>
    <a class="bi bi-people-fill btn btn-outline-primary" href="listusers"> All Users</a>
    <a class="bi bi-people-fill btn btn-outline-primary" href="listactiveusers"> Active Users</a>
    <a class="bi bi-person-check-fill btn btn-outline-primary" href="listpremiumusers">  Premium Users</a>
	<%
	List<UserEntity> users = (List<UserEntity>) request.getAttribute("users");
	%>
	<table class="table table-borderd table-hover" id="activeUserTable"> 
		<thead>
			<tr>
				<th>UserId</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (UserEntity u : users) {
			%>
			<tr>
				<td><%=u.getUserId()%></td>
				<td><%=u.getFirstName()%></td>
				<td><%=u.getLastName()%></td>
				<td><%=u.getEmail()%></td>
				<td><a class="bi bi-trash btn btn-outline-danger" href="deleteuser/<%=u.getUserId()%>">Delete</a></td>
			</tr>
			<%
			}
			%> 
		</tbody>
	</table>
	</main>



	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("activeUserTable");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [20,50,100,200,'All' ],
				perPage: 20
			});
		})
	</script>
	
</body>
</html>