<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h4>Insira suas credenciais:</h4>
	<form method="post" action="validation.jsp">
		Usuário:<input type="text" name="username" required/>
		<br/>
		Senha:<input type="password" name="password" required/>
		<br/>
		<input type="submit" value="Entrar">
		<br/>
	</form>
	<form method=post action="register-new-user.jsp">
		<input type="submit" value="Registrar"/>
	</form>
</body>
</html>