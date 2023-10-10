<%@page import="com.arth.dto.PortfolioDetailDto"%>
<%@page import="com.arth.entity.PortfolioDetailEntity"%>
<%@page import="com.arth.entity.PortfolioEntity"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="com.arth.entity.PlanEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | MyPortfolio</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>

	<%
	PortfolioEntity portfolios = (PortfolioEntity) request.getAttribute("portfolioData");
	List<PortfolioDetailDto> pfd = (List<PortfolioDetailDto>) request.getAttribute("pfd");
	//List<PortfolioDetailEntity> pfDetails = (List<PortfolioDetailEntity>) request.getAttribute("pfDetails");
	%>
	<table class="table table-borderd table-hover">
		<thead>
			<tr>
				<th>Equity Name</th>
				<th>Last Trade Price</th>
				<th>Quantity</th>
				<th>Price Purchased</th>
				<th>Purchase Date</th>
				<th>Total Investment</th>
				<th>Current Market Value</th>
				<th>Current P&L</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (PortfolioDetailDto e : pfd) {
				//for(PortfolioDetailEntity pfd : pfDetails)
				//{
			%>
			<tr>

				<td><%=e.getEquityName()%></td>
				<td><%=e.getLastTradePrice() %></td>
				<td><%=e.getQty()%></td>
				<td><%=Math.round(e.getPurchasedPrice())%></td>
				<td><%=e.getPurchasedAt() %></td>
				<td><%=e.getTotalInvestment()%></td>
				<%
					Double profitinrs = e.getLastTradePrice()*e.getQty().doubleValue() - e.getTotalInvestment();
					Double plper = profitinrs / e.getTotalInvestment() *100; 
				%>
				<td><%=Math.round((e.getLastTradePrice()*e.getQty().doubleValue()))%></td>
				<% if(profitinrs > 0){ %>
				<td style="color: green;"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub style="color: grey;"><%=Math.round(plper)%>%</sub></td>
				<%}else{ %>
				<td style="color: red;"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub style="color: grey;"><%=Math.round(plper)%>%</sub></td>
				<%} %>
				
				
			</tr>
			<%
			}
			//}
			%>
		</tbody>
	</table>
</body>
</html>