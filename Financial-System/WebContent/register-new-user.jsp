<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
	<h4>Insira as credenciais que deseja registrar:</h4>
	<form method="post" action="validate-register-new-user.jsp">
		Username:<input type="text" name="new-username" required/>
		<br/>
		Password:<input type="password" name="new-password" required/>
		<br/>
		<input type="submit" value="Submit">
		<br/>
	</form>
</body>
</html>