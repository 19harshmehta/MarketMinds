<%@page import="com.arth.entity.PlanEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Choose Plan</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
</head>
<body>
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">

<div class="pagetitle">
      <h1>Subscription</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">Subscription</li>
        </ol>
      </nav>
    </div>

				<%
	List<PlanEntity> plans = (List<PlanEntity>) request.getAttribute("plans");
	%>
	<table  class="table table-borderd table-hover" id="plans" > 
		<thead>
			<tr>
				<th>Plan Title</th>
				<th>Duration (in months)</th>
				<th>Amount</th>
				<th>Action</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			for (PlanEntity plan : plans) {
				
				if(plan.getActiveInd().equals(0)) {
			%>
			<tr>
				<td><%=plan.getTitle()%></td>
				<td><%=plan.getDuration()%></td>
				<td><%=plan.getAmount()%></td>
				<td><a class="btn btn-outline-primary" href='/plan?planId=<%=plan.getPlanId()%>'>Buy Now</a></td>
			</tr>
				<%}//end if
			}//end for
			%> 
		</tbody>
	</table>
	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
		
		<script>
		$(document).ready(function() {
			const datatables = document.getElementById("plans");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 5
			});
		})
	</script>
</body>
</html>