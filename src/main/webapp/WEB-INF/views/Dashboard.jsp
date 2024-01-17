<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN DASHBOARD</title>
</head>
<body>
<%@include file="AdminLayout.jsp" %>
<%
	List<EquityEntity> eqs = (List<EquityEntity>) request.getAttribute("eqs");
	Integer activeUser = (Integer)request.getAttribute("activeUsers");
	Integer premiumU = (Integer)request.getAttribute("premiumU");
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
                  <h5 class="card-title">Users</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=activeUser %></h6>
                     
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End User Card -->

            <!-- Premium Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">
				<div class="card-body">
                  <h5 class="card-title">Premium Users</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-person-check-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6><%=premiumU %></h6>
                     
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



			<!-- Reports -->
            <div class="col-12">
              <div class="card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Reports</h5>

                  <!-- Line Chart -->
                  <div id="reportsChart"></div>

                  <script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'New Users',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'New User Premium',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Monthly Active Users',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->
			


            <!-- Equity -->
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
            </div><!-- End Equity -->

          

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

         <div class="card">
            <div class="card-body">
              <h5 class="card-title">Basic Modal</h5>
              <p>Toggle a working modal demo by clicking the button below. It will slide down and fade in from the top of the page</p>

              <!-- Basic Modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal">
                Basic Modal
              </button>
              <div class="modal fade" id="basicModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Basic Modal</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      Non omnis incidunt qui sed occaecati magni asperiores est mollitia. Soluta at et reprehenderit. Placeat autem numquam et fuga numquam. Tempora in facere consequatur sit dolor ipsum. Consequatur nemo amet incidunt est facilis. Dolorem neque recusandae quo sit molestias sint dignissimos.
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->

            </div>
          </div>
         
         

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