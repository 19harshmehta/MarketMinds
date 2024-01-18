<%@page import="com.arth.entity.SchedulerEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Scheduler Logs</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">
<div class="pagetitle">
      <h1>Scheduled Action Logs</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
          <li class="breadcrumb-item active">Schedule Action Logs</li>
        </ol>
      </nav>
    </div>

	<%
	List<SchedulerEntity> logs = (List<SchedulerEntity>) request.getAttribute("logs");
	%>
	<table class="table table-borderd table-hover" id="logs"> 
		<thead>
			<tr>
				<th>Scheduler Log</th>
				<th>Date / Time</th>
				<th>Scheduler Name</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (SchedulerEntity log : logs) {
			%>
			<tr>
				<td><%=log.getSchedularId()%></td>
				<td><%=log.getScheduleLogTime()%></td>
				<td><%=log.getSchedulerName()%></td>
				<%if(log.getStatusInd().equals(0)) {%>
				<td><b class="text-success">Completed</b></td>
				<%}else{ %>
				<td><b class="text-danger">Terminated</b></td>
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
			const datatables = document.getElementById("logs");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [10,50,100,200,'All' ],
				perPage: 10
			});
		})
	</script>
</main>
</body>
</html>