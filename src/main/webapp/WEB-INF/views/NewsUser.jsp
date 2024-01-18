<%@page import="com.arth.entity.NewsEntity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marketminds | News</title>
<link href="assets/img/logo.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
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
    
    <%
    List<NewsEntity> news = (List<NewsEntity>) request.getAttribute("news");
    %>
    
    <%
    for(NewsEntity n : news){
    %>
	<!-- News & Updates Traffic -->
    <div class="card">
            <div class="row g-0">
              <div class="col-sm-3">
                <img style="height:12.5rem" src="<%=n.getUrlToImage()%>" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body" style="height: 200px; overflow-y: auto;">
                  <h5 class="card-title"><%=n.getTitle()%></h5>
                 	<p class="card-text">
                  		<%= n.getDescription().length() > 200 ? n.getDescription().substring(0, 200) + "..." : n.getDescription()%>
                        <span class="full-content" style="display:none;"><%= n.getDescription() %></span> 
                        <a href="#" class="read-more" onclick="toggleReadMore(this,event);">Read More</a>
					</p>
                  
                  <footer style="color:#798eb3">Published At : <%=n.getPublishedAt()%>&nbsp;&nbsp;&nbsp;Source : <%=n.getSource()%></footer>
                </div>
              </div>
            </div>
     </div>
 	<!-- End News & Updates -->
     <%
     	}
     %>
	</main>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script>
	    function toggleReadMore(element) {
	    	event.preventDefault(); // Prevent the default behavior of the anchor link
	        var fullContent = $(element).siblings('.full-content');
	        var readMoreLink = $(element);
	        var isExpanded = fullContent.is(':visible');
	
	        if (isExpanded) {
	            fullContent.hide();
	            readMoreLink.text('Read More');
	        } else {
	            fullContent.show();
	            readMoreLink.text('Read Less');
	        }
	    }
	</script>
	
</body>
</html>