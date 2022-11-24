<!DOCTYPE html>
<html lang="en">

<%@page import="java.util.List"%>
<%@page import="com.application.entity.Product"%>
<%@page import="com.application.dto.CustomerDto"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
CustomerDto userDto = (CustomerDto) session.getAttribute("user");
List<Product> productService = (List<Product>) request.getAttribute("product");
%>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>E-Commerce</title>

<style>
.wrapper{
    background-color: #202124;
}
</style>
</head>

<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background" aria-label="Top nav bar">
		<div class="container-fluid">


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
				<form class="d-flex" role="search" id="search-form" action="SearchProduct" method="POST">
					<input autocomplete="off" class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" id="input-search">
					<button class="btn btn-outline-light" type="submit" id="search-product" onclick="searchProduct()">
					Search</button>
				</form>
			</div>
		</div>
	</nav>


	<div class="container-fluid">
		<div class="row">

			<div class="col-3">
				<nav id="sidebar"aria-label="Sidebar">
					<div class="sidebar-header">
						<h3>E-commerce</h3>
					</div>

					<ul class="list-unstyled components">

						<li class="active"><a href="index">Home</a></li>
						<li class ="nav-item"  ><a href="order" >order</a></li>
						<li><a href="profile">Profile</a>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>


				</nav>


			</div>

			<div class="col-9" id="product-container">

				<%
				for (Product p : productService) {
				%>
				<div class="card shadow  mb-2 bg-white rounded">
					<div class="row no-gutters">
						<div class="col-sm-3" style="border-right: 2px solid blue;">
							<img class="card-img-top img-fluid my-2" src="../productimages/<%=p.getImg()%>"
								alt="img not supported" style="height: 200px; width: 350px;">
						</div>
						<div class="col-sm-9">
							<div class="card-body">
								<h5 class="card-title"><%=p.getName()%></h5>
								<p class="card-text" style="height: 100px"><%=p.getDescription()%></p>
								<h5 class="card-text">
									Price:<%=p.getPrice()%></h5>

							</div>
							<div class="card-footer">

								<div class="text-right ">
									<div class="store-item-icon">
										<button class="btn btn-primary" id="addCart" onclick="addToCart(<%=p.getpId()%>)">Add to Cart</button>
										<button class="btn btn-danger mx-2"
										href="http://localhost:8080/payment?pid"+<%=p.getpId() %>>Buy Now</button>
										<p id="outOfStock" style="color:red"></p>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
			<!-- Button trigger modal -->


			<!-- Modal -->
			<div class="modal fade " id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4>CART ITEM</h4>
				</div>
				<div class="modal-body" id="modalbody"></div>
			</div>
		</div>
	</div>
	
	</div>
	</div>
	
	


			<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			
			<script>
			
			 $(document).ready(function(){
				$.ajax({
					type:"POST",
					contentType : 'application/json; charset=utf-8',
					 dataType : 'json',
					url:'getCartProduct',  
					data:{"data":"data"},
					 success:function(result){
						 $('#modalbody').html('');
						 $.each(result,function(index,item){
							 console.log(result)
							 
							 
							  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
				              '<div class="row no-gutters">'+
			                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
			                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.img+'" alt="img not supported" style="height: 100px; width: 200px;">'+
			                   '</div>'+
			                  '<div class="col-sm-9">'+
			                       '<div class="card-body" style="height: 80px">'+
			                           '<h5 class="card-title">'+item.name+'</h5>'+
			                           '<p class="small">'+item.description.substring(0,100)+'...</p>'+
			                       '</div>'+
			                      '<div class="card-footer" style="border: 0;">'+
			                           '<div class="text-right">'+
			                               '<a class="btn btn-danger mx-2" onclick="payment('+item.pId+')">Buy Now</a>'+
			                               '<a class="btn btn-primary mx-2" onclick="removeProduct('+item.pId+')">Remove</a>'+
			                           '</div>'+
			                       '</div>'+
			                  ' </div>'+
			               '</div>'+
			           '</div>'
						;
						$("#modalbody").append(htmlVar); 
							 
						 })
					 },
					 error: function(xhr, status, error) {
						 $("#modalbody").append('<h1>Cart is Empty </h1>'); 
					   }
				
			});
			}); 
			
			
			
			function addToCart(pid){
				let prodId={
					"pid":pid
				}
				$.ajax({	
					type:"POST",
					contentType : 'application/json; charset=utf-8',
					 dataType : 'json',
					url:'productId',  
					 data:JSON.stringify(prodId),

					 success:function(result){
							 $('#modalbody').html('');
						 $.each(result,function(index,item){
							 console.log(result)
							 
							  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
				              '<div class="row no-gutters">'+
			                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
			                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.img+'" alt="img not supported" style="height: 100px; width: 200px;">'+
			                   '</div>'+
			                  '<div class="col-sm-9">'+
			                       '<div class="card-body" style="height: 80px">'+
			                           '<h5 class="card-title">'+item.name+'</h5>'+
			                           
			                       '</div>'+
			                      '<div class="card-footer" style="border: 0;">'+
			                           '<div class="text-right">'+
			                               '<a class="btn btn-danger mx-2" onclick="payment('+item.pId+')">Buy Now</a>'+
			                               '<p id="outOfStock" style="color:red"></p>'+
			                               '<a class="btn btn-primary mx-2" onclick="removeProduct('+item.pId+')">Remove</a>'+
			                           '</div>'+
			                       '</div>'+
			                  ' </div>'+
			               '</div>'+
			           '</div>'
						;
						$("#modalbody").append(htmlVar); 
							 
						 })
					 },
					 error: function(xhr, status, error) {
						 window.location.replace("http://localhost:8080/login")
					   },			
				});
			}
			
			
			
			
			
			
			
			function searchProduct(){
			console.log("search button clicked")
				
				document.getElementById("search-form").addEventListener("click", function(event){
					  event.preventDefault()
					});
				
				let prodname=$('#input-search').val();	
				let searchval={
				"name":prodname
				}
				console.log("Search value " + prodname)
				$.ajax({
					type:"POST",
					contentType : 'application/json; charset=utf-8',
					 dataType : 'json',
					url:'search',  
					 data:JSON.stringify(searchval),
					 success:function(result){
						 console.log(result);
						 
						 $('#product-container').html('');
						 $.each(result,function(index,item){
							 let htmlVar ='<div class="card shadow  mb-2 bg-white rounded">'+
							'<div class="row no-gutters">'+
								'<div class="col-sm-3" style="border-right: 2px solid blue;">'+
									'<img class="card-img-top img-fluid my-2" src="../productimages/'+item.img+'" alt="img not supported" style="height: 200px; width: 350px;">'+
							'	</div>'+
								'<div class="col-sm-9">'+
									'<div class="card-body">'+
										'<h5 class="card-title">'+item.name+'</h5>'+
										'<p class="card-text" style="height: 100px">'+item.description+'</p>'+
										'<h5 class="card-text"> Price:'+item.price+'</h5>'+

								'</div>'+
									'<div class="card-footer">'+

										'<div class="text-right ">'+
											'<div class="store-item-icon">'+
												'<button class="btn btn-primary" id="addCart" onclick="addToCart('+item.itemId+')">Add to Cart</button>'+
												'<button class="btn btn-danger mx-2	">Buy Now</button'+
											'</div>'+
										'</div>'+

									'</div>'+
								'</div>'+
							'</div>'+
						'</div>'
						;
							 $('#product-container').append(htmlVar);
						 })	 
					 },
					 error: function(xhr, status, error) {
						console.log(error)
						
					   },	
				});
				
			}		
			
			function buyProduct(pid){
		    	   let prodid={
		    			   "productId":pid
		    	   }
		    	   
		    		$.ajax({
		    			type:"POST",
		    			contentType : 'application/json; charset=utf-8',
		    			 dataType : 'json',
		    			url:'buyproduct',  
		    			 data:JSON.stringify(prodid),
		    			 success:function(result){
		    				 if(result.statusCode==200){
		    					 swal("Order Placed Succesfully click OK to Track your order")
		    					 .then((value)=>{
		    						 window.location="http://localhost:8080/order";
		    					 })
		    				 }
		    				 else{
		    					 $('#outOfStock').html("This Item is currently out of stock")
		    				 }
		    			 
		    			 },
		    			 error: function(xhr, status, error) {
		    				 window.location.replace("http://localhost:8080/login")
		    				
		    			   },	
		    		});
		    	   
		    	   
		    	   
		       }
			
			function removeProduct(pid){
				let prodId={
					"pid":pid
				}
				$.ajax({	
					type:"POST",
					contentType : 'application/json; charset=utf-8',
					 dataType : 'json',
					url:'removeproduct',  
					 data:JSON.stringify(prodId),

					 success:function(result){
							 $('#modalbody').html('');
						 $.each(result,function(index,item){
							 console.log(result)
							 
							  let htmlVar = '<div class="card shadow  mb-2 bg-white rounded">'+
				              '<div class="row no-gutters">'+
			                   '<div class="col-sm-3" style="border-right: 2px solid blue;">'+
			                       '<img class="card-img-top img-fluid my-2"  src="../productimages/'+item.img+'" alt="img not supported" style="height: 100px; width: 200px;">'+
			                   '</div>'+
			                  '<div class="col-sm-9">'+
			                       '<div class="card-body" style="height: 80px">'+
			                           '<h5 class="card-title">'+item.name+'</h5>'+
			                           
			                       '</div>'+
			                      '<div class="card-footer" style="border: 0;">'+
			                           '<div class="text-right">'+
			                               '<a class="btn btn-danger mx-2" onclick="buyProduct('+item.pId+')">Buy Now</a>'+
			                               '<p id="outOfStock" style="color:red"></p>'+
			                               '<a class="btn btn-primary mx-2" onclick="removeProduct('+item.pId+')">Remove</a>'+
			                           '</div>'+
			                       '</div>'+
			                  ' </div>'+
			               '</div>'+
			           '</div>'
						;
						$("#modalbody").append(htmlVar); 
							 
						 })
					 },
					 error: function(xhr, status, error) {
						 window.location.replace("http://localhost:8080/login")
					   },			
				});
			}

			</script>
</body>

</html>