<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">    
<!DOCTYPE html>
<html lang="en">

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

.signup{

  background-image: linear-gradient(270deg, #08AEEA 0%, #2AF598 100%);
    border-radius: 15px;
    color: #000;
    font-size: 1rem;
    padding: 10px;
    margin-top: 20px;
    width: 75%;
}
.form-control button:focus {
            outline: 0;
            border-bottom-color: #777;
        }


}  

  
</style>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<div class="wrapper">
<div class="header">
<h1>Login</h1>
</div>

<form class="form" action="login" method="post">
<div class="form-control">
Email:<span style="color:red;padding-left:5px">*</span>
<input name="email" type="text"  placeholder="Email" required/><br>
</div>
<div class="form-control">
Password:<span style="color:red;padding-left:5px">*</span>
<input name="password" type="password"  placeholder="Password" required/><br>
</div>
<%
if((String)request.getParameter("msg")!=null){
	String msg = (String) request.getParameter("msg");	
%><h4 style="color:red"><%=msg %></h4>
<% 
}
%>
<button>Login</button>


</form>
<div class="container text-center">
<button class="signup"><a href="register" style="color:black;text-decoration:none">SingUp</a></button>
</div>
</div>

</body>
</html>