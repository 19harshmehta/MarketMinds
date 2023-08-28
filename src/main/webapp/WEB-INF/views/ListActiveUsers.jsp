<%@page import="com.arth.entity.UserEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MarketMinds | List Active Users</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
<h2 align="center">List Active Users</h2>
	<%
	List<UserEntity> users = (List<UserEntity>) request.getAttribute("users");
	%>
	<table class="table table-borderd table-hover"> 
		<thead>
			<tr>
				<th>UserId</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (UserEntity user : users) {
			%>
			<tr>
				<td><%=user.getUserId()%></td>
				<td><%=user.getFirstName()%></td>
				<td><%=user.getLastName()%></td>
				<td><%=user.getEmail()%></td>
				<td><a href="deleteuser/<%=user.getUserId()%>">Delete</a></td>
			</tr>
			<%
			}
			%> 
		</tbody>
	</table>

</body>
</html>