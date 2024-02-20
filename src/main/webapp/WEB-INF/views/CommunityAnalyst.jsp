<%@page import="com.arth.entity.CommunityEntity"%>
<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<title>Marketminds | List Community</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<style>
</style>
</head>

<body>
<%@include file="AnalystLayout.jsp" %>
<main id="main" class="main">
<div class="pagetitle">
      <h1>Community</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="analystdashboard">Home</a></li>
          <li class="breadcrumb-item active">Community Data</li>
        </ol>
      </nav>
    </div>

	<%
	List<CommunityEntity> cmts = (List<CommunityEntity>) request.getAttribute("cmts");
	Integer userId = (Integer)session.getAttribute("userId");
	%>
	<table class="table table-borderd table-hover" id="equityTable">
		<thead>
			<tr>
				<th>EquityId</th>
				<th>Comment</th>
				<th>Publish Date</th>
				<th>Analyst Name</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (CommunityEntity cmt : cmts) {
			%>
			<tr>
				<td><%=cmt.getEquityId() %></td>
				<td><%=cmt.getComment() %></td>
				<td><%=cmt.getPublishDate()%></td>
				<%if(cmt.getUser().getUserId() == userId) {%>
				<td style="background-color: yellow;"><%=cmt.getUser().getFirstName()%> <%=cmt.getUser().getLastName()%></td>
				<%}else{ %>
				<td><%=cmt.getUser().getFirstName()%> <%=cmt.getUser().getLastName()%></td>
				<%} %>
			</tr>
			<%
			}
			%>
		</tbody>

	</table>



	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const datatables = document.getElementById("equityTable");
			new simpleDatatables.DataTable(datatables, {
				perPageSelect : [20,50,100,200,'All' ],
				perPage: 20
			});
		})
	</script>
</main>
</body>

</html>