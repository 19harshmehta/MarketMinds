<%@page import="com.arth.entity.CommunityEntity"%>
<%@page import="com.arth.entity.EqTechnicalEntity"%>
<%@page import="com.arth.entity.EquityEntity"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chart</title>
<link href="mystyle.css" rel="stylesheet">
<style>
  .blurred-content {
    filter: blur(5px); /* Adjust blur intensity as needed */

  }
  /* Style for the comments section */
        .comments-section {
            margin-top: 20px;
        }

        .comment {
            background-color: #f1f1f1;
            border-radius: 20px;
            padding: 10px;
            margin-bottom: 10px;
        }

        /* Style for the comment input form */
        .comment-input {
            margin-top: 20px;
        }

        .comment-input textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-bottom: 10px;
        }
</style>
</head>
<body >
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">
<% 
ArrayList<Double> prices = (ArrayList<Double>)request.getAttribute("prices");
ArrayList<String> date = (ArrayList<String>)request.getAttribute("dates");
EquityEntity eqs = (EquityEntity)request.getAttribute("eqs");
EqTechnicalEntity tech = (EqTechnicalEntity)request.getAttribute("tech");
%>
 <div class="pagetitle">
     
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
          <li class="breadcrumb-item active"><%=eqs.getEquityName() %></li>
        </ol>
      </nav>
       <h1 id="eqname"><%=eqs.getEquityName() %></h1>
       <p id="secname">Sector : <%=eqs.getIndustryName()%></p>
       <hr>
       <h1 id="price"><%=eqs.getPrice() %></h1>
       <div class="flex">
		   <div class="col-lg-2" style="margin-top: 31px; font-size:10.rem">
		    
		       <div>
		       <p><b>Day Range</b><br/>
		       	Low  : <%=eqs.getTodayLow()%><br/>
		       	High : <%=eqs.getTodayHigh()%><br/>
		       </p>
		       </div>
	
		       <div class="seperate">
		       <p><b>Open Close</b><br/>
		       	Open  : <%=eqs.getTodayOpen()%><br/>
		       	Close : <%=eqs.getTodayClose()%><br/>
		       </p>
		       </div>
		       
		       <div class="seperate">
		       <p><b>52 Week Range</b><br/>
		       	Low  : <%=eqs.getLow52()%><br/>
		       	High : <%=eqs.getHigh52()%><br/>
		       </p>
		   	   </div>
	      	</div>
	     
	       

<!-- Area Chart -->
              <div id="areaChart" class="col-lg-10"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  const series = {
                    "monthDataSeries1": {
                      "prices":
                    	<%=prices%>,
                      "dates": [
                    	  <%for(String x:date){%>
                    	    "<%=x%>",
                    	  <%}%>
                      ]
                    }
                  }
                  new ApexCharts(document.querySelector("#areaChart"), {
                    series: [{
                      name: "<%=eqs.getEquityName()%>",
                      data: series.monthDataSeries1.prices
                    }],
                    chart: {
                      type: 'area',
                      height: 350,
                      zoom: {
                        enabled: false
                      }
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      curve: 'straight'
                    },
                    subtitle: {
                      text: 'Price Movements',
                      align: 'left'
                    },
                    labels: series.monthDataSeries1.dates,
                    xaxis: {
                      type: 'date',
                    },
                    yaxis: {
                      opposite: true
                    },
                    legend: {
                      horizontalAlign: 'left'
                    }
                  }).render();
                });
              </script>
              <!-- End Area Chart -->
   	 	</div><!-- flexdiv -->	   	 	
   	 </div>
   	 <hr>
   	 <br><h3 class="detail"><b>Detail View</b></h3><br>
   	 <table class="table table-borderd table-hover" id="equityTable">
		<thead>
			
			<tr>
				<th>EquityName</th>
				<td><%=eqs.getEquityName() %></td>
				
				<th>IndustryName</th>
				<td><%=eqs.getIndustryName() %></td>
			</tr>
			
				<tr>
				<th>Symbol</th>
				<td><%=eqs.getSymbol() %></td>
				
				<th>Series</th>
				<td><%=eqs.getSeries() %></td>
			</tr>
	
			<tr>
				<th>Price</th>
				<td><%=eqs.getPrice()%></td>
				
				<th>Buy/Sell Indicator</th>
				<td><%=eqs.getBuysellInd()%></td>
			</tr>
				<tr>
				<th>Today Open</th>
				<td><%=eqs.getTodayOpen() %></td>
				
				<th>Today Close</th>
				<td><%=eqs.getTodayHigh() %></td>
			</tr>
			
			<tr>
				<th>Today High</th>
				<td><%=eqs.getTodayHigh() %></td>
				
				<th>Today Low</th>
				<td><%=eqs.getTodayLow() %></td>
			</tr>
			
			<tr>
				<th>52W High</th>
				<td><%=eqs.getHigh52() %></td>
				
				<th>52W Low</th>
				<td><%=eqs.getLow52() %></td>
			</tr>
			
			<tr>
				<th>RSI</th>
				<td class="blurred-content"><%=tech.getRsi()%></td>
				
				<th>MACD</th>
				<td class="blurred-content"><%=tech.getMacd()%></td>
			</tr>
		</thead>
	</table>
	<%List<CommunityEntity> cmts = (List)request.getAttribute("comments");%>
	<br><h3 class="detail"><b>News</b></h3><br>
	<br><h3 class="detail"><b>Community</b></h3><br>
	<div class="container my-5 py-5">
    <div class="row  justify-content-center">
      <div class="col-md-12 col-lg-12 col-xl-12">
        <div class="card">
          <div class="card-body p-4">
            <h4 class="text-center mb-4 pb-2">Community Post Your views here</h4>
<%for(CommunityEntity cmt : cmts){ %>
            <div class="row">
              <div class="col">
                <div class="d-flex flex-start">
                  <img class="rounded-circle shadow-1-strong me-3"
                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp" alt="avatar" width="65"
                    height="65" />
                  <div class="flex-grow-1 flex-shrink-1">
                    <div>
                      <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-1">
                         <%=cmt.getEquityId() %> <span class="small">- 2 hours ago</span>
                        </p>
                        <a href="#!"><i class="fas fa-reply fa-xs"></i><span class="small"> reply</span></a>
                      </div>
                      <p class="small mb-0">
                        <%=cmt.getComment()%>
                      </p>
                    </div>
                      </div>
                    </div>
                  </div>
                </div>
                <%} %>
              </div>
            </div>
          </div>
        </div>
      </div>
    

<!-- Comment Input Form -->
<div class="comment-input">
    <form action="postcommunity" method="post">
        <textarea class="form-control" name="comment" placeholder="Comment your thoughts on the above stock..."></textarea>
        <br>
        <input type="hidden" name="equityId" value="<%=eqs.getEquityId()%>"/>
        <button type="submit" class="btn btn-primary">Post</button>
    </form>
</div>

	
   	 
   </main>
</body>
</html>