package fcs;

import java.util.ArrayList;
import java.util.List;

import java.time.LocalDate;
import java.time.ZoneId;

public class Usuario {
	private String nome;
	private String senha;
	private float limite_de_credito;
	
	private List<Transacao> transacoes;
	
	public Usuario(String usr, String pwd) {
		nome = usr;
		senha = pwd;
		transacoes = new ArrayList<Transacao>();
	}
	
	public void registra_transacao(Transacao t) {
		transacoes.add(t);
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
