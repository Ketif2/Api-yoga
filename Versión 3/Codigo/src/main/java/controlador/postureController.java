package controlador;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Asana;
import modelo.Morfema;

@WebServlet("/postureController")
public class postureController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public postureController() {
	}

	// Método para manejar solicitudes GET
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.router(request, response);
	}

	// Método para manejar solicitudes POST
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.router(request, response);
	}

	// Método para enrutar solicitudes
	public void router(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String rute = request.getParameter("rute");
		switch (rute) {
		case "showDashboard":
			this.showDashboard(request, response);
			break;
		case "searchAsana":
			this.searchAsana(request, response);
			break;
		case "searchMorfema":
			this.searchMorfema(request, response);
			break;
		case "searchAsanaByCategory":
			this.searchAsanaByCategory(request, response);
			break;
		case "guardarAsana":
			this.saveAsana(request, response);
			break;
		case "actualizarAsana":
			this.updateAsana(request, response);
			break;
		case "eliminarAsana":
			this.deleteAsana(request, response);
			break;
		}
	}

	// Método para mostrar el panel de control (dashboard)
	private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("jsp/dashboard.jsp");
	}

	// Método para buscar información sobre una asana por su nombre sánscrito
	private void searchAsana(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sanskritName = request.getParameter("sanskritName");
		String postureName = validateWhiteSpaces(sanskritName);
		Morfema morfemaModel = new Morfema();
		Asana asanaModel = new Asana();
		ArrayList<Asana> listaAsanas = asanaModel.getAsanas();
		ArrayList<Morfema> listaMorfema = morfemaModel.getMorfemas();
		Asana foundAsana = asanaModel.buscarPorNombre(postureName, listaAsanas);

		if (foundAsana != null) {
			String nombreAsana = foundAsana.getNombreEnSans();
			ArrayList<Morfema> foundMorfemas = morfemaModel.buscarMorfemasEnPalabra(foundAsana.getNombreEnSans(),
					listaMorfema);
			request.setAttribute("id", foundAsana.getId());
			request.setAttribute("sancrito", nombreAsana);
			request.setAttribute("ingles", foundAsana.getNombreEnIngles());
			request.setAttribute("español", foundAsana.getNombreEnEspañol());
			request.setAttribute("rutaImagen", foundAsana.getRutaImagen());
			request.setAttribute("morfemas", foundMorfemas);
			request.getRequestDispatcher("/jsp/searchResultAsana.jsp").forward(request, response);
		} else {
			request.setAttribute("error",
					"Postura no encontrada.\nPor favor, verifica que el nombre de la postura"
					+ " ingresada sea correcto e inténtalo nuevamente.");
			request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);
		}
	}

	// Método para buscar información sobre un morfema por su nombre
	private void searchMorfema(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String morfemaName = validateWhiteSpaces(request.getParameter("morfemaName"));

		Morfema morfemaModel = new Morfema();
		ArrayList<Morfema> listaMorfemas = morfemaModel.getMorfemas();
		Morfema foundMorfema = morfemaModel.buscarPorNombre(morfemaName, listaMorfemas);

		if (foundMorfema != null) {
			request.setAttribute("morfemaSancrito", foundMorfema.getNombreMorfema());
			request.setAttribute("morfemaEspañol", foundMorfema.getTraduccionEsp());
			request.setAttribute("morfemaIngles", foundMorfema.getTraduccionIngles());
			System.out.println("" + foundMorfema.getNombreMorfema() + foundMorfema.getTraduccionEsp());
			request.getRequestDispatcher("/jsp/searchResultMorfema.jsp").forward(request, response);
		} else {
			request.setAttribute("error1",
					"Morfema no encontrado.\nPor favor, verifica que el morfema ingresado sea correcto"
					+ " e inténtalo nuevamente.");
			request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);

		}
	}

	// Método para buscar asanas por categoría
	private void searchAsanaByCategory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String categoria = request.getParameter("category");
		String translatedCategory;
		switch (categoria) {
		case "p":
			translatedCategory = "De Pie";
			break;
		case "s":
			translatedCategory = "Sedente";
			break;
		case "a":
			translatedCategory = "Decúbito";
			break;
		default:
			translatedCategory = "Valor por defecto";
			break;
		}
		Asana asanaModel = new Asana();
		ArrayList<Asana> asanasPorCategoria = asanaModel.getAsanasPorCategoria(categoria);
		request.setAttribute("asanasPorCategoria", asanasPorCategoria);
		request.setAttribute("Categoria", translatedCategory);
		request.getServletContext().getRequestDispatcher("/jsp/searchAsanaByCategory.jsp").forward(request, response);
	}

	private void saveAsana(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String nombreEnIngles = validateWhiteSpaces(request.getParameter("nombreEnIngles"));
		String nombreEnEspañol = validateWhiteSpaces(request.getParameter("nombreEnEspanol"));
		String nombreEnSans = validateWhiteSpaces(request.getParameter("nombreEnSans"));
		String categoria = validateWhiteSpaces(request.getParameter("categoria"));
		String rutaImagen = validateWhiteSpaces(request.getParameter("rutaImagen"));

		Asana nuevaAsana = new Asana(nombreEnIngles, nombreEnEspañol, nombreEnSans);
		nuevaAsana.setCategoria(categoria);
		nuevaAsana.setRutaImagen(rutaImagen);
		nuevaAsana.guardarAsana(nuevaAsana);

		request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);

	}

	private void updateAsana(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int idAsana = Integer.parseInt(request.getParameter("idAsana"));
		String nombreEnIngles = validateWhiteSpaces(request.getParameter("nombreEnIngles"));
		String nombreEnEspañol = validateWhiteSpaces(request.getParameter("nombreEnEspanol"));
		String nombreEnSans = validateWhiteSpaces(request.getParameter("nombreEnSans"));
		String categoria = validateWhiteSpaces(request.getParameter("categoria"));
		String rutaImagen = validateWhiteSpaces(request.getParameter("rutaImagen"));

		Asana asanaActualizada = new Asana(nombreEnIngles, nombreEnEspañol, nombreEnSans);
		asanaActualizada.setId(idAsana);
		asanaActualizada.setCategoria(categoria);
		asanaActualizada.setRutaImagen(rutaImagen);

		asanaActualizada.actualizarAsana(asanaActualizada);

		request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);
	}
    // Método para eliminar una Asana de la base de datos
    private void deleteAsana(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
    	int idAsana = Integer.parseInt(request.getParameter("idAsana"));
        Asana asana = new Asana();
        asana.setId(idAsana);
        asana.eliminarAsana(idAsana);

        request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response); 
    }
    
    private String validateWhiteSpaces(String text) {
    	String newString = text.strip();
    	newString = newString.replaceAll("\\s+", " ");
        return newString;
    }
    
}
