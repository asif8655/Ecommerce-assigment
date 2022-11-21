<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>


<h1>Login</h1>
<form action="login" method="post">
<div class="form-group">
Email:<span style="color:red;padding-left:5px">*</span>
<input name="email" type="email" class="form-control" placeholder="Email" required/><br>
</div>
<div class="form-group">
Password:<span style="color:red;padding-left:5px">*</span>
<input name="password" type="password" class="form-control" placeholder="Password" required/><br>
</div>
<%
if((String)request.getParameter("msg")!=null){
	String msg = (String) request.getParameter("msg");	
%><h4 style="color:red"><%=msg %></h4>
<% 
}
%>
<input type="submit" value="Login" class="btn btn-primary" />

</form>
<button class="btn btn-primary"type="submit"><a href="register" style="color:white;text-decoration:none">SingUp</a></button>
</body>
</html>