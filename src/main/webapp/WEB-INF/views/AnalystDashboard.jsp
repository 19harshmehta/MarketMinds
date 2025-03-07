<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<title>Market Minds | AnalystDashboard</title>
</head>
<body>
<%@include file="AnalystLayout.jsp" %>
<%
	List<EquityEntity> eqs = (List<EquityEntity>) request.getAttribute("eqs");
	%>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="analystdashboard">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            

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
				<td><a href="chartanalyst?equityId=<%=eq.getEquityId()%>"><%=eq.getEquityName()%></a></td>
				<td><%=eq.getSymbol()%></td>
				<td><%=eq.getPrice()%></td>
				<td><%=eq.getHigh52()%></td>
				<td><%=eq.getLow52()%></td>
				<%if(eq.getBuysellInd().equals(1)){ %> 
				<td><a class="btn btn-success" href="setbuyind?equityId=<%=eq.getEquityId()%>">Buy</a> &nbsp;
				<a class="btn btn-outline-danger" href="setsellind?equityId=<%=eq.getEquityId()%>" >Sell</a></td>
				<%}else if(eq.getBuysellInd().equals(2)) {%>
				<td><a class="btn btn-outline-success" href="setbuyind?equityId=<%=eq.getEquityId()%>">Buy</a> &nbsp;
				<a class="btn btn-danger" href="setsellind?equityId=<%=eq.getEquityId()%>" >Sell</a></td>
				<%}else { %>
				<td><a class="btn btn-outline-success" href="setbuyind?equityId=<%=eq.getEquityId()%>">Buy</a> &nbsp;
				<a class="btn btn-outline-danger" href="setsellind?equityId=<%=eq.getEquityId()%>" >Sell</a></td>
				<%} %>
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