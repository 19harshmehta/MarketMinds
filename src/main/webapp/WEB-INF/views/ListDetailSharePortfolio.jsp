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
<title>MarketMinds | DetailHistory</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<%@include file="UserLayout.jsp" %>
	<%
    List<Object[]> eachShareData = (List<Object[]>) request.getAttribute("eachShareData");
	%>
	<main id="main" class="main">
	 <div class="pagetitle">
      <h1>My Portfolio  </h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">Each Share Transaction</li>
        </ol>
      </nav>
    </div>
    <a class="bi btn btn-outline-primary" href="/listmyportfolio?portfolioId=${param.portfolioId}"> Go Back To Portfolio</a>
		<table class="table table-borderd table-hover" id="myportfolio"> 
		<thead>
			<tr>
				<th>EqID</th>
				<th>Equity Name</th>
				<th>Buy/Sell History</th>
				<th>Quantity</th>
				<th>Price Purchased</th>
				<th>Purchase Date</th>
			</tr>
		</thead>
		<tbody>
			<% for (Object[] dataRow : eachShareData) { %>
            <tr>
                <td><%= dataRow[1] %></td>
                <td><%= dataRow[7] %></td>
                <td><%= dataRow[6] %></td>                
                <td><%= dataRow[5] %></td>
                <td><%= dataRow[3] %></td>
                <td><%= dataRow[4] %></td>
                <!-- Add more columns as needed -->
            </tr>
        <% } %>
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