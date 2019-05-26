<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Insira o mês e o ano do balanço:</h4>
	<form method="post" action="list-net.jsp">
		Mês:<input type="text" name="month-net" required/>
		<br/>
		Ano:<input type="password" name="year-net" required/>
		<br/>
		<input type="submit" value="Confirmar">
		<br/>
	</form>
	<form method=post action="home.jsp">
		<input type="submit" value="Voltar ao menu principal"/>
	</form>
</body>
</html>