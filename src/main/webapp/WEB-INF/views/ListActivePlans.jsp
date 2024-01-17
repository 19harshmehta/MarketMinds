<%@page import="com.arth.entity.PlanEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title></title>

</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Users</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">ListAllPlan</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="addplan"> Add Plan</a>
    <a class="bi bi-receipt btn btn-outline-primary" href="listplans"> All Plan</a>
    <a class="bi bi-receipt btn btn-outline-primary" href="listactiveplans"> Active Plan</a>
	<%
	List<PlanEntity> plans = (List<PlanEntity>) request.getAttribute("plans");
	%>

	<table class="table table-borderd table-hover" id="plans">  
		<thead>
			<tr>
				<th>PlanId</th>
				<th>Plan Title</th>
				<th>Duration (in months)</th>
				<th>Amount</th>
				<th>Tax</th>
				<th>Total (inc Tax)</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (PlanEntity plan : plans) {
			%>
			<tr>
				<td><%=plan.getPlanId()%></td>
				<td><%=plan.getTitle()%></td>
				<td><%=plan.getDuration()%></td>
				<td><%=plan.getAmount()%></td>
				<td><%=plan.getTax()%></td>
				<td><%=plan.getAmount() + plan.getTax() %></td>
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
			const datatables = document.getElementById("plans");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 5
			});
		})
	</script>
	
</body>
</html>