package fcs;

import java.util.Date;

public class Receita extends Transacao {

	public Receita(float v, Date d) {
		super(v, d);
	}
	public String toString() {
		return "{ valor : " + valor + ", data : " + data.toString() + "}";
	}
}
