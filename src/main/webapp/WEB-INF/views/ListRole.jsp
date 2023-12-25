<%@page import="com.arth.entity.RoleEntity"%>
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
      <h1>Role</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Role</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="role"> Add Role</a>
   
	<%
	List<RoleEntity> roles = (List<RoleEntity>) request.getAttribute("roles");
	%>
	<table class="table table-borderd table-hover" id="roles"> 
		<thead>
			<tr>
				<th>RoleId</th>
				<th>RoleName</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (RoleEntity role : roles) {
			%>
			<tr>
				<td><%=role.getRoleId()%></td>
				<td><%=role.getRoleName()%></td>
				<td><a class="bi bi-trash btn btn-outline-danger" href="deleterole/<%=role.getRoleId()%>"> Delete</a></td>
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
			const datatables = document.getElementById("roles");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 20
			});
		})
	</script>


</body>
</html>