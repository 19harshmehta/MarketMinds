<%@page import="com.arth.entity.PortfolioEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<title>Marketminds | ListPortfolio</title>

</head>

<body>
<%@include file="UserLayout.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Portfolio</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">Portfolio</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="createportfolio">Create Portfolio</a>
   
	<%
	List<PortfolioEntity> portfolio = (List<PortfolioEntity>) request.getAttribute("portfolios");
	%>
	<table class="table table-borderd table-hover" id="portfolio"> 
		<thead>
			<tr>
				
				<th>PortfolioName</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (PortfolioEntity p : portfolio) {
			%>
			<tr>
				
				<td><%=p.getPortfolioName()%></td>
				<td><a class="bi bi-eye btn btn-outline-primary" href="listmyportfolio?portfolioId=<%=p.getPortfolioId()%>"> View</a> 
				<a class="bi bi-pencil btn btn-outline-success" href="#"> Edit</a>
				<a class="bi bi-trash btn btn-outline-danger" href="#"> Delete</a></td>
			</tr>
			<%
			}
			%> 
		</tbody>
	</table>
	</main>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("portfolio");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [5,10,50,'All' ],
				perPage: 20
			});
		})
	</script>


</body>
</html>