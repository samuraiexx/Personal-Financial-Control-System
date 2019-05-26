<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checking transaction</title>
</head>
<body>
	<%@ page import="fcs.Receita, fcs.Despesa, fcs.Usuario, java.sql.Date" %>
	<%
		String category = request.getParameter("category");
		float value = Float.parseFloat(request.getParameter("value"));
		
		int day = Integer.parseInt(request.getParameter("day")) - 1;
		int month = Integer.parseInt(request.getParameter("month")) - 1;
		int year = Integer.parseInt(request.getParameter("year"));
		
		String transaction_type = request.getParameter("transaction");
		String credit = request.getParameter("credit");
		
		if ((day < 0 && day > 31) ||
			(month < 0 || month > 11) ||
			(value < 0) ||
			(credit == null && transaction_type.equals("out"))) {
	%>
		<jsp:include page="register-fail.jsp"/>
	<%
		} else {
			boolean success = false;
			String username = (String) request.getSession().getAttribute("username");
			String password = (String) request.getSession().getAttribute("password");
			out.println(username);
			out.println(password);

			Usuario user = new Usuario(username, password);
			
			if (transaction_type.equals("in")) {
				Receita rec = new Receita(value, new Date(year, month, day));
				success = user.registra_transacao(rec);
			} else {
				Despesa des = new Despesa(value, new Date(year, month, day),
								credit.equals("yes"), category);
				success = user.registra_transacao(des);
			}
			
			out.println(year);
			out.println(month);
			out.println(day);
			if (success) {
	%>
			<jsp:include page="register-success.jsp"/>
	<%
			} else {
	%>
			<jsp:include page="register-fail.jsp"/>
	<%
			}
		}
	%>
		
	
</body>
</html>