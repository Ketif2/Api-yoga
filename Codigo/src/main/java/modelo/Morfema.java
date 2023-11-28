package modelo;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Morfema implements Serializable{
	private static final long serialVersionUID = 1L;
	
	final String SQL_SELECT_ALL = "SELECT * FROM morfemas;";
	private static ArrayList<Morfema> listaMorfemas = null;
	
	private String nombreMorfema;
    private String traduccion;
    
    public Morfema() {
    }

    public Morfema(String nombreMorfema, String traduccion) {
        this.nombreMorfema = nombreMorfema;
        this.traduccion = traduccion;
    }

    public String getNombreMorfema() {
        return nombreMorfema;
    }

    public void setNombreMorfema(String nombreMorfema) {
        this.nombreMorfema = nombreMorfema;
    }

    public String getTraduccion() {
        return traduccion;
    }

    public void setTraduccion(String traduccion) {
        this.traduccion = traduccion;
    }
    
    public ArrayList<Morfema> getAsanas(){
    	listaMorfemas = new ArrayList<Morfema>();
    	try {
    		PreparedStatement pstm = BddConeccion.getConexion().prepareStatement(SQL_SELECT_ALL);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				Morfema morfema = new Morfema();
				morfema.setNombreMorfema("nombreMorfema");
				morfema.setTraduccion("traduccionEsp");
			}
			BddConeccion.cerrar(rs);
			BddConeccion.cerrar(pstm);
			BddConeccion.cerrar();
;		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listaMorfemas;
	}
    
    public Morfema buscarPorNombre(String nombre) {
        for (Morfema morfema : listaMorfemas) {
            if (morfema.getNombreMorfema().equalsIgnoreCase(nombre)) {
                return morfema;
            }
        }
        return null; 
    }
    public ArrayList<Morfema> buscarMorfemasEnPalabra(String palabra) {
        ArrayList<Morfema> morfemasEncontrados = new ArrayList<>();

        for (Morfema morfema : listaMorfemas) {
            if (palabra.toLowerCase().contains(morfema.getNombreMorfema().toLowerCase())) {
                morfemasEncontrados.add(morfema);
            }
        }

        return morfemasEncontrados;
    }
    
    public String imprmirListaMorfema() {
        StringBuilder result = new StringBuilder("");

        for (Morfema morfema : listaMorfemas) {
            result.append(morfema.toString()).append("\n");
        }

        return result.toString();
    }
    
 

	@Override
	public String toString() {
		return "Nombre del morfema: " + nombreMorfema + " Traduccion: " + traduccion;
    }    
}
