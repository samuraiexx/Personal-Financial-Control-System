package fcs;

import java.util.ArrayList;
import java.util.List;
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
	}
	
	public void registra_transacao(Transacao t) {
		try {
			Statement statement = Main.conn.createStatement();
			String query = "";
			if (t instanceof Receita) {
				query = "INSERT INTO transacoes(valor,data,nome_usuario) VALUES (" + t.valor+ ", now(),'"+nome+"');";
			} else if (t instanceof Despesa) {
				Despesa d = (Despesa) t;
				String is_credito = d.pago_em_credito() ? "true" : "false";
				query = "INSERT INTO transacoes(valor,data,is_credito,categoria,nome_usuario) "
						+ "VALUES (" + t.valor+ ", now()," + is_credito + ",'" + d.get_categoria()+"','"+nome+"');";
			}
			statement.executeUpdate(query);
			transacoes.add(t);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void listar_transacoes() {
		for (Transacao t : transacoes) {
			System.out.println(t.toString());
		}
	}
	public float gerar_balanco_mensal() {
		List<Transacao> transacoes_mes = new ArrayList<Transacao>();
		float net = 0;

		int now_month = LocalDate.now().getMonthValue();
		int now_year = LocalDate.now().getYear();
		for (Transacao t : transacoes) {
			LocalDate local = t.get_data().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			if(local.getMonthValue() == now_month && local.getYear() == now_year) {
			}
		}
		
		for (Transacao t : transacoes_mes) {
			if (t instanceof Despesa) {
				net -= t.get_valor();
			} else if (t instanceof Receita) {
				net += t.get_valor();
			}
		}
		
		return net;
	}
	
	public String toString() {
		return "{ nome : " + nome + ", senha : " + senha + " }";
	}
}
