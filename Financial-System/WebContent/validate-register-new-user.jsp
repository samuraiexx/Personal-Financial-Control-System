<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="fcs.Main" %>
	<%
		String username = request.getParameter("new-username");
		String password = request.getParameter("new-password");

		Main authenticator = new Main();
		authenticator.Connect();
		if(authenticator.registra_usuario(username, password)) {
	%>	
			Cadastro feito com sucesso!
			<jsp:include page="login.jsp"/>
	<%
		} else {
	%>
		<h4>Erro ao registrar suas credenciais.</h4>
		<form method=post action="login.jsp">
			<input type="submit" value="Voltar para tela de login"/>
		</form>
	<%
		}
	%>

</body>
</html>