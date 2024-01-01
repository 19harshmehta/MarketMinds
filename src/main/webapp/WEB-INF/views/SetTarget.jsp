<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>

<body>
<%@include file="UserLayout.jsp" %>
 <main id="main" class="main">

    <div class="pagetitle">
      <h1>Set Target To Get Notify</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
        <li class="breadcrumb-item active">Set Target</li>
        </ol>
      </nav>
    </div>

		<div class="container">

                <div class="card-body">

                
                  <form action="savealert" method="post" class="row g-2 needs-validation" novalidate="">

                    <div class="col-12">
                      <label for="targetPrice" class="form-label">Enter yout Target Price:</label>
                      <input type="text" name="targetPrice" class="form-control" id="targetPrice" required="">
                      <div class="invalid-feedback">Please enter Targeted Price</div>
                    </div>
                    <div>
                    <input type="hidden" name="equityId" value="${equityId}">
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Set Target</button>
                    </div>
                  </form>

                </div>
              </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
</body>
</html>