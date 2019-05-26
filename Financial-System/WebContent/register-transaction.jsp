<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar</title>
</head>
<body>
	<h4>Registro de Transações:</h4>
	<form method="post" action="check-register.jsp">
		<h5>Valor</h5>
		<input type="number" name="value" step="0.01" required>

		<h5>Data (DD/MM/AAAA)</h5>
		Dia<input type="number" name="day" required>
		Mes<input type="number" name="month" required>
		Ano<input type="number" name="year" required>

		<h5>Categoria</h5>
		<input type="text" name="category" required>

		<h5>Tipo de Transação</h5>
		Receita<input type="radio" name="transaction" value="in" required>
		Despesa<input type="radio" name="transaction" value="out" required>

		<h5>Se foi uma Despesa: Foi pago com cartão de crédito?</h5>
		Sim<input type="radio" name="credit" value="yes">
		Não<input type="radio" name="credit" value="no">
		<br/>

		<input type="submit" value="Submit">
		<br/>
	</form>
</body>
</html>