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
		
		
		<div class="col-lg-8">
		<h1 class="container">Customer Profile</h1>
					<div class="card">
						<div class="card-body">
						<form class="form" id ="updateform" action="update" method="post">
						<div class="row mb-3">
							
								<div class="col-sm-3">
									<h6 class="mb-0">User Name</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input name="userName" id="userName" type="text" class="form-control" readonly="readonly" value=<%=userDto.getUserName() %>>
								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input name="email" id="email" type="text" class="form-control" readonly="readonly" value=<%=userDto.getEmail() %>>
								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Change Password</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input name="password" id="password" type="password" class="form-control" readonly="readonly" value=<%=userDto.getPassword() %>>
								</div>
								</div>
								
								<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Name</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input id="name" name="name" type="text" class="form-control" readonly="readonly" value=<%=userDto.getName() %>>
								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Mobile</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input name="mobileNo" id="mobile" type="text" class="form-control" readonly="readonly" value=<%=userDto.getMobileNo() %>>
									<p id="mobileerror"style="display:none;color:red"></p>
								</div>
							</div>
							
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Address</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input name="address" id="address" type="text" class="form-control" readonly="readonly" value=<%=userDto.getAddress() %>>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-9 text-secondary">
									<button id="update" type="submit" style="display: none;" class="btn btn-primary px-4" >Update</button>
								</div>
							</div>
						</form>
						<div class="container col-md-4">
							<button id="edit"  onclick="edit()" class="btn btn-primary px-4" >Edit</button>
									
							</div>
							
								
								
							
							
							
							
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
		
		
 		function edit()
			{
 				$(".form-control").attr('readonly',false);
				$("#email").attr('readonly',true);
				$("#edit").hide();
				$("#update").show();
			}
		
		  
		  const name = document.getElementById('name');
		  const email = document.getElementById('email');
		  const password = document.getElementById('password');
		  const userName = document.getElementById('userName');
		  const mobile = document.getElementById('mobile');
		  const address = document.getElementById('address');
		
  		$('#updateform').on('submit',function(event){
  			event.preventDefault();
  			checkInputs();
			console.log(name.value);
			
			let form=new FormData(this);   
	          console.log(form)
			 	$.ajax({
					url : "update",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data)
						if(data.statusCode==200){
							window.location="http://localhost:8080/profile";
							$("#update").hide();
							$("#edit").show();
						}
						else{
							let errormsg=data.t;
							console.log(errormsg);
							$("#mobileerror").html(errormsg);
							$("#mobileerror").show();
						}
							
						 swal("SomeThing went Wrong")
						 
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(errorThrown)
					},
					processData : false,
					contentType : false
			 	});
  		})
  		
				
						

			 
		 
		
		function checkInputs(){
		  
		  const nameValue = name.value.trim();
	      const emailValue = email.value.trim();
	      const passwordValue = password.value.trim();
	      const userNameValue = userName.value.trim();
	      const mobileValue = mobile.value.trim();
	      const addressValue = address.value.trim();
	      
	      if (nameValue === '') {
	          setErrorFor(name, 'Please enter your 	name');
	      } else {
	          setSuccessFor(name);
	      }

	      if (emailValue === '') {
	          setErrorFor(email, 'Please enter your email');
	      } else if (!isEmail(emailValue)) {
	          setErrorFor(email, 'Email not valid');
	      } else {
	          setSuccessFor(email);
	      }

	      
	      if(userNameValue === ''){
	    	  setErrorFor(userName,'Please Enter your userName')
	      }else {
	    	  setSuccessFor(userName);
	      }
	      
	      if (mobileValue === '') {
	          setErrorFor(mobile, 'Please enter your Mobile Number');
	      }else if(!isMobile(mobileValue)){
	    	  setErrorFor(mobile,'Mobile Number not valid');
	      }
	      else {
	          setSuccessFor(mobile);
	      }
	      
	      if (passwordValue === '') {
	          setErrorFor(password, 'Please enter password');
	      } else if (!isPassword(passwordValue)) {
	          setErrorFor(password, 'atleast one number, one uppercase, lowercase letter, and atleast 8 character');
	      }else {
	          setSuccessFor(password);
	      }
	      
	      if (addressValue === '') {
	          setErrorFor(address, 'Please enter your 	address');
	      } else {
	          setSuccessFor(address);
	      }
	  }
	  

	  function setErrorFor(input, message) {
	      const formControl = input.parentElement;
	      const small = formControl.querySelector('small');
	      formControl.className = 'form-control error';
	      small.innerText = message;
	  }

	  function setSuccessFor(input) {
	      const formControl = input.parentElement;
	      formControl.className = 'form-control success';
	  }

	  function isEmail(email) {
	      return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
	  }

	  function isPassword(password){  
	      return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(password);
	  }

	  function isMobile(mobile){
		  return /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(mobile);
	  }

		 
			
		
		</script>
		
		</body>
		</html>