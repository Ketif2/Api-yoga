package modelo;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Morfema implements Serializable {
    private static final long serialVersionUID = 1L;

    // Consulta SQL para seleccionar todos los morfemas de la base de datos
    final String SQL_SELECT_ALL = "SELECT * FROM morfemas;";

    // Lista estática para almacenar los morfemas cargados desde la base de datos
    private static ArrayList<Morfema> listaMorfemas = null;

    // Atributos de un Morfema
    private String nombreMorfema;
    private String traduccionEsp;
    private String traduccionIngles;

    // Constructores
    public Morfema() {
    }

    public Morfema(String nombreMorfema, String traduccionEsp, String traduccionIngles) {
		this.nombreMorfema = nombreMorfema;
		this.traduccionEsp = traduccionEsp;
		this.traduccionIngles = traduccionIngles;
	}
    
	public String getNombreMorfema() {
		return nombreMorfema;
	}

	public void setNombreMorfema(String nombreMorfema) {
		this.nombreMorfema = nombreMorfema;
	}

	public String getTraduccionEsp() {
		return traduccionEsp;
	}

	public void setTraduccionEsp(String traduccionEsp) {
		this.traduccionEsp = traduccionEsp;
	}

	public String getTraduccionIngles() {
		return traduccionIngles;
	}

	public void setTraduccionIngles(String traduccionIngles) {
		this.traduccionIngles = traduccionIngles;
	}

	// Método para obtener todos los morfemas desde la base de datos
    public ArrayList<Morfema> getMorfemas() {
        listaMorfemas = new ArrayList<Morfema>();
        try {
            // Preparar y ejecutar la consulta SQL
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_ALL);
            ResultSet rs = pstm.executeQuery();

            // Procesar los resultados y almacenar los morfemas en la lista
            while (rs.next()) {
                Morfema morfema = new Morfema();
                morfema.setNombreMorfema(rs.getString(2));
                morfema.setTraduccionEsp(rs.getString(3));
                morfema.setTraduccionIngles(rs.getString(4));
                listaMorfemas.add(morfema);
            }

            // Cerrar recursos
            BddConeccion.cerrar(rs);
            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaMorfemas;
    }

    // Método para buscar un Morfema por su nombre en la lista
    public Morfema buscarPorNombre(String nombre, ArrayList<Morfema> listaMorfemas) {
        for (Morfema morfema : listaMorfemas) {
            if (morfema.getNombreMorfema().equalsIgnoreCase(nombre)) {
                return morfema;
            }
        }
        return null;
    }

    // Método para buscar morfemas en una palabra dada
    public ArrayList<Morfema> buscarMorfemasEnPalabra(String palabra, ArrayList<Morfema> listaMorfemas) {
        ArrayList<Morfema> morfemasEncontrados = new ArrayList<>();

        for (Morfema morfema : listaMorfemas) {
            if (palabra.toLowerCase().contains(morfema.getNombreMorfema().toLowerCase())) {
                morfemasEncontrados.add(morfema);
            }
        }

        return morfemasEncontrados;
    }
}

