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
	<%
			Usuario user = new Usuario("teste", "teste");
			int month = Integer.parseInt(request.getParameter("month-net")) - 1;
			int year = Integer.parseInt(request.getParameter("year-net")) - 1;

			if ((month < 0 || month > 11)) {
	%>
				<jsp:include page="list-net-fail.jsp"/>
	<%
			} else {
	%>
	<h4>Histórico de transações</h4>
	<table>
	<tr>
		<th> Receitas </th>
		<th> Receitas </th>
	</tr>
	<tr>
		<th> Valor </th>
		<th> Data </th>
	</tr>
		<%
			List<Transacao> transacoes = user.gerar_balanco_mensal(month, year);
			float net = 0;

			for (Transacao t : transacoes) {
				if (t instanceof Receita) {
					out.println("<tr>");
					out.println("<td>" + t.get_valor() + "</td>");
					out.println("<td>" + t.get_data().toString() + "</td>");
					out.println("</tr>");
					net += t.get_valor();
				}
			}
		%>
	</table>

	<br/>

	<table>
	<tr>
		<th> Despesas </th>
		<th> Despesas </th>
		<th> Despesas </th>
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
					net -= d.get_valor();
				}
			}
		%>
	</table>
	<br/>
	<h4>Balanço: <% out.println(net); %></h4>
	<form method=post action="home.jsp">
		<input type="submit" value="Voltar para menu principal"/>
	</form>
	<% } %>
</body>
</html>