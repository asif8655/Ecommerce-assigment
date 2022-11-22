<%@page import="com.application.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.application.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />

<%
List<Product> products = (List<Product>) request.getAttribute("products");
String userDto = (String) session.getAttribute("adminuser");
%>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<div class="container-fluid">


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">



					<%
					if (userDto == null) {
					%>
					<li class="nav-item"><a class="nav-link active " href="login"><span
							class="fa fa-user-circle"></span> Login</a></li>
					<%
					} else {
					%>
					<li class="nav-item "><h6 class="nav-link">
							Hello
							<%=userDto%></h6></li>
					<li class="nav-item"><a class="nav-link active " href="adminlogout"><span
							class="fa fa-sing-out"></span> Logout</a></li>
					<%
					}
					%>
				</ul>

			</div>
		</div>
	</nav>

	<div class="container-fluid my-3">

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#add-product-modal">Add Product</button>
		<form id="upload-file" method="POST" enctype="multipart/form-data"
			style="display: inline">
			<button type="submit" class="btn btn-warning mx-4">Upload
				Excel File</button>
			<input type="file" name="file" required="required"> <em
				class="fa fa-refresh fa-2x fa-spin" id="loader"
				style="display: none;"></em>
		</form>


		<!--Add Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="addProduct" action="addproductasd" method="POST"
							enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="name" type="text"
									placeholder="Enter Post Title" class="form-control">
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="description"
									placeholder="Enter Product Description" class="form-control"
									style="height: 200px"></textarea>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="price"
									placeholder="Enter Product Price" class="form-control" />
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="quantity"
									placeholder="Enter Product Quantity" class="form-control" />
							</div>
							<br>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue">
									<em class="fa fa-cloud-upload" style="color: blue"></em> <input
									type="file" name="image" multiple>
								</label>

							</div>
							<br>
							<div class="container text-end">
								<button type="submit" class="btn btn-outline-dark btn-lg">Add
									Product</button>
							</div>

						</form>


					</div>

				</div>
			</div>
		</div>


		<table
			class="table table-striped table-dark table-hover my-3 table-bordered"
			style="border-color: black; backgroud-color: white;">
			<caption></caption>
			<thead>
				<tr class="text-center">
					<th scope="col">Table Id</th>
					<th scope="col">Product Id</th>
					<th scope="col">Title</th>
					<th scope="col">Description</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Image</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 1;
				for (Product p : products) {
				%>
				<tr>
					<th scope="row"><%=count%></th>
					<td><%=p.getpId()%></td>
					<td><%=p.getName()%></td>
					<td><%=p.getDescription()%></td>
					<td><%=p.getPrice()%></td>
					<td><%=p.getQuantity()%></td>

					<td><img src="../productimages/<%=p.getImg()%>"
						style="height: 60px" width="60px" class="img-fluid img-thumbnail"
						alt="Sheep"></td>
					<td><button type="button" class="btn btn-success"
							data-bs-toggle="modal" data-bs-target="#update-product-modal"
							onclick="getUpdateData(<%= p.getpId()%>)">Update</button></td>
					<td><button type="button" class="btn btn-danger"
							onclick="deleteProduct(<%=p.getpId()%>)">Delete</button></td>
				</tr>



				<%
				count++;
				}
				%>
			</tbody>
		</table>


		<!-- Update Modal -->
		<div class="modal fade" id="update-product-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Update Product</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="modal-body">
						<form id="update_Post_form" action="updateproductasd"
							method="POST" enctype="multipart/form-data">

							<br>
							<div class="form-group">
								Product Title : <input name="name" id="title" type="text"
									placeholder="Enter Post Title" class="form-control">
							</div>
							<br>
							<div class="form-group">
								Product Description :
								<textarea name="description" id="description"
									placeholder="Enter Product Description" class="form-control"
									style="height: 200px"></textarea>
							</div>
							<br>
							<div class="form-group">
								Product Price: <input type="text" name="price" id="price"
									placeholder="Enter Product Price" class="form-control" />
							</div>

							<div class="form-group">
								Product Quantity: <input type="number" name="quantity"
									id="quantity" placeholder="Enter Product Quantity"
									class="form-control" />
							</div>
							<br>
							<div class="form-group" id="img"
								style="border: 2px solid black; display: inline-block;"></div>
							<div class="form-group">

								<label id="1st" class="btn custom-input-btn" style="color: blue"
									onchange="changepro(event)"> <em
									class="fa fa-cloud-upload" style="color: blue"></em> <input
									type="file" id="file" name="image" multiple>
								</label>


							</div>
							<br>
							<div class="container text-end">
								<button type="submit" class="btn btn-outline-dark btn-lg">Update
									Product</button>
							</div>

						</form>


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
	
	
	
	
	function getUpdateData(pid){
		productId=pid;
		let prodId={
				"productId":pid
		}
		
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'getproductbyid',  
			 data:JSON.stringify(prodId),
			 success:function(result){
				 console.log(result)
				 $('#title').val(result.t.name)
				 $('#description').val(result.t.description)
				 $('#price').val(result.t.price)
				 $('#quantity').val(result.t.quantity)
			let htmlvar='<img src="../productimages/'+result.t.img+'" id="output" class="img-fluid" style="height: 155px; width: 150px" /><br>'
				 
				 $('#img').html(htmlvar)
			 },
			 error(xhr, status, error){
				 console.log(error)
			 },
			
		});
	
	}
		
		$('#addProduct').on('submit',function(event){
			event.preventDefault();
           let form=new FormData(this);   
           console.log("event handle")
		 	$.ajax({
				url : "addproduct",
				type : "POST",
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log()
					swal("Added Succesfully")
					 .then((value)=>{
						 window.location="http://localhost:8080/adminpage";
					 })
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown)
				},
				processData : false,
				contentType : false
			})  
	})
		
	$('#upload-file').on('submit',function(event){
		event.preventDefault();
		$("#loader").show();
	   let form=new FormData(this);   
	   console.log("event handle")
	   
	 	$.ajax({
			url : "serviceurl",
			type : "POST",
			data : form,
			success : function(data, textStatus, jqXHR) {
				 $("#loader").hide();
				swal("Uploaded Data successfully Clic ok to refresh")
				 .then((value)=>{
					 location.reload()
				 })
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(errorThrown)
			},
			processData : false,
			contentType : false
		})  
	})
		
		
		
		
		$('#update_Post_form').on('submit',function(event){
			event.preventDefault();
           let form=new FormData(this);   
           form.set("pId",productId)
		 	$.ajax({
				url : "updateproduct",
				type : "POST",
				data : form,
				success : function(data, textStatus, jqXHR) {
					swal("Updated Succesfully")
					 .then((value)=>{
						 window.location="http://localhost:8080/adminpage";
					 })
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown)
				},
				processData : false,
				contentType : false
			})  
	})
	var changepro = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
			URL.revokeObjectURL(output.src) // free memory
		}
	};
	
	function deleteProduct(pid){
		let prodId={
				"productId":pid
		}
		
		$.ajax({
			type:"POST",
			contentType : 'application/json; charset=utf-8',
			 dataType : 'json',
			url:'deleteproductbyid',  
			 data:JSON.stringify(prodId),
			 success:function(result){
				 if(result.statusCode==200){
					 swal("Deleted Succesfully")
					 .then((value)=>{
						 window.location="http://localhost:8080/adminpage";
					 })
				 }
				 else{
					 
				 }
			 },
			 error(xhr, status, error){
				 console.log(error)
			 },
				
		});
	}
	
	
	
	
	
	</script>

</body>
</html>