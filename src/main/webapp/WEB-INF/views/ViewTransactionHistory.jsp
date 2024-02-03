<%@page import="com.arth.entity.TransactionEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Transaction History</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
</head>
<body>
<h2 align="center">List Past Transactions</h2>
<%
	List<TransactionEntity> transactions = (List<TransactionEntity>) request.getAttribute("transactions");
%>
	<table class="table table-borderd table-hover"> 
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
			}x
			%> 
		</tbody>
	</table>
</body>
</html>