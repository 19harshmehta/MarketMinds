<%@page import="com.arth.entity.FaqsEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>UserFaq</title>
</head>

<body>
<%@include file="UserLayout.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Faqs</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active">ListFaqs</li>
        </ol>
      </nav>
    </div>
    
   
	<%
	List<FaqsEntity> faqs =(List<FaqsEntity>) request.getAttribute("faqs");
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
                    <button class="accordion-button collapsed" data-bs-target="#faqsTwo-<%=faq.getFaqId() %>" type="button" data-bs-toggle="collapse">
                      <%=faq.getFaqId() %>) &nbsp; <%=faq.getQuestion() %>
                    </button>
                  </h2>
                  <div id="faqsTwo-<%=faq.getFaqId() %>" class="accordion-collapse collapse" data-bs-parent="#faq-group-2">
                    <div class="accordion-body">
                      <%=faq.getAnswer() %>
                    </div>
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