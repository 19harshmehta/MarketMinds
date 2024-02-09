<%@page import="com.arth.entity.TransactionEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Transaction </title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
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
      <h1>Transaction</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">Transaction</li>
        </ol>
      </nav>
    </div>

<%
	List<TransactionEntity> transactions = (List<TransactionEntity>) request.getAttribute("transactions");
%>
	<table class="table table-borderd table-hover" id="trans"> 
		<thead>
			<tr>
				<th>Id</th>
				<th>RefCode</th>
				<th>AuthCode</th>
				<th>Amount</th>
				<th>Payment Date</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (TransactionEntity transaction : transactions) {
			%>
			<tr>
				<td><%=transaction.getTransactionId()%></td>
				<td><%=transaction.getRefcode()%></td>
				<td><%=transaction.getAuthCode()%></td>
				<td><%=transaction.getAmount()%></td>
				<td><%=transaction.getCreatedAt()%></td>
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
			const datatables = document.getElementById("trans");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [10,50,100,200,'All' ],
				perPage: 10
			});
		})
	</script>
</main>
</body>
</html>