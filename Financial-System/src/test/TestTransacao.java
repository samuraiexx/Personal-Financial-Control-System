package test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import fcs.Receita;
import fcs.Transacao;
import fcs.Usuario;
import fcs.Despesa;
import fcs.Main;

public class TestTransacao {

	public static void main(String args[]) {
		testReceita();
		testDespesa();
		testUsuario();
	}
	
	private static void testReceita() {
		System.out.println("Test Receita");
		List<Transacao> receitas = new ArrayList<Transacao>();
		
		receitas.add(new Receita(5, new Date(1558721070)));
		receitas.add(new Receita(6, new Date(1558721071)));
		receitas.add(new Receita(7, new Date(1558721072)));
		receitas.add(new Receita(8, new Date(1558721073)));
		
		float net = 0;
		for (Transacao t : receitas) {
			net += t.get_valor();
			System.out.println(t.toString());
		}
		
		System.out.println("Receita total:" + net);
	}

	private static void testDespesa() {
		List<Transacao> despesas = new ArrayList<Transacao>();
		
		long now = System.currentTimeMillis();
		despesas.add(new Despesa(5, new Date(now), true, "Lentilha"));
		despesas.add(new Despesa(6, new Date(now+1000), true, "Proteina"));
		despesas.add(new Despesa(5, new Date(now+2000), false, "Leite de Amendoa"));
		
		float net = 0;
		for (Transacao t : despesas) {
			net -= t.get_valor();
			System.out.println(t.toString());
		}
		
		System.out.println("Despesa total: " + net);
	}
	
	private static void testUsuario() {
		System.out.println("teste_usuario");
		Usuario usr = new Usuario("pepega", "pepegapwd");
		Main main = new Main();
		main.Connect();
		boolean login = main.login("pepega", "pepegapwd");
		assert login == true;
		
		long now = System.currentTimeMillis();
		Date date = new Date(1990,10,3);
		usr.registra_transacao(new Despesa(5, date, true, "Lentilha"));
		usr.registra_transacao(new Receita(8, new Date(now)));

		System.out.println("listar_transacoes");
		usr.listar_transacoes();

		System.out.println("Balanco mensal: ");
		for (Transacao t : usr.gerar_balanco_mensal(9,1990)) {
			System.out.println(t.toString());
		}

	}
	
}
