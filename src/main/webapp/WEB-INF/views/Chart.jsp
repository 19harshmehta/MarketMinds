<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chart</title>
</head>
<body >
<%@include file="UserLayout.jsp" %>
<main id="main" class="main">
<% 
ArrayList<Double> prices = (ArrayList<Double>)request.getAttribute("prices");
ArrayList<String> date = (ArrayList<String>)request.getAttribute("dates");

%>
<!-- Area Chart -->
              <div id="areaChart" ></div>

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
                      name: "STOCK ABC",
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
              </main>
</body>
</html>