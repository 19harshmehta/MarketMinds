<%@page import="com.arth.entity.UserEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><title></title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Users</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">All Users</li>
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
	<table class="table table-borderd table-hover" id="allUsers"> 
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
				<td><a class="bi bi-trash btn btn-outline-danger" href="deleteuser/<%=user.getUserId()%>"> Delete</a></td>
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
			const datatables = document.getElementById("allUsers");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 20
			});
		})
	</script>
	
</body>
</html>