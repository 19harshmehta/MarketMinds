<%@page import="com.arth.entity.SchedulerEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Scheduler Logs</title>
</head>
<body>
	<%
	List<SchedulerEntity> logs = (List<SchedulerEntity>) request.getAttribute("logs");
	%>
	<table class="table table-borderd table-hover"> 
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
				<td><%=log.getStatusInd()%></td>
			</tr>
			<%
			}
			%> 
		</tbody>
	</table>
</body>
</html>