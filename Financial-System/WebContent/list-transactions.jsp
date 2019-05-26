<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="fcs.Transacao, fcs.Receita, fcs.Despesa, fcs.Usuario, java.util.List" %>
	<h4>Histórico de transações</h4>
	<table>
	<tr>
		<th> Receitas </th>
	</tr>
	<tr>
		<th> Valor </th>
		<th> Data </th>
	</tr>
		<%
			String username = (String) request.getSession().getAttribute("username");
			String password = (String) request.getSession().getAttribute("password");

			Usuario user = new Usuario(username, password);

			List<Transacao> transacoes = user.listar_transacoes();
			for (Transacao t : transacoes) {
				if (t instanceof Receita) {
					out.println("<tr>");
					out.println("<td>" + t.get_valor() + "</td>");
					out.println("<td>" + t.get_data().toString() + "</td>");
					out.println("</tr>");
				}
			}
		%>
	</table>

	<br/>

	<table>
	<tr>
		<th> Despesas </th>
	</tr>
	<tr>
		<th> Valor </th>
		<th> Data </th>
		<th> Categoria </th>
		<th> Credito </th>
	</tr>
		<%
			for (Transacao t : transacoes) {
				if (t instanceof Despesa) {
					Despesa d = (Despesa) t;
					out.println("<tr>");
					out.println("<td>" + d.get_valor() + "</td>");
					out.println("<td>" + d.get_data().toString() + "</td>");
					out.println("<td>" + d.get_categoria() + "</td>");
					out.println("<td>" + (d.pago_em_credito() ? "Sim" : "Não") + "</td>");
					out.println("</tr>");
				}
			}
		%>
	</table>
	<br/>
	<form method=post action="home.jsp">
		<input type="submit" value="Voltar para menu principal"/>
	</form>
</body>
</html>