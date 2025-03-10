<%@page import="com.arth.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<title>User My Profile | Marketminds</title>
</head>
<body>
<%String flag = (String)request.getAttribute("update");%>
	<%@include file="UserLayout.jsp" %>
	<main id="main" class="main">
	
	<%if(flag=="updated"){ %>
	<div id="myAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle me-1"></i>
                <strong>Your Data Has been updated sucessfully.</strong> Please Login Again to view Updated data
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<%} %>
		

		<script>
		    document.addEventListener('DOMContentLoaded', function () {
		        // Get the alert element
		        var myAlert = document.getElementById('myAlert');
		        // Use setTimeout to wait for 3 seconds and then hide the alert with opacity transition
		        setTimeout(function () {
		            myAlert.style.transition = 'opacity 0.5s';
		            myAlert.style.opacity = '0';
		            // After the transition is complete, hide the alert
		            myAlert.addEventListener('transitionend', function () {
		                myAlert.style.display = 'none';
		            });
		        }, 5000);
		    });
		</script>
	    <div class="pagetitle">
	      <h1>Profile</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
	          <li class="breadcrumb-item active">My Profile</li>
	        </ol>
	      </nav>
	    </div>
	    <%
                        UserEntity u = (UserEntity) session.getAttribute("user");
                        if (u != null) {
		%>
	    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
              <h2><%=user.getFirstName() %> <%=user.getLastName()%></h2>
              <!-- <h3>Web Designer</h3> -->
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                </li>

               <!--  <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li> -->

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  
                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                    <div class="col-lg-9 col-md-8"><%=user.getFirstName() %> <%=user.getLastName()%></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8"><%=user.getEmail() %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">User Status</div>
                    <% if(user.getPremiumInd() == 0){ %>
                    <div class="col-lg-9 col-md-8">Normal</div>
                    <%}else{%>
                    <div class="col-lg-9 col-md-8">Premium</div>
                    <%} %>
                   </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Role</div>
                    <div class="col-lg-9 col-md-8">User</div>
                  </div>

             
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form method="post" action="updateuser">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="assets/img/profile-img.jpg" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="firstName" class="col-md-4 col-lg-3 col-form-label">First Name</label>
                      <div class="col-md-8 col-lg-9">
                      <input type="hidden" name="userId" value="<%=user.getUserId()%>"/>
                        <input name="firstName" type="text" class="form-control" id="firstName" value="<%=user.getFirstName()%>">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="lastName" class="col-md-4 col-lg-3 col-form-label">Last Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="lastName" type="text" class="form-control" id="lastName" value="<%=user.getLastName()%>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="email" class="form-control" id="Email" value="<%=user.getEmail() %>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="twitter" type="text" class="form-control" id="Twitter" value="https://twitter.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="facebook" type="text" class="form-control" id="Facebook" value="https://facebook.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="instagram" type="text" class="form-control" id="Instagram" value="https://instagram.com/#">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="linkedin" type="text" class="form-control" id="Linkedin" value="https://linkedin.com/#">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary" onClick="profileUpdate()">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-settings">

                  <!-- Settings Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="changesMade" checked>
                          <label class="form-check-label" for="changesMade">
                            Changes made to your account
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="newProducts" checked>
                          <label class="form-check-label" for="newProducts">
                            Information on new products and services
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="proOffers">
                          <label class="form-check-label" for="proOffers">
                            Marketing and promo offers
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                          <label class="form-check-label" for="securityNotify">
                            Security alerts
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End settings Form -->

              </div> <!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
	    <%} %>
	    
	    
	    <script>
	    	function profileUpdate(){
	    		myAlert = document.getElementById("myAlert");
	    		
	    	}
	    </script>
	    
	    
	</main>
</body>
</html>