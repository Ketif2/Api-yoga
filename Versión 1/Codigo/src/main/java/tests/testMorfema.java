package tests;
import java.util.ArrayList;
import org.junit.Test;
import modelo.Morfema;

public class testMorfema {
	Morfema morfemaModel = new Morfema();
	ArrayList<Morfema> listaMorfemas = morfemaModel.getMorfemas();
	
	@Test
	public void testBuscarPorNombre() {
		String morfemaTest = "Parivrtta";
		Morfema foundMorfema = morfemaModel.buscarPorNombre(morfemaTest, listaMorfemas);
		if(foundMorfema != null) {
			String nombreMorfema = foundMorfema.getNombreMorfema();
			System.out.println("Se encontró el Morfema -> " + nombreMorfema);
		} else {
			System.out.println("No se encontro ningun Morfema con ese nombre");
		}
	}
	
	@Test
	public void testBuscarMorfemasEnAsana() {
		String asanaEjemplo = "arivrtta Trikonasana";
		ArrayList<Morfema> foundMorfemaByAsana = morfemaModel.buscarMorfemasEnPalabra(asanaEjemplo, listaMorfemas);
		if(foundMorfemaByAsana != null) {
			System.out.println("En la palabra en sanscrito -> " + asanaEjemplo);
			for(Morfema morfema : foundMorfemaByAsana) {
				System.out.println(morfema.getNombreMorfema()+"  ->  " + morfema.getTraduccion());
			}
		} else {
			System.out.println("No se encontro morfemas con esa Asana");
		}
	}
	
}
