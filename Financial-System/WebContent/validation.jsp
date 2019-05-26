<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>

<body>
	<%@ page import="fcs.Main" %>
	<%
			String username = request.getParameter("username");
		String password = request.getParameter("password");

		Main authenticator = new Main();
		authenticator.Connect();
		if(authenticator.login(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
	%>
		<jsp:include page="home.jsp"/>
	<%
		} else {
	%>
		<h4>Erro ao realizar login.</h4>
		<form method=post action="login.jsp">
			<input type="submit" value="Voltar para tela de login"/>
		</form>
	<%
		}
	%>
</body>
</html>