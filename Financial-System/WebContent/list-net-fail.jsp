<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Não foi possível listar as transações.</h4>
	<form method=post action="home.jsp">
		<input type="submit" value="Voltar para menu principal"/>
	</form>
	<br/>
	<form method=post action="list-net-form.jsp">
		<input type="submit" value="Tentar novamente"/>
	</form>
</body>
</html>