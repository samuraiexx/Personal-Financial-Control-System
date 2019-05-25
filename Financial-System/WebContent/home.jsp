<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Mes/Ano', 'Receitas', 'Despesas'],
      	  <%
      	  	String[] labels = {"Jan/2019", "Fev/2019", "Mar/2019"};
          	double[] income = {1000, 1170, 660};
          	double[] outcome = {400, 460, 1120};
          	for(int i=0; i<3; i++) {
          		out.println("['" + 
          					labels[i] + "', " + 
          					income[i] + ", " +
          					outcome[i] + "]" + 
          					(i != 2 ? "," : ""));
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
  </body>
</html>
