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
<%
	PlanEntity plan = (PlanEntity) request.getAttribute("plan");
%>

	<form id="payment-form">
	
	PlanID:<input type="text" value="<%=plan.getPlanId()%>" name="planId" disabled="disabled">
	PlanNAme:<input type="text" value="<%=plan.getTitle()%>" name="title" disabled="disabled">
	Duration:<input type="text" value="<%=plan.getDuration()%>" name="duration" disabled="disabled">
		<div id="card-element"></div>
		<button type="submit">Submit Payment</button>
	</form>



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