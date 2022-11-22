<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
  
@import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,500&display=swap');

* {
    box-sizing: border-box;
}

body {
    margin: 0;
     padding-bottom: 20px;
     font-family: 'Nunito', sans-serif;
     color: white;
     background-image: linear-gradient(270deg, #08AEEA 0%, #2AF598 100%);
}

.wrapper{
    background-color: #202124;
    position: relative;
    width:30%;
    margin: 50px auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
}

.header {
    position: relative;
    text-align: center;
}

    .header h2 {
       color: #fff;
    }

.form {
    margin: 0 auto;
    max-width: 16rem;
    overflow: auto;
}

.form-control {
    margin-bottom: 10px;
    padding-bottom: 20px;
    position: relative;
}
    .form-control input {
        border: 1px solid transparent;
        border-bottom-color: white;
        background-color: transparent;
        color: black;
        border-radius: 0;
        font-family: inherit;
        font-size: 14px;
        padding: 10px;
        width: 100%;
    }

        .form-control input:focus {
            outline: 0;
            border-bottom-color: #777;
        }

    .form-control.success input {
        border-bottom-color: #2ecc71;
    }

    .form-control.error input {
        border-bottom-color: #e74c3c;
    }

    .form-control i {
        visibility: hidden;
        position: absolute;
        top: 40px;
        right: 10px;
    }

    .form-control.success i.fa-check-circle {
        color: #2ecc71;
        visibility: visible;
    }

    .form-control.error i.fa-times-circle {
        color: #e74c3c;
        visibility: visible;
    }

    .form-control small {
        color: #e74c3c;
        position: absolute;
        bottom: 0;
        left: 0;
        visibility: hidden;
    }

    .form-control.error small {
        visibility: visible;
    }

.form button {
    background-image: linear-gradient(270deg, #08AEEA 0%, #2AF598 100%);
    border-radius: 15px;
    color: #000;
    font-size: 1rem;
    padding: 10px;
    margin-top: 20px;
    width: 100%;
}
.form-control button:focus {
            outline: 0;
            border-bottom-color: #777;
        }

.credit{
    text-align: center;
    color: #000;
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

.credit a{
    text-decoration: none;
    color:#000;
    font-weight: bold;
}  

  
  </style>
  
  
</head>
<body>
<div class="wrapper">
<div class="header">
	<h1>Register Form</h1>
	</div>
	<form class="form" id ="form" action="register" method="post" >
	
	<%
		if ((String) request.getParameter("error") != null) {
			String msg = (String) request.getParameter("error");
		%><h4  style="color: red"><%=msg%></h4>
		<%
		}
		%> 
			<div class="form-control">
			UserName:<span	style="color: red; padding-left: 5px">*</span>
			<input name = "userName" id="userName" type="text" placeholder="UserName"   /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red" >Error message</small>
			</div>
			<div class="form-control">
			Password:<span	style="color: red; padding-left: 5px">*</span>  
			<input name="password" id="password" type="password" 
			placeholder="Password"  /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red">Error message</small>
			</div>
			<div class="form-control">
			Name:<span	style="color: red; padding-left: 5px">*</span>
			<input name = "name" id ="name" type ="text" placeholder="Name"  /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red">Error message</small>
			</div>
			
			<div class="form-control">
			Email:<span	style="color: red; padding-left: 5px">*</span>
			<input name="email" id="email" type="email" placeholder="E-mail"  /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red">Error message</small>
			</div>
			<div class="form-control">
			MobileNo:<span	style="color: red; padding-left: 5px">*</span>
			<input name="mobileNo" id="mobile" type="text" placeholder="MobileNo"  /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red">Error message</small>
			</div>
			<div class="form-control">
			Address:<span	style="color: red; padding-left: 5px">*</span>
			<input name= "address" id="address" type="text" placeholder="Address"  /><br>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-times-circle"></i>
			<small style="color:red">Error message</small>
			</div>
			
		<button>Submit</button>

	</form>
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
	const form = document.getElementById('form');
	  const name = document.getElementById('name');
	  const email = document.getElementById('email');
	  const password = document.getElementById('password');
	  const userName = document.getElementById('userName');
	  const mobile = document.getElementById('mobile');
	  const address = document.getElementById('address');
	  
	  
	  
	  
	   $('#form').on('submit',function(event){
		  event.preventDefault();
	      checkInputs();
	      console.log("name="+name.value);
	      
	      let form=new FormData(this);   
          console.log("event handle")
		 	$.ajax({
				url : "register",
				type : "POST",
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data)
					if(data.statusCode==401){
						alert("Email is Alrady exist");
					}
					 swal("Added Succesfully")
					  .then((value)=>{
						 window.location="http://localhost:8080/login";
					 })  
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown)
				},
				processData : false,
				contentType : false
			})
		  
		  
	  } )
	   /* form.addEventListener('submit', e => {
	      e.preventDefault();
	      checkInputs();
	      console.log("name="+name.value);
	  });  */
	  
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

	      if (passwordValue === '') {
	          setErrorFor(password, 'Please enter password');
	      } else if (!isPassword(passwordValue)) {
	          setErrorFor(password, 'atleast one number, one uppercase, lowercase letter, and atleast 8 character');
	      }else {
	          setSuccessFor(password);
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