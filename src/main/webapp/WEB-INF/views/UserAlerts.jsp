<%@page import="com.arth.entity.AlertEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Alerts</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
</head>
<body>
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">
<div class="pagetitle">
      <h1>Alerts</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">Alerts</li>
        </ol>
      </nav>
    </div>

	<%
	List<Object[]> alert = (List<Object[]>) request.getAttribute("alert");
	%>
	<table class="table table-borderd table-hover" id="alert"> 
		<thead>
			<tr>
				<th>SR.No</th>
				<th>Equity</th>
				<th>Target price</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Object [] a : alert) {
			%>
			<tr>
				<td><%= a[0] %></td>
				<td><%= a[5] %></td>
				<td><%= a[3] %></td>
				<%if(a[1].equals(0)) {%>
				<td><b class="text-success">Completed</b></td>
				<%}if(a[1].equals(1)){ %>
				<td><b class="text-danger">Pending</b></td>
				<%} %>
			</tr>
			<%
			}
			%> 
		</tbody>
	</table><script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("alert");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [10,50,100,200,'All' ],
				perPage: 10
			});
		})
	</script>
</main>
</body>
</html>