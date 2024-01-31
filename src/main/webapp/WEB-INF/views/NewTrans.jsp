<%@page import="java.util.Optional"%>
<%@page import="com.arth.entity.PlanEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marketminds | Payment</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<script src="https://js.stripe.com/v3/stripe.js"></script>
</head>
<body>
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">

<div class="pagetitle">
      <h1>Subscription</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active"><a href="upgradetopremium">Subscription</a> / Buy</li>
        </ol>
      </nav>
    </div>
<%
	PlanEntity plan = (PlanEntity) request.getAttribute("plan");
%>



		<div class="container" style="padding: 1rem; ">
			<div class="row justify-content-center">
				<div
					class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">



					<div class="card mb-3">

						<div class="card-body">

							<div class="pt-8 pb-4">
								<h5 class="card-title text-center pb-0 fs-4">Payment</h5>
								<p class="text-center small">Enter your card number to pay</p>
							</div>

							<form id="payment-form">
								

								<div class="col-12">
									<label for="title" class="form-label">Plan</label> <input
										class="form-control" type="text" value="<%=plan.getTitle()%>"
										name="title" disabled="disabled">
								</div><br>

								<div class="col-12">
									<label for="duration" class="form-label">Duration (months)</label> <input
										class="form-control" type="text"
										value="<%=plan.getDuration()%>" name="duration"
										disabled="disabled">
								</div>
								<br>
								<div class="col-12">
									<label for="amt" class="form-label">Amount</label> <input
										class="form-control" type="text" value="<%=plan.getAmount()%>"
										name="amt" disabled="disabled">
								</div><br>
								<div id="card-element"></div>
								<br>
								<button class="btn btn-primary w-100" type="submit">Pay</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>


<script type="text/javascript">

const stripe = Stripe('pk_test_51O4j86SJOPbiqQsfgOKxE5rL2jsM6bSwZ5YUa4r5toR8j9EFIkTZxDAjRf4OYyrML5HN8i2RKdmu4mtvG9n05Jnr00FtHh0MsX'); // Replace with your publishable key
const elements = stripe.elements();
const cardElement = elements.create('card');

cardElement.mount('#card-element');

const form = document.getElementById('payment-form');

form.addEventListener('submit', async (event) => {
    event.preventDefault();

    const { paymentMethod, error } = await stripe.createPaymentMethod({
        type: 'card',
        card: cardElement,
    });

    if (error) {
        // Handle error
        console.error("UI");
        console.error(error);
    } else {
        // Send paymentMethod.id to your server to complete the payment
        fetch('/charge', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ paymentMethodId: paymentMethod.id,planId:${plan.planId} }),
        })
        .then(response => response.json())
        .then(data => {
            console.log( data); 
            console.log(data.sucess);
            console.log(data["sucess"]);
            window.location.href="logout";            
            
            //
        })
        .catch((error) => {
            console.error(error);
        });
    }
});

</script>

</body>
</html>