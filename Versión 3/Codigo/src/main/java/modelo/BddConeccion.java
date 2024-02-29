package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BddConeccion {
    // Objeto Connection para la conexión con la base de datos
    private static Connection cnn = null;

    // Constructor privado para asegurar que la conexión sea única y controlada
    private BddConeccion() {
        if (cnn == null) {
            // Configuración de la conexión
            String servidor = "127.0.0.1";
            String database = "api_yoga";
            String usuario = "root";
            String password = "";
            String url = "jdbc:mysql://" + servidor + "/" + database;

            try {
                // Registro del controlador JDBC y establecimiento de la conexión
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                cnn = DriverManager.getConnection(url, usuario, password);
            } catch (SQLException e) {
                System.out.println("Error de conexión!!");
                e.printStackTrace();
            }
        }
    }

    // Método estático para obtener la conexión (Singleton pattern)
    public static Connection getConexion() {
        if (cnn == null) {
            // Si la conexión aún no ha sido establecida, se crea una nueva instancia de BddConeccion
            new BddConeccion();
        }
        return cnn;
    }

    // Método estático para cerrar el ResultSet
    public static void cerrar(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método estático para cerrar el PreparedStatement
    public static void cerrar(PreparedStatement pstmt) {
        try {
            if (pstmt != null)
                pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Método estático para cerrar la conexión
    public static void cerrar() {
        try {
            if (cnn != null) {
                cnn.close();
                cnn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
