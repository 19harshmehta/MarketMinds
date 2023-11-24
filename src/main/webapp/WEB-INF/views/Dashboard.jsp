<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Dashboard - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Sales <span>| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>145</h6>
											<span class="text-success small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Revenue <span>| This Month</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>$3,264</h6>
											<span class="text-success small pt-1 fw-bold">8%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card customers-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Customers <span>| This Year</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>1244</h6>
											<span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span>

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Reports <span>/Today</span>
									</h5>

									<!-- Line Chart -->
									<div id="reportsChart" style="min-height: 365px;">
										<div id="apexchartsg4swbr0h"
											class="apexcharts-canvas apexchartsg4swbr0h apexcharts-theme-light"
											style="width: 1119px; height: 350px;">
											<svg id="SvgjsSvg3370" width="1119" height="350"
												xmlns="http://www.w3.org/2000/svg" version="1.1"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xmlns:svgjs="http://svgjs.dev"
												class="apexcharts-svg apexcharts-zoomable"
												xmlns:data="ApexChartsNS" transform="translate(0, 0)"
												style="background: transparent;">
												<foreignObject x="0" y="0" width="1119" height="350">
												<div
													class="apexcharts-legend apexcharts-align-center apx-legend-position-bottom"
													xmlns="http://www.w3.org/1999/xhtml"
													style="inset: auto 0px 1px; position: absolute; max-height: 175px;">
													<div class="apexcharts-legend-series" rel="1"
														seriesname="Sales" data:collapsed="false"
														style="margin: 2px 5px;">
														<span class="apexcharts-legend-marker" rel="1"
															data:collapsed="false"
															style="background: rgb(65, 84, 241) !important; color: rgb(65, 84, 241); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
															class="apexcharts-legend-text" rel="1" i="0"
															data:default-text="Sales" data:collapsed="false"
															style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Sales</span>
													</div>
													<div class="apexcharts-legend-series" rel="2"
														seriesname="Revenue" data:collapsed="false"
														style="margin: 2px 5px;">
														<span class="apexcharts-legend-marker" rel="2"
															data:collapsed="false"
															style="background: rgb(46, 202, 106) !important; color: rgb(46, 202, 106); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
															class="apexcharts-legend-text" rel="2" i="1"
															data:default-text="Revenue" data:collapsed="false"
															style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Revenue</span>
													</div>
													<div class="apexcharts-legend-series" rel="3"
														seriesname="Customers" data:collapsed="false"
														style="margin: 2px 5px;">
														<span class="apexcharts-legend-marker" rel="3"
															data:collapsed="false"
															style="background: rgb(255, 119, 29) !important; color: rgb(255, 119, 29); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
															class="apexcharts-legend-text" rel="3" i="2"
															data:default-text="Customers" data:collapsed="false"
															style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Customers</span>
													</div>
												</div>
												<style type="text/css">
.apexcharts-legend {
	display: flex;
	overflow: auto;
	padding: 0 10px;
}

.apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top
	{
	flex-wrap: wrap
}

.apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left
	{
	flex-direction: column;
	bottom: 0;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-left,
	.apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left
	{
	justify-content: flex-start;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-center {
	justify-content: center;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-right {
	justify-content: flex-end;
}

.apexcharts-legend-series {
	cursor: pointer;
	line-height: normal;
}

.apexcharts-legend.apx-legend-position-bottom .apexcharts-legend-series,
	.apexcharts-legend.apx-legend-position-top .apexcharts-legend-series {
	display: flex;
	align-items: center;
}

.apexcharts-legend-text {
	position: relative;
	font-size: 14px;
}

.apexcharts-legend-text *, .apexcharts-legend-marker * {
	pointer-events: none;
}

.apexcharts-legend-marker {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin-right: 3px;
	border-style: solid;
}

.apexcharts-legend.apexcharts-align-right .apexcharts-legend-series,
	.apexcharts-legend.apexcharts-align-left .apexcharts-legend-series {
	display: inline-block;
}

.apexcharts-legend-series.apexcharts-no-click {
	cursor: auto;
}

.apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series
	{
	display: none !important;
}

.apexcharts-inactive-legend {
	opacity: 0.45;
}
</style></foreignObject>
												<rect id="SvgjsRect3376" width="0" height="0" x="0" y="0"
													rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
													stroke-dasharray="0" fill="#fefefe"></rect>
												<g id="SvgjsG3495" class="apexcharts-yaxis" rel="0"
													transform="translate(15.635351181030273, 0)">
												<g id="SvgjsG3496" class="apexcharts-yaxis-texts-g">
												<text id="SvgjsText3498"
													font-family="Helvetica, Arial, sans-serif" x="20" y="31.5"
													text-anchor="end" dominant-baseline="auto" font-size="11px"
													font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3499">100</tspan>
												<title>100</title></text>
												<text id="SvgjsText3501"
													font-family="Helvetica, Arial, sans-serif" x="20"
													y="85.63599990844726" text-anchor="end"
													dominant-baseline="auto" font-size="11px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3502">80</tspan>
												<title>80</title></text>
												<text id="SvgjsText3504"
													font-family="Helvetica, Arial, sans-serif" x="20"
													y="139.77199981689452" text-anchor="end"
													dominant-baseline="auto" font-size="11px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3505">60</tspan>
												<title>60</title></text>
												<text id="SvgjsText3507"
													font-family="Helvetica, Arial, sans-serif" x="20"
													y="193.90799972534177" text-anchor="end"
													dominant-baseline="auto" font-size="11px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3508">40</tspan>
												<title>40</title></text>
												<text id="SvgjsText3510"
													font-family="Helvetica, Arial, sans-serif" x="20"
													y="248.04399963378904" text-anchor="end"
													dominant-baseline="auto" font-size="11px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3511">20</tspan>
												<title>20</title></text>
												<text id="SvgjsText3513"
													font-family="Helvetica, Arial, sans-serif" x="20"
													y="302.1799995422363" text-anchor="end"
													dominant-baseline="auto" font-size="11px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-yaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3514">0</tspan>
												<title>0</title></text></g></g>
												<g id="SvgjsG3372"
													class="apexcharts-inner apexcharts-graphical"
													transform="translate(45.63535118103027, 30)">
												<defs id="SvgjsDefs3371">
												<clipPath id="gridRectMaskg4swbr0h">
												<rect id="SvgjsRect3381" width="1069.3646488189697"
													height="272.6799995422363" x="-3" y="-1" rx="0" ry="0"
													opacity="1" stroke-width="0" stroke="none"
													stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<clipPath id="forecastMaskg4swbr0h"></clipPath>
												<clipPath id="nonForecastMaskg4swbr0h"></clipPath>
												<clipPath id="gridRectMarkerMaskg4swbr0h">
												<rect id="SvgjsRect3382" width="1111.3646488189697"
													height="318.6799995422363" x="-24" y="-24" rx="0" ry="0"
													opacity="1" stroke-width="0" stroke="none"
													stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<linearGradient id="SvgjsLinearGradient3400" x1="0" y1="0"
													x2="0" y2="1">
												<stop id="SvgjsStop3401" stop-opacity="0.3"
													stop-color="rgba(65,84,241,0.3)" offset="0"></stop>
												<stop id="SvgjsStop3402" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop>
												<stop id="SvgjsStop3403" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient>
												<linearGradient id="SvgjsLinearGradient3422" x1="0" y1="0"
													x2="0" y2="1">
												<stop id="SvgjsStop3423" stop-opacity="0.3"
													stop-color="rgba(46,202,106,0.3)" offset="0"></stop>
												<stop id="SvgjsStop3424" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop>
												<stop id="SvgjsStop3425" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient>
												<linearGradient id="SvgjsLinearGradient3444" x1="0" y1="0"
													x2="0" y2="1">
												<stop id="SvgjsStop3445" stop-opacity="0.3"
													stop-color="rgba(255,119,29,0.3)" offset="0"></stop>
												<stop id="SvgjsStop3446" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="0.9"></stop>
												<stop id="SvgjsStop3447" stop-opacity="0.4"
													stop-color="rgba(255,255,255,0.4)" offset="1"></stop></linearGradient></defs>
												<line id="SvgjsLine3377" x1="0" y1="0" x2="0"
													y2="270.6799995422363" stroke="#b6b6b6"
													stroke-dasharray="3" stroke-linecap="butt"
													class="apexcharts-xcrosshairs" x="0" y="0" width="1"
													height="270.6799995422363" fill="#b1b9c4" filter="none"
													fill-opacity="0.9" stroke-width="1"></line>
												<line id="SvgjsLine3454" x1="0" y1="271.6799995422363"
													x2="0" y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3455" x1="163.5945613567646"
													y1="271.6799995422363" x2="163.5945613567646"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3456" x1="327.1891227135292"
													y1="271.6799995422363" x2="327.1891227135292"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3457" x1="490.78368407029376"
													y1="271.6799995422363" x2="490.78368407029376"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3458" x1="654.3782454270583"
													y1="271.6799995422363" x2="654.3782454270583"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3459" x1="817.972806783823"
													y1="271.6799995422363" x2="817.972806783823"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<line id="SvgjsLine3460" x1="981.5673681405876"
													y1="271.6799995422363" x2="981.5673681405876"
													y2="277.6799995422363" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-xaxis-tick"></line>
												<g id="SvgjsG3450" class="apexcharts-grid">
												<g id="SvgjsG3451" class="apexcharts-gridlines-horizontal">
												<line id="SvgjsLine3462" x1="0" y1="54.13599990844726"
													x2="1063.3646488189697" y2="54.13599990844726"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line>
												<line id="SvgjsLine3463" x1="0" y1="108.27199981689452"
													x2="1063.3646488189697" y2="108.27199981689452"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line>
												<line id="SvgjsLine3464" x1="0" y1="162.40799972534177"
													x2="1063.3646488189697" y2="162.40799972534177"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line>
												<line id="SvgjsLine3465" x1="0" y1="216.54399963378904"
													x2="1063.3646488189697" y2="216.54399963378904"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line></g>
												<g id="SvgjsG3452" class="apexcharts-gridlines-vertical"></g>
												<line id="SvgjsLine3468" x1="0" y1="270.6799995422363"
													x2="1063.3646488189697" y2="270.6799995422363"
													stroke="transparent" stroke-dasharray="0"
													stroke-linecap="butt"></line>
												<line id="SvgjsLine3467" x1="0" y1="1" x2="0"
													y2="270.6799995422363" stroke="transparent"
													stroke-dasharray="0" stroke-linecap="butt"></line></g>
												<g id="SvgjsG3453" class="apexcharts-grid-borders">
												<line id="SvgjsLine3461" x1="0" y1="0"
													x2="1063.3646488189697" y2="0" stroke="#e0e0e0"
													stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line>
												<line id="SvgjsLine3466" x1="0" y1="270.6799995422363"
													x2="1063.3646488189697" y2="270.6799995422363"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt"
													class="apexcharts-gridline"></line>
												<line id="SvgjsLine3494" x1="0" y1="271.6799995422363"
													x2="1063.3646488189697" y2="271.6799995422363"
													stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1"
													stroke-linecap="butt"></line></g>
												<g id="SvgjsG3383"
													class="apexcharts-area-series apexcharts-plot-series">
												<g id="SvgjsG3384" class="apexcharts-series"
													seriesName="Sales" data:longestSeries="true" rel="1"
													data:realIndex="0">
												<path id="SvgjsPath3404"
													d="M 0 270.6799995422363 L 0 186.76919968414308C 85.88714471230139 186.76919968414308 159.50469732284546 162.40799972534177 245.39184203514685 162.40799972534177C 302.64993851001447 162.40799972534177 351.7283069170438 194.88959967041015 408.98640339191144 194.88959967041015C 466.24449986677905 194.88959967041015 515.3228682738085 132.6331997756958 572.580964748676 132.6331997756958C 629.8390612235436 132.6331997756958 678.917429630573 156.99439973449705 736.1755261054406 156.99439973449705C 793.4336225803081 156.99439973449705 842.5119909873375 48.72239991760253 899.7700874622051 48.72239991760253C 957.0281839370728 48.72239991760253 1006.106552344102 119.09919979858398 1063.3646488189697 119.09919979858398C 1063.3646488189697 119.09919979858398 1063.3646488189697 119.09919979858398 1063.3646488189697 270.6799995422363M 1063.3646488189697 119.09919979858398z"
													fill="url(#SvgjsLinearGradient3400)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
													stroke-dasharray="0" class="apexcharts-area" index="0"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 270.6799995422363 L 0 186.76919968414308C 85.88714471230139 186.76919968414308 159.50469732284546 162.40799972534177 245.39184203514685 162.40799972534177C 302.64993851001447 162.40799972534177 351.7283069170438 194.88959967041015 408.98640339191144 194.88959967041015C 466.24449986677905 194.88959967041015 515.3228682738085 132.6331997756958 572.580964748676 132.6331997756958C 629.8390612235436 132.6331997756958 678.917429630573 156.99439973449705 736.1755261054406 156.99439973449705C 793.4336225803081 156.99439973449705 842.5119909873375 48.72239991760253 899.7700874622051 48.72239991760253C 957.0281839370728 48.72239991760253 1006.106552344102 119.09919979858398 1063.3646488189697 119.09919979858398C 1063.3646488189697 119.09919979858398 1063.3646488189697 119.09919979858398 1063.3646488189697 270.6799995422363M 1063.3646488189697 119.09919979858398z"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"></path>
												<path id="SvgjsPath3405"
													d="M 0 186.76919968414308C 85.88714471230139 186.76919968414308 159.50469732284546 162.40799972534177 245.39184203514685 162.40799972534177C 302.64993851001447 162.40799972534177 351.7283069170438 194.88959967041015 408.98640339191144 194.88959967041015C 466.24449986677905 194.88959967041015 515.3228682738085 132.6331997756958 572.580964748676 132.6331997756958C 629.8390612235436 132.6331997756958 678.917429630573 156.99439973449705 736.1755261054406 156.99439973449705C 793.4336225803081 156.99439973449705 842.5119909873375 48.72239991760253 899.7700874622051 48.72239991760253C 957.0281839370728 48.72239991760253 1006.106552344102 119.09919979858398 1063.3646488189697 119.09919979858398"
													fill="none" fill-opacity="1" stroke="#4154f1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
													stroke-dasharray="0" class="apexcharts-area" index="0"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 186.76919968414308C 85.88714471230139 186.76919968414308 159.50469732284546 162.40799972534177 245.39184203514685 162.40799972534177C 302.64993851001447 162.40799972534177 351.7283069170438 194.88959967041015 408.98640339191144 194.88959967041015C 466.24449986677905 194.88959967041015 515.3228682738085 132.6331997756958 572.580964748676 132.6331997756958C 629.8390612235436 132.6331997756958 678.917429630573 156.99439973449705 736.1755261054406 156.99439973449705C 793.4336225803081 156.99439973449705 842.5119909873375 48.72239991760253 899.7700874622051 48.72239991760253C 957.0281839370728 48.72239991760253 1006.106552344102 119.09919979858398 1063.3646488189697 119.09919979858398"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"
													fill-rule="evenodd"></path>
												<g id="SvgjsG3385"
													class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
													data:realIndex="0">
												<g id="SvgjsG3387" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3388" r="4" cx="0"
													cy="186.76919968414308"
													class="apexcharts-marker no-pointer-events wazfn2mss"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="0" j="0"
													index="0" default-marker-size="4"></circle>
												<circle id="SvgjsCircle3389" r="4" cx="245.39184203514685"
													cy="162.40799972534177"
													class="apexcharts-marker no-pointer-events w8129qa0hi"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="1" j="1"
													index="0" default-marker-size="4"></circle></g>
												<g id="SvgjsG3390" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3391" r="4" cx="408.98640339191144"
													cy="194.88959967041015"
													class="apexcharts-marker no-pointer-events wxi84w998k"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="2" j="2"
													index="0" default-marker-size="4"></circle></g>
												<g id="SvgjsG3392" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3393" r="4" cx="572.580964748676"
													cy="132.6331997756958"
													class="apexcharts-marker no-pointer-events wjafdj3mah"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="3" j="3"
													index="0" default-marker-size="4"></circle></g>
												<g id="SvgjsG3394" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3395" r="4" cx="736.1755261054406"
													cy="156.99439973449705"
													class="apexcharts-marker no-pointer-events wm39gehah"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="4" j="4"
													index="0" default-marker-size="4"></circle></g>
												<g id="SvgjsG3396" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3397" r="4" cx="899.7700874622051"
													cy="48.72239991760253"
													class="apexcharts-marker no-pointer-events waj8a55o8"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="5" j="5"
													index="0" default-marker-size="4"></circle></g>
												<g id="SvgjsG3398" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3399" r="4" cx="1063.3646488189697"
													cy="119.09919979858398"
													class="apexcharts-marker no-pointer-events wfdmgba5t"
													stroke="#ffffff" fill="#4154f1" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="6" j="6"
													index="0" default-marker-size="4"></circle></g></g></g>
												<g id="SvgjsG3406" class="apexcharts-series"
													seriesName="Revenue" data:longestSeries="true" rel="2"
													data:realIndex="1">
												<path id="SvgjsPath3426"
													d="M 0 270.6799995422363 L 0 240.90519959259032C 85.88714471230139 240.90519959259032 159.50469732284546 184.0623996887207 245.39184203514685 184.0623996887207C 302.64993851001447 184.0623996887207 351.7283069170438 148.87399974822998 408.98640339191144 148.87399974822998C 466.24449986677905 148.87399974822998 515.3228682738085 184.0623996887207 572.580964748676 184.0623996887207C 629.8390612235436 184.0623996887207 678.917429630573 178.64879969787597 736.1755261054406 178.64879969787597C 793.4336225803081 178.64879969787597 842.5119909873375 129.92639978027344 899.7700874622051 129.92639978027344C 957.0281839370728 129.92639978027344 1006.106552344102 159.70119972991944 1063.3646488189697 159.70119972991944C 1063.3646488189697 159.70119972991944 1063.3646488189697 159.70119972991944 1063.3646488189697 270.6799995422363M 1063.3646488189697 159.70119972991944z"
													fill="url(#SvgjsLinearGradient3422)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
													stroke-dasharray="0" class="apexcharts-area" index="1"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 270.6799995422363 L 0 240.90519959259032C 85.88714471230139 240.90519959259032 159.50469732284546 184.0623996887207 245.39184203514685 184.0623996887207C 302.64993851001447 184.0623996887207 351.7283069170438 148.87399974822998 408.98640339191144 148.87399974822998C 466.24449986677905 148.87399974822998 515.3228682738085 184.0623996887207 572.580964748676 184.0623996887207C 629.8390612235436 184.0623996887207 678.917429630573 178.64879969787597 736.1755261054406 178.64879969787597C 793.4336225803081 178.64879969787597 842.5119909873375 129.92639978027344 899.7700874622051 129.92639978027344C 957.0281839370728 129.92639978027344 1006.106552344102 159.70119972991944 1063.3646488189697 159.70119972991944C 1063.3646488189697 159.70119972991944 1063.3646488189697 159.70119972991944 1063.3646488189697 270.6799995422363M 1063.3646488189697 159.70119972991944z"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"></path>
												<path id="SvgjsPath3427"
													d="M 0 240.90519959259032C 85.88714471230139 240.90519959259032 159.50469732284546 184.0623996887207 245.39184203514685 184.0623996887207C 302.64993851001447 184.0623996887207 351.7283069170438 148.87399974822998 408.98640339191144 148.87399974822998C 466.24449986677905 148.87399974822998 515.3228682738085 184.0623996887207 572.580964748676 184.0623996887207C 629.8390612235436 184.0623996887207 678.917429630573 178.64879969787597 736.1755261054406 178.64879969787597C 793.4336225803081 178.64879969787597 842.5119909873375 129.92639978027344 899.7700874622051 129.92639978027344C 957.0281839370728 129.92639978027344 1006.106552344102 159.70119972991944 1063.3646488189697 159.70119972991944"
													fill="none" fill-opacity="1" stroke="#2eca6a"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
													stroke-dasharray="0" class="apexcharts-area" index="1"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 240.90519959259032C 85.88714471230139 240.90519959259032 159.50469732284546 184.0623996887207 245.39184203514685 184.0623996887207C 302.64993851001447 184.0623996887207 351.7283069170438 148.87399974822998 408.98640339191144 148.87399974822998C 466.24449986677905 148.87399974822998 515.3228682738085 184.0623996887207 572.580964748676 184.0623996887207C 629.8390612235436 184.0623996887207 678.917429630573 178.64879969787597 736.1755261054406 178.64879969787597C 793.4336225803081 178.64879969787597 842.5119909873375 129.92639978027344 899.7700874622051 129.92639978027344C 957.0281839370728 129.92639978027344 1006.106552344102 159.70119972991944 1063.3646488189697 159.70119972991944"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"
													fill-rule="evenodd"></path>
												<g id="SvgjsG3407"
													class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
													data:realIndex="1">
												<g id="SvgjsG3409" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3410" r="4" cx="0"
													cy="240.90519959259032"
													class="apexcharts-marker no-pointer-events wrntli6wv"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="0" j="0"
													index="1" default-marker-size="4"></circle>
												<circle id="SvgjsCircle3411" r="4" cx="245.39184203514685"
													cy="184.0623996887207"
													class="apexcharts-marker no-pointer-events wpmhc2q3a"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="1" j="1"
													index="1" default-marker-size="4"></circle></g>
												<g id="SvgjsG3412" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3413" r="4" cx="408.98640339191144"
													cy="148.87399974822998"
													class="apexcharts-marker no-pointer-events w4pi2wthh"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="2" j="2"
													index="1" default-marker-size="4"></circle></g>
												<g id="SvgjsG3414" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3415" r="4" cx="572.580964748676"
													cy="184.0623996887207"
													class="apexcharts-marker no-pointer-events wzmp308nt"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="3" j="3"
													index="1" default-marker-size="4"></circle></g>
												<g id="SvgjsG3416" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3417" r="4" cx="736.1755261054406"
													cy="178.64879969787597"
													class="apexcharts-marker no-pointer-events w2da99d16"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="4" j="4"
													index="1" default-marker-size="4"></circle></g>
												<g id="SvgjsG3418" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3419" r="4" cx="899.7700874622051"
													cy="129.92639978027344"
													class="apexcharts-marker no-pointer-events w93o1zvmn"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="5" j="5"
													index="1" default-marker-size="4"></circle></g>
												<g id="SvgjsG3420" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3421" r="4" cx="1063.3646488189697"
													cy="159.70119972991944"
													class="apexcharts-marker no-pointer-events w5i4dqpnu"
													stroke="#ffffff" fill="#2eca6a" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="6" j="6"
													index="1" default-marker-size="4"></circle></g></g></g>
												<g id="SvgjsG3428" class="apexcharts-series"
													seriesName="Customers" data:longestSeries="true" rel="3"
													data:realIndex="2">
												<path id="SvgjsPath3448"
													d="M 0 270.6799995422363 L 0 230.07799961090086C 85.88714471230139 230.07799961090086 159.50469732284546 240.90519959259032 245.39184203514685 240.90519959259032C 302.64993851001447 240.90519959259032 351.7283069170438 184.0623996887207 408.98640339191144 184.0623996887207C 466.24449986677905 184.0623996887207 515.3228682738085 221.9575996246338 572.580964748676 221.9575996246338C 629.8390612235436 221.9575996246338 678.917429630573 246.31879958343504 736.1755261054406 246.31879958343504C 793.4336225803081 246.31879958343504 842.5119909873375 205.7167996520996 899.7700874622051 205.7167996520996C 957.0281839370728 205.7167996520996 1006.106552344102 240.90519959259032 1063.3646488189697 240.90519959259032C 1063.3646488189697 240.90519959259032 1063.3646488189697 240.90519959259032 1063.3646488189697 270.6799995422363M 1063.3646488189697 240.90519959259032z"
													fill="url(#SvgjsLinearGradient3444)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="0"
													stroke-dasharray="0" class="apexcharts-area" index="2"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 270.6799995422363 L 0 230.07799961090086C 85.88714471230139 230.07799961090086 159.50469732284546 240.90519959259032 245.39184203514685 240.90519959259032C 302.64993851001447 240.90519959259032 351.7283069170438 184.0623996887207 408.98640339191144 184.0623996887207C 466.24449986677905 184.0623996887207 515.3228682738085 221.9575996246338 572.580964748676 221.9575996246338C 629.8390612235436 221.9575996246338 678.917429630573 246.31879958343504 736.1755261054406 246.31879958343504C 793.4336225803081 246.31879958343504 842.5119909873375 205.7167996520996 899.7700874622051 205.7167996520996C 957.0281839370728 205.7167996520996 1006.106552344102 240.90519959259032 1063.3646488189697 240.90519959259032C 1063.3646488189697 240.90519959259032 1063.3646488189697 240.90519959259032 1063.3646488189697 270.6799995422363M 1063.3646488189697 240.90519959259032z"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"></path>
												<path id="SvgjsPath3449"
													d="M 0 230.07799961090086C 85.88714471230139 230.07799961090086 159.50469732284546 240.90519959259032 245.39184203514685 240.90519959259032C 302.64993851001447 240.90519959259032 351.7283069170438 184.0623996887207 408.98640339191144 184.0623996887207C 466.24449986677905 184.0623996887207 515.3228682738085 221.9575996246338 572.580964748676 221.9575996246338C 629.8390612235436 221.9575996246338 678.917429630573 246.31879958343504 736.1755261054406 246.31879958343504C 793.4336225803081 246.31879958343504 842.5119909873375 205.7167996520996 899.7700874622051 205.7167996520996C 957.0281839370728 205.7167996520996 1006.106552344102 240.90519959259032 1063.3646488189697 240.90519959259032"
													fill="none" fill-opacity="1" stroke="#ff771d"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
													stroke-dasharray="0" class="apexcharts-area" index="2"
													clip-path="url(#gridRectMaskg4swbr0h)"
													pathTo="M 0 230.07799961090086C 85.88714471230139 230.07799961090086 159.50469732284546 240.90519959259032 245.39184203514685 240.90519959259032C 302.64993851001447 240.90519959259032 351.7283069170438 184.0623996887207 408.98640339191144 184.0623996887207C 466.24449986677905 184.0623996887207 515.3228682738085 221.9575996246338 572.580964748676 221.9575996246338C 629.8390612235436 221.9575996246338 678.917429630573 246.31879958343504 736.1755261054406 246.31879958343504C 793.4336225803081 246.31879958343504 842.5119909873375 205.7167996520996 899.7700874622051 205.7167996520996C 957.0281839370728 205.7167996520996 1006.106552344102 240.90519959259032 1063.3646488189697 240.90519959259032"
													pathFrom="M -1 270.6799995422363 L -1 270.6799995422363 L 245.39184203514685 270.6799995422363 L 408.98640339191144 270.6799995422363 L 572.580964748676 270.6799995422363 L 736.1755261054406 270.6799995422363 L 899.7700874622051 270.6799995422363 L 1063.3646488189697 270.6799995422363"
													fill-rule="evenodd"></path>
												<g id="SvgjsG3429"
													class="apexcharts-series-markers-wrap apexcharts-hidden-element-shown"
													data:realIndex="2">
												<g id="SvgjsG3431" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3432" r="4" cx="0"
													cy="230.07799961090086"
													class="apexcharts-marker no-pointer-events w8x434gxn"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="0" j="0"
													index="2" default-marker-size="4"></circle>
												<circle id="SvgjsCircle3433" r="4" cx="245.39184203514685"
													cy="240.90519959259032"
													class="apexcharts-marker no-pointer-events wf0prhcbt"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="1" j="1"
													index="2" default-marker-size="4"></circle></g>
												<g id="SvgjsG3434" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3435" r="4" cx="408.98640339191144"
													cy="184.0623996887207"
													class="apexcharts-marker no-pointer-events wt3zuqhpal"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="2" j="2"
													index="2" default-marker-size="4"></circle></g>
												<g id="SvgjsG3436" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3437" r="4" cx="572.580964748676"
													cy="221.9575996246338"
													class="apexcharts-marker no-pointer-events wgmb7r511f"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="3" j="3"
													index="2" default-marker-size="4"></circle></g>
												<g id="SvgjsG3438" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3439" r="4" cx="736.1755261054406"
													cy="246.31879958343504"
													class="apexcharts-marker no-pointer-events w2tewutbf"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="4" j="4"
													index="2" default-marker-size="4"></circle></g>
												<g id="SvgjsG3440" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3441" r="4" cx="899.7700874622051"
													cy="205.7167996520996"
													class="apexcharts-marker no-pointer-events w6rqxpjd3"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="5" j="5"
													index="2" default-marker-size="4"></circle></g>
												<g id="SvgjsG3442" class="apexcharts-series-markers"
													clip-path="url(#gridRectMarkerMaskg4swbr0h)">
												<circle id="SvgjsCircle3443" r="4" cx="1063.3646488189697"
													cy="240.90519959259032"
													class="apexcharts-marker no-pointer-events wapzy7m1a"
													stroke="#ffffff" fill="#ff771d" fill-opacity="1"
													stroke-width="2" stroke-opacity="0.9" rel="6" j="6"
													index="2" default-marker-size="4"></circle></g></g></g>
												<g id="SvgjsG3386" class="apexcharts-datalabels"
													data:realIndex="0"></g>
												<g id="SvgjsG3408" class="apexcharts-datalabels"
													data:realIndex="1"></g>
												<g id="SvgjsG3430" class="apexcharts-datalabels"
													data:realIndex="2"></g></g>
												<line id="SvgjsLine3469" x1="0" y1="0"
													x2="1063.3646488189697" y2="0" stroke="#b6b6b6"
													stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"
													class="apexcharts-ycrosshairs"></line>
												<line id="SvgjsLine3470" x1="0" y1="0"
													x2="1063.3646488189697" y2="0" stroke-dasharray="0"
													stroke-width="0" stroke-linecap="butt"
													class="apexcharts-ycrosshairs-hidden"></line>
												<g id="SvgjsG3471" class="apexcharts-xaxis"
													transform="translate(0, 0)">
												<g id="SvgjsG3472" class="apexcharts-xaxis-texts-g"
													transform="translate(0, -4)">
												<text id="SvgjsText3474"
													font-family="Helvetica, Arial, sans-serif" x="0"
													y="299.6799995422363" text-anchor="middle"
													dominant-baseline="auto" font-size="12px" font-weight="400"
													fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3475">00:00</tspan>
												<title>00:00</title></text>
												<text id="SvgjsText3477"
													font-family="Helvetica, Arial, sans-serif"
													x="163.5945613567646" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3478">01:00</tspan>
												<title>01:00</title></text>
												<text id="SvgjsText3480"
													font-family="Helvetica, Arial, sans-serif"
													x="327.1891227135292" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3481">02:00</tspan>
												<title>02:00</title></text>
												<text id="SvgjsText3483"
													font-family="Helvetica, Arial, sans-serif"
													x="490.78368407029376" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3484">03:00</tspan>
												<title>03:00</title></text>
												<text id="SvgjsText3486"
													font-family="Helvetica, Arial, sans-serif"
													x="654.3782454270583" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3487">04:00</tspan>
												<title>04:00</title></text>
												<text id="SvgjsText3489"
													font-family="Helvetica, Arial, sans-serif"
													x="817.972806783823" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3490">05:00</tspan>
												<title>05:00</title></text>
												<text id="SvgjsText3492"
													font-family="Helvetica, Arial, sans-serif"
													x="981.5673681405876" y="299.6799995422363"
													text-anchor="middle" dominant-baseline="auto"
													font-size="12px" font-weight="400" fill="#373d3f"
													class="apexcharts-text apexcharts-xaxis-label "
													style="font-family: Helvetica, Arial, sans-serif;">
												<tspan id="SvgjsTspan3493">06:00</tspan>
												<title>06:00</title></text></g></g>
												<g id="SvgjsG3515" class="apexcharts-yaxis-annotations"></g>
												<g id="SvgjsG3516" class="apexcharts-xaxis-annotations"></g>
												<g id="SvgjsG3517" class="apexcharts-point-annotations"></g>
												<rect id="SvgjsRect3518" width="0" height="0" x="0" y="0"
													rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
													stroke-dasharray="0" fill="#fefefe"
													class="apexcharts-zoom-rect"></rect>
												<rect id="SvgjsRect3519" width="0" height="0" x="0" y="0"
													rx="0" ry="0" opacity="1" stroke-width="0" stroke="none"
													stroke-dasharray="0" fill="#fefefe"
													class="apexcharts-selection-rect"></rect></g></svg>
											<div class="apexcharts-tooltip apexcharts-theme-light">
												<div class="apexcharts-tooltip-title"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 1;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(65, 84, 241);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 2;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(46, 202, 106);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 3;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(255, 119, 29);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
											</div>
											<div
												class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light">
												<div class="apexcharts-xaxistooltip-text"
													style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
											</div>
											<div
												class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
												<div class="apexcharts-yaxistooltip-text"></div>
											</div>
										</div>
									</div>

									<script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Sales',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'Revenue',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Customers',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Recent Sales <span>| Today</span>
									</h5>

									<div
										class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
										<div class="datatable-top">
											<div class="datatable-dropdown">
												<label> <select class="datatable-selector"><option
															value="5">5</option>
														<option value="10" selected="">10</option>
														<option value="15">15</option>
														<option value="20">20</option>
														<option value="25">25</option></select> entries per page
												</label>
											</div>
											<div class="datatable-search">
												<input class="datatable-input" placeholder="Search..."
													type="search" title="Search within table">
											</div>
										</div>
										<div class="datatable-container">
											<table
												class="table table-borderless datatable datatable-table">
												<thead>
													<tr>
														<th data-sortable="true"
															style="width: 10.723860589812332%;"><button
																class="datatable-sorter">#</button></th>
														<th data-sortable="true"
															style="width: 23.50312779267203%;"><button
																class="datatable-sorter">Customer</button></th>
														<th data-sortable="true"
															style="width: 39.32082216264522%;"><button
																class="datatable-sorter">Product</button></th>
														<th data-sortable="true"
															style="width: 11.706881143878462%;"><button
																class="datatable-sorter">Price</button></th>
														<th data-sortable="true"
															style="width: 14.745308310991955%;"><button
																class="datatable-sorter">Status</button></th>
													</tr>
												</thead>
												<tbody>
													<tr data-index="0">
														<td><a href="#">#2457</a></td>
														<td>Brandon Jacob</td>
														<td><a href="#" class="text-primary">At
																praesentium minu</a></td>
														<td>$64</td>
														<td><span class="badge bg-success">Approved</span></td>
													</tr>
													<tr data-index="1">
														<td><a href="#">#2147</a></td>
														<td>Bridie Kessler</td>
														<td><a href="#" class="text-primary">Blanditiis
																dolor omnis similique</a></td>
														<td>$47</td>
														<td><span class="badge bg-warning">Pending</span></td>
													</tr>
													<tr data-index="2">
														<td><a href="#">#2049</a></td>
														<td>Ashleigh Langosh</td>
														<td><a href="#" class="text-primary">At
																recusandae consectetur</a></td>
														<td>$147</td>
														<td><span class="badge bg-success">Approved</span></td>
													</tr>
													<tr data-index="3">
														<td><a href="#">#2644</a></td>
														<td>Angus Grady</td>
														<td><a href="#" class="text-primar">Ut voluptatem
																id earum et</a></td>
														<td>$67</td>
														<td><span class="badge bg-danger">Rejected</span></td>
													</tr>
													<tr data-index="4">
														<td><a href="#">#2644</a></td>
														<td>Raheem Lehner</td>
														<td><a href="#" class="text-primary">Sunt
																similique distinctio</a></td>
														<td>$165</td>
														<td><span class="badge bg-success">Approved</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="datatable-bottom">
											<div class="datatable-info">Showing 1 to 5 of 5 entries</div>
											<nav class="datatable-pagination">
												<ul class="datatable-pagination-list"></ul>
											</nav>
										</div>
									</div>

								</div>

							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<!-- End Right side columns -->

			</div>
		</section>

	</main>

	<jsp:include page="AdminFooter.jsp"></jsp:include>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
		
		
		<jsp:include page="AllJs.jsp"></jsp:include>

</body>
</html>