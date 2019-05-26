package fcs;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;

public class Usuario {
	private String nome;
	private String senha;
	private float limite_de_credito;
	
	private Main main;
	
	private List<Transacao> transacoes;
	
	public Usuario(String usr, String pwd) {
		nome = usr;
		senha = pwd;
		transacoes = new ArrayList<Transacao>();
		main = new Main();
		main.Connect();
	}
	
	@SuppressWarnings("deprecation")
	public boolean registra_transacao(Transacao t) {
		try {
			Statement statement = main.conn.createStatement();

			Date data = t.get_data();
			String dateString = data.getYear()+"-" +data.getMonth() + "-" + data.getDay() ;
			String query = "";
			if (t instanceof Receita) {
				query = "INSERT INTO transacoes(valor,data,nome_usuario) VALUES (" + t.valor+ ", now(),'"+nome+"');";
			} else if (t instanceof Despesa) {
				Despesa d = (Despesa) t;
				String is_credito = d.pago_em_credito() ? "true" : "false";
				query = "INSERT INTO transacoes(valor,data,is_credito,categoria,nome_usuario) "
						+ "VALUES (" + t.valor+ ", '"+dateString+"'," + is_credito + ",'" + d.get_categoria()+"','"+nome+"');";
			}
			statement.executeUpdate(query);
			transacoes.add(t);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
		}
	}
	
	private void load_transacoes() {
		List<Transacao> new_transacoes = new ArrayList<Transacao>();
		try {
			String query = "SELECT * FROM transacoes;";
			Statement statement = main.conn.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while (rs.next()) {
				Object categoria = rs.getObject("categoria");
				Date data = rs.getDate("data");
				int valor = rs.getInt("valor");
				boolean is_credito = rs.getBoolean("valor");
				
				if (categoria == null) {
					new_transacoes.add(new Receita(valor,data));
				} else {
					String type = rs.getString("categoria");
					new_transacoes.add(new Despesa(valor,data,is_credito,type));
				}
			}
			transacoes = new_transacoes;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void listar_transacoes() {
		load_transacoes();
		for (Transacao t : transacoes) {
			System.out.println(t.toString());
		}
	}
	public List<Transacao> gerar_balanco_mensal(int mes, int ano) {
		load_transacoes();
		List<Transacao> transacoes_mes = new ArrayList<Transacao>();
		
		for (Transacao t : transacoes) {
			if(t.get_data().getMonth() == mes && t.get_data().getYear()+1900 == ano) {
				transacoes_mes.add(t);
			}
		}
		
		return transacoes_mes;
	}
	
	public String toString() {
		return "{ nome : " + nome + ", senha : " + senha + " }";
	}
}
