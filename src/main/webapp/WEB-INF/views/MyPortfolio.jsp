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
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<title>MarketMinds | MyPortfolio</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<%@include file="UserLayout.jsp" %>
	<%
	PortfolioEntity portfolios = (PortfolioEntity) request.getAttribute("portfolioData");
	List<PortfolioDetailDto> pfd = (List<PortfolioDetailDto>) request.getAttribute("pfd");
	//List<PortfolioDetailEntity> pfDetails = (List<PortfolioDetailEntity>) request.getAttribute("pfDetails");
	%>
	<main id="main" class="main">
	 <div class="pagetitle">
      <h1>My Portfolio  </h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">My Portfolio</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="/listequity?portfolioId=${param.portfolioId}"> Add Equity</a>
		<table class="table table-borderd table-hover" id="myportfolio"> 
		<thead>
			<tr>
				<th>EqID</th>
				<th>Equity Name</th>
				<th>Last Trade Price</th>
				<th>Quantity</th>
				<th>Price Purchased</th>
				<th>Purchase Date</th>
				<th>Total Investment</th>
				<th>Current Market Value</th>
				<th>Current P&L</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (PortfolioDetailDto e : pfd) {
				//for(PortfolioDetailEntity pfd : pfDetails)
				//{
			%>
			<tr>
				<td><%=e.getEquityId() %></td>
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
				<td class="text-success"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub class="text-success"><%=Math.round(plper)%>%</sub></td>
				<%}else{ %>
				<td class="text-danger"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub class="text-danger"><%=Math.round(plper)%>%</sub></td>
				<%} %>
				<td><a class="btn btn-outline-primary" href='/settarget?equityId=<%=e.getEquityId()%>'>Set Target</a>
				<!-- Basic Modal -->
              <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
    <a style="text-decoration: none; color: inherit;" href='#' onclick="setEqId(<%=e.getEquityId()%>)">Restructure</a>
</button>
</td>
			</tr>
			<%
			}
			//}
			%>
		</tbody>
	</table>
	
	<div class="card-body">
             	<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Basic Modal</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    	<form action="restructure" method="post">
					
					<div class="form-group">
					        <label for="title">Enter Quantity: </label>
					        <input type="number" id="title" name="qty" required><br><br>
					</div>	
					<div class="form-group">
					        <label for="price">Enter Price: </label>
					        <input type="number" id="price" name="price" required><br><br>
					        <input type="hidden" id="equityId" name="equityId" value="${equityId}">
					        <input type="hidden" id="portfolioId" name="portfolioId" value="${param.portfolioId}">

					</div>	 
					
					<div class="form-group">
					        <label for="pdate">Purchase Date: </label>
					        <input type="date" id="pdate" name="purchasedAt" required><br><br>
					</div>	 
					<div class="form-group">
					        <input type="radio" name="bsInd" value="buy" required>&nbsp;Bought&nbsp;&nbsp;<input type="radio" name="bsInd" value="sell" required>Sold<br><br>
					</div>
	 			<!-- <input type="submit" value="Add Equity" class="btn btn-success"/> -->
	 			  
                    
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <input type="submit" value="Save Changes" class="btn btn-success"/>
                    </div>
                  </form>
                  </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

            </div>
	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
		
		<script>
		$(document).ready(function() {
			const datatables = document.getElementById("myportfolio");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 20
			});
		})
		
		
		function setEqId(eqId){
			equityId.value = eqId;
 		}
	</script>
</body>
</html>