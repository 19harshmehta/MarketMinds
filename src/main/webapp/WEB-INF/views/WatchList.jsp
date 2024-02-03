<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<title>Marketminds | WatchList</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
</head>

<body>
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">
<%
    List<Object[]> watchlist = (List<Object[]>) request.getAttribute("watchlist");
	%>
<div class="pagetitle">
      <h1>Watchlist</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">Watchlist</li>
        </ol>
      </nav>
    </div>

	<table class="table table-borderd table-hover" id="watchlist"> 
		<thead>
			<tr>
				<th>EqID</th>
				<th>Equity Name</th>
				<th>High 52</th>
				<th>Low 52</th>
				<th>Industry Name </th>
				<th>Price</th>
				<th>Symbol</th>
				<th>Action</th>
				
			</tr>
		</thead>
		<tbody>
			<% for (Object[] dataRow : watchlist) { %>
            <tr>
                <td><%= dataRow[0] %></td>
                <td><%= dataRow[3] %></td>
                <td><%= dataRow[4] %></td>                
                <td><%= dataRow[6] %></td>
                <td><%= dataRow[5] %></td>
                <td><%= dataRow[7] %></td>
                <td><%= dataRow[9] %></td>
                <td><a class="btn btn-outline-danger" href="deletewatchlist?equityId=<%=dataRow[0]%>">Remove</a></td>
            </tr>
        <% } %>
		</tbody>
	</table>



	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("watchlist");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [20,50,100,200,'All' ],
				perPage: 20
			});
		})
	</script>
</main>
</body>

</html>