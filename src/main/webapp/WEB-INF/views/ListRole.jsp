<%@page import="com.arth.entity.RoleEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Role</title>
</head>

<body>
<%@include file="AdminLayout.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Role</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
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