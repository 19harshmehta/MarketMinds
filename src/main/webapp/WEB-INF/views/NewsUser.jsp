<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>News</title>
</head>
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>News</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">News</li>
        </ol>
      </nav>
    </div>
	<!-- News & Updates Traffic -->
    <div class="card" style="height:12rem;">
            <div class="row g-0">
              <div class="col-sm-3">
                <img style="height:12rem;" src="assets/img/card.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card with an image on left</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
              </div>
            </div>
     </div>      
     <div class="card" style="height:12rem;">
            <div class="row g-0">
              <div class="col-sm-3">
                <img style="height: 12rem;" src="assets/img/card.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-4">
                <div class="card-body">
                  <h5 class="card-title">Card with an image on left</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
              </div>
            </div>
     </div>   
 	<!-- End News & Updates -->
	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	
	
</body>
</html>