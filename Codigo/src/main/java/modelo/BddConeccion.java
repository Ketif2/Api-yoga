package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BddConeccion {
	private static Connection cnn = null;
	
	//Constructor privado -> singletoon
		private BddConeccion() {
			String servidor = "127.0.0.1";//Nombre servidor
			String database = "api-yoga";
			String usuario = "root";
			String password = "";
			String url = "jdbc:mysql://" + servidor + "/" + database;
			
			try {
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());//Instancia de la clase de la libreria que nos descargamos
				cnn = DriverManager.getConnection(url, usuario, password);//Me entrega una conexion
				System.out.println("Conexion con exito");
			} catch (SQLException e) {
				System.out.println("Error de conexion!!");
				e.printStackTrace();
			}
		}
		//Metodo estatico que siempre nos permite acceder a la clase (static)
		public static Connection getConexion() {
			if(cnn == null) {
				new BddConeccion();
			}
			return cnn;
		}
		
		public static void cerrar(ResultSet rs) {
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		public static void cerrar (PreparedStatement pstmt) {
				try {
					if(pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		public static void cerrar () {
			try {
				if(cnn != null)
					cnn.close();
					cnn = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
}
