<%@page import="java.text.DateFormat"%>
<%@page import="com.application.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.application.dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%CustomerDto userDto = (CustomerDto) session.getAttribute("user"); %>
<!DOCTYPE html>
<html lang = en>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<!-- Our Custom CSS -->
<link rel="stylesheet" href="/css/style.css">
<link rel="text/javascript" href="/js/index.js">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<style>
.card-img-top {
	object-fit: contain;
}
</style>
</head>

<body>

<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background" aria-label="top nav bar">
		<div class="container-fluid"> <!-- Top nav bar -->


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">



					<%
					if (userDto == null) {
					%>
					<li class="nav-item"><a class="nav-link active " href="login"><span
							class="fa fa-user-circle"></span> Login</a></li>

					<li class="nav-item"><a class="nav-link active "
						href="register"><span class="fa fa-user-plus"></span> Sign up</a>
					</li>
					<%
					} else {
					%>
					<li class="nav-item "><h6 class="nav-link">
							Hello
							<%=userDto.getName()%></h6></li>
					<li class="nav-item"><a class="nav-link active " href="logout"><span
							class="fa fa-sing-out"></span> Logout</a></li>
					<%
					}
					%>
				</ul>
				<div class="col-md-1">
					<em class="nav-item" ><a class="nav-link" href="#"
								data-bs-toggle="modal" data-bs-target="#add-post-modal" style="color:white"><span
									class="fa fa-cart-plus"></span> Cart </a> </em>
				</div>
				
			</div>
		</div>
	</nav>
	
<div class="container-fluid">
		<div class="row">

			<div class="col-3">
	
	<nav id="sidebar" aria-label="Sidebar" >
			<div class="sidebar-header">
				<h3>Ecommerce Application</h3>
			</div>

			<ul class="list-unstyled components">
				<p class="font-weight-normal">Main Menu</p>
				<li><a href="http://localhost:8080/">Home</a></li>
				<li><a href="#">Order</a></li>
				<li><a href="#">Portfolio</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</nav>
		</div>
		
		</div>
		</div>
		</body>
		</html>