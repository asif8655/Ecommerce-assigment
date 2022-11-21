<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Register</h1>
	<form action="register" method="post">
			<div class="form-group">
			UserName:<span	style="color: red; padding-left: 5px">*</span>
			<input name="userName" type="text" placeholder="UserName" class="form-control" required /><br>
			</div>
			<div class="form-group">
			Password:<span	style="color: red; padding-left: 5px">*</span>  
			<input name="password" type="password" class="form-control"
			placeholder="Password" required /><br>
			</div>
			<div class="form-group">
			Name:<span	style="color: red; padding-left: 5px">*</span>
			<input name ="name" type ="text" placeholder="Name" class="form-control" required/><br>
			</div>
			<%
		if ((String) request.getParameter("error") != null) {
			String msg = (String) request.getParameter("error");
		%><h4  style="color: red"><%=msg%></h4>
		<%
		}
		%> 
			<div class="form-group">
			Email:<span	style="color: red; padding-left: 5px">*</span>
			<input name="email" type="email" placeholder="E-mail" class="form-control"required /><br>
			</div>
			<div class="form-group">
			MobileNo:<span	style="color: red; padding-left: 5px">*</span>
			<input name="mobileNo" type="text" placeholder="MobileNo" class="form-control" required/><br>
			</div>
			<div class="form-group">
			Address:<span	style="color: red; padding-left: 5px">*</span>
			<input name="address" type="text" placeholder="Address" class="form-control" required/><br>
			</div>
			
		
			<div class="form-group">
		<br> <input type="submit" value="submit" class="btn btn-primary" />
		</div>
		
		

	</form>
</body>
</html>