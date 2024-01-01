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
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Myportfolio</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">UserDashboard</a></li>
          <li class="breadcrumb-item active">MyPortfolio</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

	<%
	PortfolioEntity portfolios = (PortfolioEntity) request.getAttribute("portfolioData");
	List<PortfolioDetailDto> pfd = (List<PortfolioDetailDto>) request.getAttribute("pfd");
	//List<PortfolioDetailEntity> pfDetails = (List<PortfolioDetailEntity>) request.getAttribute("pfDetails");
	%>
	<table class="table table-borderd table-hover">
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
				<td style="color: green;"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub style="color: grey;"><%=Math.round(plper)%>%</sub></td>
				<%}else{ %>
				<td style="color: red;"><%=Math.round(profitinrs)%><br>&nbsp;&nbsp;<sub style="color: grey;"><%=Math.round(plper)%>%</sub></td>
				<%} %>
				<td><a class="btn btn-primary" href="settarget/<%=e.getEquityId()%>">Set Target</a>
				<!--  <button onClick="restructreu(<%//e.getEquityId()%>)">Restructure</button> --> 
				  <button type="button" onClick="restructreu(<%=e.getEquityId()%>)" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                Restructure
              </button>
				</td>
				
			</tr>
			        <%
			}
			//}
			%>
		</tbody>
	</table>
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Basic Modal</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    
                    
                    	<form method="post" action="" >
                    		
                    		Equity Name : <input type="text" name="equityName" id="eqName" value="<%//e.getEquityName()%>"/><br><Br>
                    		Quantity: <input type="text" name="qty"/><br><Br> 
                    		
                    					
                    	
                    	</form>
                     
            
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button class="btn btn-success">Update</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

            </div>
          </div>


  
  


  
  
  
  
  
          
          
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
 -->	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	
	
		function restructreu(eqId){
			alert(eqId);
/* 				alert(eqId);
				
				const apiUrl = "http://localhost:9000/getequitybyidforrest/"+eqId;

				// Make a DELETE request
				fetch(apiUrl, {
				  method: 'GET',
				  headers: {
				    'Content-Type': 'application/json',
				    // Add any additional headers if needed
				  },
				})
				  .then(response => {
				    if (!response.ok) {
				      throw new Error(`HTTP error! Status: ${response.status}`);
				    }
				    return response.json(); // or response.text() if the response is not JSON
				  })
				  .then(data => {
				    // Handle the response data
				    console.log('Success:', data);
				    
				    
				    
				  })
				  .catch(error => {
				    // Handle errors
				    console.error('Error:', error);
				  }); */
			$("#basicModal").modal("show");
		}
	</script>
	</main>
</body>
</html>