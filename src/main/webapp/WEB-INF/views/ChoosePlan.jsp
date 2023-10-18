<%@page import="com.arth.entity.PlanEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | Choose Plan</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
</head>
<body>
<h2>Choose Plan</h2>
				<%
	List<PlanEntity> plans = (List<PlanEntity>) request.getAttribute("plans");
	%>
	<table class="table table-borderd table-hover"> 
		<thead>
			<tr>
				<th>Plan Title</th>
				<th>Duration (in months)</th>
				<th>Amount</th>
				
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
				<td><a href='/plan/<%=plan.getPlanId()%>'>Buy Now</a></td>
			</tr>
				<%}//end if
			}//end for
			%> 
		</tbody>
	</table>
</body>
</html>