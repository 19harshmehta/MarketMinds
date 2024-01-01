<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>MarketMinds | Add Role </title>

</head>
<body>
<%@include file="AdminLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Add Role</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home / ListRole</a></li>
          <li class="breadcrumb-item active">AddRole</li>
        </ol>
      </nav>
    </div>

		<div class="container">

			
								<div class="card-body">


									<form class="row g-3 needs-validation" novalidate action="addrole" method="post">
										<div class="col-12">
											<label for="roleName" class="form-label">Role Name</label> <input
												type="text" name="roleName" class="form-control" id="roleName"
												required>
											<div class="invalid-feedback">Please, enter role type!</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Add Role</button>
										</div>
										<div class="col-12">
											
										</div>
									</form>

								</div>
							</div>
						</main>
</body>
</html>