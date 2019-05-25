package fcs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public final class Main {
	private static List<Usuario> usuarios;
	
	public static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	public static final String DB_URL = "jdbc:mysql://localhost/fcs";

	public static final String DB_USER = "username";
	public static final String PASSWORD = "password";
	
	public static Connection conn;

	private static String current_user;

	private Main() {
		usuarios = new ArrayList<Usuario>();
	}
	
	public static void setup() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, DB_USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		setup();
	}
	
	public static void registra_usuario(String usr, String pwd) {
		try {
			Statement statement = conn.createStatement();
			int result = statement.executeUpdate("INSERT INTO usuarios(nome,senha) VALUES('"+usr+"','"+pwd+"');");
			usuarios.add(new Usuario(usr,pwd));
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println("Usuario ja existe");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void login(String usr, String pwd) {
		try {
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery("SELECT senha FROM usuarios WHERE nome='"+usr+"';");
			rs.next();
			String pass = rs.getString("senha");
			if (pass.equals(pwd)) {
				System.out.println("Login realizado com sucesso!" + " usuario: "+usr);
				current_user = usr;
			} else {
				System.out.println("Senha incorreta.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
