<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<title></title>
</head>

<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">
<div class="pagetitle">
      <h1>ListEquity</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">ListEquity</li>
        </ol>
      </nav>
    </div>

	<%
	List<EquityEntity> eqs = (List<EquityEntity>) request.getAttribute("eqs");
	%>
	<!-- <a class="bi bi-plus-lg btn btn-outline-primary" href="#"> Add Equity</a> -->
	<table class="table table-borderd table-hover" id="equityTable">
		<thead>
			<tr>
				<th>EquityId</th>
				<th>Name</th>
				<th>Symbol</th>
				<th>Price</th>
				<th>52H</th>
				<th>52L</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (EquityEntity eq : eqs) {
			%>
			<tr>
				<td><%=eq.getEquityId()%></td>
				<td><%=eq.getEquityName()%></td>
				<td><%=eq.getSymbol()%></td>
				<td><%=eq.getPrice()%></td>
				<td><%=eq.getHigh52()%></td>
				<td><%=eq.getLow52()%></td>
				<td><a class="bi bi-trash btn btn-outline-danger" href="#"> Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("equityTable");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [15,50,100,200,'All' ],
				perPage: 15
			});
		})
	</script>
</main>
</body>

</html>