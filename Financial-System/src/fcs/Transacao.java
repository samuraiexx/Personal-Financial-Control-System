package fcs;

import java.util.Date;

public class Transacao {
	protected float valor;
	protected Date data;
	
	public Transacao(float v, Date d) {
		valor = v;
		data = d;
	}
	
	public Date get_data() {
		return data;
	}
	public float get_valor() {
		return valor;
	}
	
	public String toString() {
		return "{ valor : " + valor + ", data : " + data.toString() + " }";
	}
}
