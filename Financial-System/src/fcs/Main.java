package fcs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public final class Main {
	private  List<Usuario> usuarios;
	
	public final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	public final String DB_URL = "jdbc:mysql://localhost/fcs";

	public final String DB_USER = "username";
	public final String PASSWORD = "password";
	
	public Connection conn;

	private String current_user;

	public Main() {
		usuarios = new ArrayList<Usuario>();
	}
	
	public void Connect() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean registra_usuario(String usr, String pwd) {
		try {
			Statement statement = conn.createStatement();
			int result = statement.executeUpdate("INSERT INTO usuarios(nome,senha) VALUES('"+usr+"','"+pwd+"');");
			usuarios.add(new Usuario(usr,pwd));
			return true;
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("Usuario ja existe");
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean login(String usr, String pwd) {
		try {
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery("SELECT senha FROM usuarios WHERE nome='"+usr+"';");
			rs.next();
			String pass = rs.getString("senha");
			if (pass.equals(pwd)) {
				System.out.println("Login realizado com sucesso!" + " usuario: "+usr);
				current_user = usr;
				return true;
			} else {
				System.out.println("Senha incorreta.");
				return false;
			}
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
