package tests;

import java.util.ArrayList;
import org.junit.Test;
import modelo.Asana;

public class testAsana {
	Asana asanaModel = new Asana();
	ArrayList<Asana> listaAsana = asanaModel.getAsanas();
	
	@Test
	public void testBuscarPorNombre() {
		
		Asana foundAsana = asanaModel.buscarPorNombre("Tadasana", listaAsana);
		if(foundAsana != null) {
			String nombreAsana = foundAsana.getNombreEnSans();
			System.out.println("Se encontró el Asana -> " + nombreAsana);
		} else {
			System.out.println("No se encontro ninguna Asana con ese nombre");
		}
	}
	
	@Test
	public void testAsanasPorCategoria() {
		String categoria = "p";
		ArrayList<Asana> foundAsanaCategoria = asanaModel.getAsanasPorCategoria(categoria);
		if(foundAsanaCategoria != null) {
			System.out.println("Asanas encontradas por categoria -> " + categoria);
			for (Asana asana : foundAsanaCategoria) {
				System.out.println(asana.getNombreEnSans());
			}
		} else {
			System.out.println("No se encontro las asanas por categoria");
		}
	}

}
