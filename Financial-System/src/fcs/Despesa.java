package fcs;

import java.util.Date;

public class Despesa extends Transacao {
	private boolean pago_em_credito;
	private String categoria;

	public Despesa(float v, Date d, boolean is_credito, String type) {
		super(v, d);
		pago_em_credito = is_credito;
		categoria = type;
	}
	
	public String get_categoria() { return categoria; }
	public boolean pago_em_credito() { return pago_em_credito; }
	
	public String toString() {
		String credito = pago_em_credito? "Credito" : "-" ;
		String transacao = "{ valor : " + valor + ", data : " + data.toString();
		return  transacao + ", " + credito + ", " + categoria + "}";
	}
}
