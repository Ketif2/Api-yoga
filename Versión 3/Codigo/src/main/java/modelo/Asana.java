package modelo;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Asana implements Serializable {
    private static final long serialVersionUID = 1L;

    // Consulta SQL para seleccionar todas las asanas de la base de datos
    final String SQL_SELECT_ALL = "SELECT * FROM asanas;";

    // Lista estática para almacenar las asanas cargadas desde la base de datos
    private static ArrayList<Asana> listaAsanas = null;

    // Atributos de una Asana
    private String nombreEnIngles;
    private String nombreEnEspañol;
    private String nombreEnSans;
    private String categoria;
    private String rutaImagen;
    private int id;

    // Constructores
    public Asana() {
    }

    // Constructor para inicializar Asana con nombres en inglés, español y sánscrito
    public Asana(String nombreEnIngles, String nombreEnEspañol, String nombreEnSans) {
        super();
        this.nombreEnIngles = nombreEnIngles;
        this.nombreEnEspañol = nombreEnEspañol;
        this.nombreEnSans = nombreEnSans;
    }

    // Métodos getter y setter para los atributos de Asana
    // Estos métodos permiten acceder y modificar los valores de los atributos

    public String getNombreEnIngles() {
        return nombreEnIngles;
    }

    public void setNombreEnIngles(String nombreEnIngles) {
        this.nombreEnIngles = nombreEnIngles;
    }

    public String getNombreEnEspañol() {
        return nombreEnEspañol;
    }

    public void setNombreEnEspañol(String nombreEnEspañol) {
        this.nombreEnEspañol = nombreEnEspañol;
    }

    public String getNombreEnSans() {
        return nombreEnSans;
    }

    public void setNombreEnSans(String nombreEnSans) {
        this.nombreEnSans = nombreEnSans;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getRutaImagen() {
        return rutaImagen;
    }

    public void setRutaImagen(String rutaImgen) {
        this.rutaImagen = rutaImgen;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	// Método para obtener todas las Asanas desde la base de datos
    public ArrayList<Asana> getAsanas() {
        listaAsanas = new ArrayList<Asana>();
        try {
            // Preparar y ejecutar la consulta SQL
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_ALL);
            ResultSet rs = pstm.executeQuery();

            // Procesar los resultados y almacenar las asanas en la lista
            while (rs.next()) {
                Asana asana = new Asana();
                asana.setId(rs.getInt(1));
                asana.setNombreEnIngles(rs.getString(2));
                asana.setNombreEnEspañol(rs.getString(3));
                asana.setNombreEnSans(rs.getString(4));
                asana.setRutaImagen(rs.getString(5));
                asana.setCategoria(rs.getString(6));
                listaAsanas.add(asana);
            }

            // Cerrar recursos
            BddConeccion.cerrar(rs);
            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaAsanas;
    }

    // Método para buscar una Asana por su nombre en sánscrito en la lista
    public Asana buscarPorNombre(String nombre, ArrayList<Asana> listaAsanas) {
        for (Asana asana : listaAsanas) {
            if (asana.getNombreEnSans().equalsIgnoreCase(nombre)) {
                return asana;
            }
        }
        return null;
    }

    // Método para obtener Asanas por categoría desde la base de datos
    public ArrayList<Asana> getAsanasPorCategoria(String categoria) {
        listaAsanas = new ArrayList<Asana>();
        final String SQL_SELECT_BY_CATEGORY = "SELECT * FROM asanas WHERE categoria = ?;";

        try {
            // Preparar y ejecutar la consulta SQL con parámetro
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_BY_CATEGORY);
            pstm.setString(1, categoria);
            ResultSet rs = pstm.executeQuery();

            // Procesar los resultados y almacenar las asanas en la lista
            while (rs.next()) {
                Asana asana = new Asana();
                asana.setId(rs.getInt(1));
                asana.setNombreEnIngles(rs.getString(2));
                asana.setNombreEnEspañol(rs.getString(3));
                asana.setNombreEnSans(rs.getString(4));
                asana.setRutaImagen(rs.getString(5));
                asana.setCategoria(rs.getString(6));
                listaAsanas.add(asana);
            }

            // Cerrar recursos
            BddConeccion.cerrar(rs);
            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaAsanas;
    }
    
    
    //Nueva iteración V3.0
    //OPERACIONES CRUD
    
    public void guardarAsana(Asana nuevaAsana) {
    	final String SQL_INSERT = "INSERT INTO asanas (nombreIngles, nombreEsp, nombreSanscrito, "
    			+ "imagenRuta, categoria) VALUES (?, ?, ?, ?, ?)";
    	try {
			PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_INSERT);
			pstm.setString(1, nuevaAsana.getNombreEnIngles());
	        pstm.setString(2, nuevaAsana.getNombreEnEspañol());
	        pstm.setString(3, nuevaAsana.getNombreEnSans());
	        pstm.setString(4, nuevaAsana.getRutaImagen());
	        pstm.setString(5, nuevaAsana.getCategoria());
	        pstm.executeUpdate();
	        
            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();
            
            System.out.println("Asana guardada exitosamente en la base de datos.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("ERROR: No se guardo la ASANA");
			e.printStackTrace();
			
		}
    }
    
    public void actualizarAsana(Asana asanaActualizada) {
        final String SQL_UPDATE = "UPDATE asanas SET nombreIngles = ?, nombreEsp = ?, nombreSanscrito = ?, "
                + "imagenRuta = ?, categoria = ? WHERE idAsana = ?";
        try {
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_UPDATE);
            pstm.setString(1, asanaActualizada.getNombreEnIngles());
            pstm.setString(2, asanaActualizada.getNombreEnEspañol());
            pstm.setString(3, asanaActualizada.getNombreEnSans());
            pstm.setString(4, asanaActualizada.getRutaImagen());
            pstm.setString(5, asanaActualizada.getCategoria());
            pstm.setInt(6, asanaActualizada.getId());
            pstm.executeUpdate();

            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();

            System.out.println("Asana actualizada exitosamente en la base de datos.");
        } catch (SQLException e) {
            System.out.println("ERROR: No se pudo actualizar la ASANA");
            e.printStackTrace();
        }
    }
    
    public void eliminarAsana(int idAsana) {
        final String SQL_DELETE = "DELETE FROM asanas WHERE idAsana = ?";
        try {
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_DELETE);
            pstm.setInt(1, idAsana);
            pstm.executeUpdate();

            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();

            System.out.println("Asana eliminada exitosamente de la base de datos.");
        } catch (SQLException e) {
            System.out.println("ERROR: No se pudo eliminar la ASANA");
            e.printStackTrace();
        }
    }

}
