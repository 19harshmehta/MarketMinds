<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER DASHBOARD</title>
</head>
<body>
<%@include file="UserLayout.jsp" %>
<%
	List<EquityEntity> eqs = (List<EquityEntity>) request.getAttribute("eqs");
	%>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            <!-- User Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card sales-card">
				<div class="card-body">
                  <h5 class="card-title">Portfolio</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>145</h6>
                     
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End User Card -->

            <!-- Premium Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">
				<div class="card-body">
                  <h5 class="card-title">Alerts</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-person-check-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6>$3,264</h6>
                     
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Premium Card -->

            <!-- Subscription Card -->
            <div class="col-xxl-3 col-xl-12">

              <div class="card info-card customers-card">
				 <div class="card-body">
                  <h5 class="card-title">Subscriptions</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-bell"></i>
                    </div>
                    <div class="ps-3">
                      <h6>1244</h6>
                     
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Subscription Card -->
            
             <!-- Complain Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card sales-card">
				 <div class="card-body">
                  <h5 class="card-title">Complain</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-receipt"></i>
                    </div>
                    <div class="ps-3">
                      <h6>145</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Complain Card -->

            <!-- ListEquities -->








            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="card-body">
                  <h5 class="card-title">Equities<span></span></h5>

    
	<table class="table table-borderd table-hover" id="equityTable">
		<thead>
			<tr>
				<th>EquityId</th>
				<th>Name</th>
				<th>Symbol</th>
				<th>Price</th>
				<th>52H</th>
				<th>52L</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (EquityEntity eq : eqs) {
			%>
			<tr>
				<td><%=eq.getEquityId()%></td>
				<td><%=eq.getEquityName()%></td>
				<td><%=eq.getSymbol()%></td>
				<td><%=eq.getPrice()%></td>
				<td><%=eq.getHigh52()%></td>
				<td><%=eq.getLow52()%></td>
				<td><a href='/addequity/<%=eq.getEquityId()%>'>Add to portfolio</a></td>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>

                </div>

              </div>
            </div><!-- End Recent Sales -->

          

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

         

         

         
         

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->
  
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
<script>
		$(document).ready(function() {
			const datatables = document.getElementById("equityTable");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [10,20,50,100,200,'All' ],
				perPage: 10
			});
		})
	</script>
</body>

</html>