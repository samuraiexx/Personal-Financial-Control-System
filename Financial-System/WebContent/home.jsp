<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%@ page import="java.util.Calendar, java.util.Date, java.util.Locale, java.time.Year, fcs.Usuario, fcs.Transacao, fcs.Despesa, fcs.Receita, java.util.ArrayList, java.util.List, java.util.HashMap, java.util.Collections, java.util.Set, java.util.HashSet" %>

  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mes/Ano', 'Receitas', 'Despesas'],
      	  <%
			String username = (String) request.getSession().getAttribute("username");
			String password = (String) request.getSession().getAttribute("password");

			Usuario user = new Usuario(username, password);

          	List<Transacao> transactions = user.listar_transacoes();
          	HashMap<String, Float> receita = new HashMap<String, Float>();
          	HashMap<String, Float> despesa = new HashMap<String, Float>();
          	Date today = new Date(119, 06, 1);
          	for (Transacao t : transactions) {
          		Date data = t.get_data();
          		
          		Calendar calData = Calendar.getInstance(Locale.US);
          	    calData.setTime(data);    
          		Calendar calToday = Calendar.getInstance(Locale.US);
          	    calToday.setTime(today);
          	    
          	    int diff = calToday.get(Calendar.YEAR) - calData.get(Calendar.YEAR);
          	    if (calData.get(Calendar.DAY_OF_YEAR) > calToday.get(Calendar.DAY_OF_YEAR)) {
          	        diff--;
          	    }
          	    if (diff >= 1) continue;
          		
          		String label = t.get_data().toString();
          		label = label.substring(0, label.length() - 3);
          		float value = t.get_valor();
          		if (t instanceof Despesa) {
					if (!despesa.containsKey(label)) {
						despesa.put(label, value);
					} else {
						float amt = despesa.get(label);
						amt += value;
						despesa.put(label, amt);
					}
          		}
          		if (t instanceof Receita) {
					if (!receita.containsKey(label)) {
						receita.put(label, value);
					} else {
						float amt = receita.get(label);
						amt += value;
						receita.put(label, amt);
					}
          		}
          	}
          	ArrayList<String> labels = new ArrayList<String>();
          	Set<String> keys = new HashSet<String>(receita.keySet());
          	keys.addAll(despesa.keySet());
          	labels.addAll(keys);
          	Collections.sort(labels.subList(0, labels.size()));
          	for (int i = 0; i < labels.size(); i++) {
          		String label = labels.get(i);
          		float outcome = despesa.containsKey(label) ? despesa.get(label) : 0;
          		float income = receita.containsKey(label) ? receita.get(label) : 0;
          		out.println("['" + 
          					label + "', " + 
          					income + ", " +
          					outcome + "]" +
          					(i == (labels.size() - 1) ? "" : ","));
          	}
          %>
        ]);

        var options = {
          chart: {
            title: 'Balanco de Gastos',
            subtitle: 'Receitas e despesas, mes a mes.',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
    
	<form method=post action="register-transaction.jsp">
		<input type="submit" value="Registrar nova transação"/>
	</form>
    
	<form method=post action="list-transactions.jsp">
		<input type="submit" value="Listar transações realizadas"/>
	</form>
	
	<form method=post action="list-net-form.jsp">
		<input type="submit" value="Gerar balanço mensal"/>
	</form>
  </body>
</html>
