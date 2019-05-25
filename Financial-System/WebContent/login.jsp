<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Insert your credentials:</h4>
	<form method="post" action="validation.jsp">
		Username:<input type="text" name="username" required/>
		<br/>
		Password:<input type="password" name="password" required/>
		<br/>
		<input type="submit" value="Submit">
		<br/>
	</form>
</body>
</html>