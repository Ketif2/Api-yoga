package modelo;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Asana implements Serializable{
	private static final long serialVersionUID = 1L;
	
	final String SQL_SELECT_ALL = "SELECT * FROM asanas;";
	private static ArrayList<Asana> listaAsanas = null;

	
	private String nombreEnIngles;
    private String nombreEnEspañol;
    private String nombreEnSans;
    private String categoria;
    private String rutaImgen;
    
    public Asana() {
    }
    
    public Asana(String nombreEnIngles, String nombreEnEspañol, String nombreEnSans) {
    	super();
        this.nombreEnIngles = nombreEnIngles;
        this.nombreEnEspañol = nombreEnEspañol;
        this.nombreEnSans = nombreEnSans;
    }

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

    public String getRutaImgen() {
        return rutaImgen;
    }

    public void setRutaImgen(String rutaImgen) {
        this.rutaImgen = rutaImgen;
    }
    
    
    public ArrayList<Asana> getAsanas(){
    	listaAsanas = new ArrayList<Asana>();
    	try {
    		PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_ALL);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				Asana asana = new Asana();
				asana.setNombreEnIngles(rs.getString(2));
				asana.setNombreEnEspañol(rs.getString(3));
				asana.setNombreEnSans(rs.getString(4));
				asana.setRutaImgen(rs.getString(5));
				asana.setCategoria(rs.getString(6));
				listaAsanas.add(asana);
			}
			BddConeccion.cerrar(rs);
			BddConeccion.cerrar(pstm);
			BddConeccion.cerrar();
;		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listaAsanas;
	}
    
    public Asana buscarPorNombre(String nombre,ArrayList<Asana> listaAsanas) {
    	
        for (Asana asana : listaAsanas) {        	
            if (asana.getNombreEnSans().equalsIgnoreCase(nombre)) {
                return asana;
            }
        }
        return null; 
    }
    //Metodos sin uso
    
    public ArrayList<Asana> getAsanasPorCategoria(String categoria) {
        listaAsanas = new ArrayList<Asana>();
        final String SQL_SELECT_BY_CATEGORY = "SELECT * FROM asanas WHERE categoria = ?;";

        try {
            PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_BY_CATEGORY);
            pstm.setString(1, categoria);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Asana asana = new Asana();
                asana.setNombreEnIngles(rs.getString(2));
                asana.setNombreEnEspañol(rs.getString(3));
                asana.setNombreEnSans(rs.getString(4));
                asana.setRutaImgen(rs.getString(5));
                asana.setCategoria(rs.getString(6));
                listaAsanas.add(asana);
            }

            BddConeccion.cerrar(rs);
            BddConeccion.cerrar(pstm);
            BddConeccion.cerrar();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaAsanas;
    }

    
    public String imprimirListaAsanas() {
        StringBuilder result = new StringBuilder("ListaAsana:\n");

        for (Asana asana : listaAsanas) {
            result.append(asana.toString()).append("\n");
        }

        return result.toString();
    }


	@Override
	public String toString() {
		return "Asana: \n" + "NombreEnIngles " + nombreEnIngles + "\nNombreEnEspañol " + nombreEnEspañol + "\nNombreEnSanskrit " + nombreEnSans;
    }
    
}
