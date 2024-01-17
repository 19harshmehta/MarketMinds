<%@page import="com.arth.entity.FaqsEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<title>AdminFaq</title>
</head>

<body>
<%@include file="AdminLayout.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Faqs</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">ListFaqs</li>
        </ol>
      </nav>
    </div>
    <a class="bi bi-plus-lg btn btn-outline-primary" href="faqs"> Add Faqs</a>
    <br></br>
   
	<%
	List<FaqsEntity> faqs = (List<FaqsEntity>) request.getAttribute("faqs");
	%>
	<!-- F.A.Q Group 2 -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Frequently Asked Questions</h5>

              <div class="accordion accordion-flush" id="faq-group-2">
				<%
				for (FaqsEntity faq : faqs) {
				%>

                
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" data-bs-target="#faqsTwo-1" type="button" data-bs-toggle="collapse">
                      <%=faq.getFaqId() %>  <%=faq.getQuestion() %>
                    </button>
                  </h2>
                  <div id="faqsTwo-1" class="accordion-collapse collapse" data-bs-parent="#faq-group-2">
                    <div class="accordion-body">
                      <%=faq.getAnswer() %>
                    </div>
                    <a class="bi bi-trash btn btn-outline-danger" href="#"> Delete</a><br></br>
                  </div>
                </div>
                <%
                }
                %>
              </div>
                                
            </div>
          </div><!-- End F.A.Q-->
	

</body>
  
</html>