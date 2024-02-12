<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link href="assets/img/logo.png" rel="icon">
<title>MarketMinds</title>
  
</head>

<body>

  	<%@include file="AdminLayout.jsp" %>
	<main>
		<div class="container">

			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div
							class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							
							<!-- End Logo -->

							<div class="card mb-3">

								<div class="card-body">

									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Add User</h5>
										<p class="text-center small">Enter user details
											to create account</p>
									</div>

									<form class="row g-3 needs-validation" novalidate action="saveuser" method="post">
										<div class="col-12">
											<label for="firstName" class="form-label">First Name</label> <input
												type="text" name="firstName" class="form-control" id="firstName"
												required>
											<div class="invalid-feedback">Please, enter your first name!</div>
										</div>
										
										<div class="col-12">
											<label for="lastName" class="form-label">Last Name</label> <input
												type="text" name="lastName" class="form-control" id="lastName"
												required>
											<div class="invalid-feedback">Please, enter your last name!</div>
										</div>

										<div class="col-12">
											<label for="email" class="form-label">Your Email</label>
											<input type="email" name="email" class="form-control"
												id="email" required>
											<div class="invalid-feedback">Please enter a valid
												Email adddress!</div>
										</div>


										<div class="col-12">
											<label for="password" class="form-label">Password</label>
											<input type="password" name="password" class="form-control"
												id="password" required>
											<div class="invalid-feedback">Please enter your
												password!</div>
										</div>

										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" name="terms" type="checkbox"
													value="" id="acceptTerms" required> <label
													class="form-check-label" for="acceptTerms">I agree
													and accept the <a href="#">terms and conditions</a>
												</label>
												<div class="invalid-feedback">You must agree before
													submitting.</div>
											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Add User</button>
										</div>
										<div class="col-12">
											
										</div>
									</form>

								</div>
							</div>

							<div class="credits">
								<!-- All the links in the footer should remain intact. -->
								<!-- You can delete the links only if you purchased the pro version. -->
								<!-- Licensing information: https://bootstrapmade.com/license/ -->
								<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
								<!-- Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
							</div>

						</div>
					</div>
				</div>

			</section>

		</div>
	</main>
	<!-- End #main -->

</body>

</html>