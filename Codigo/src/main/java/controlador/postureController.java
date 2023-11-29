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
public class postureController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public postureController() {
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
			this.router(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
			this.router(request, response);
	}
	
	private void router(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    String rute = request.getParameter("rute");
	    switch (rute) {
	        case "showDashboard":
	            this.showDashboard(request, response);
	            break;
	        case "searchAsana":
	            this.searchAsana(request,response);
	            break;
	        case "searchMorfema":
	            this.searchMorfema(request,response);
	            break; // Agregar break aquí
	        case "searchAsanaByCategory":
	            this.searchAsanaByCategory(request,response);
	            break;
	        case "error":
	            this.error(request, response);
	            break;
<<<<<<< HEAD
	    }
=======
      }
>>>>>>> b9edf8cf485417f0681920ef1e4fd5a0d4cbbacd
	}

	private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.sendRedirect("jsp/dashboard.jsp");
<<<<<<< HEAD
	}
	
	private void searchAsana(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String sanskritName = request.getParameter("sanskritName");//Nombre obtenido por la busqueda del jsp
        Morfema morfemaModel = new Morfema();
        Asana asanaModel = new Asana();
    	ArrayList<Asana> listaAsanas =asanaModel.getAsanas();
    	ArrayList<Morfema> listaMorfema = morfemaModel.getMorfemas();
        Asana foundAsana = asanaModel.buscarPorNombre(sanskritName,listaAsanas);
        ArrayList<Morfema> foundMorfemas = morfemaModel.buscarMorfemasEnPalabra(sanskritName, listaMorfema);
                
=======
        String sanskritName = request.getParameter("sanskritName");//Nombre obtenido por la busqueda del jsp 
        Asana asanaModel = new Asana();
        Morfema morfemaModel = new Morfema();
    	  ArrayList<Asana> listaAsanas = asanaModel.getAsanas();
    	  ArrayList<Morfema> listaMorfema = morfemaModel.getMorfemas();
    	
        Asana foundAsana = asanaModel.buscarPorNombre(sanskritName,listaAsanas);
        ArrayList<Morfema> foundMorfemas = morfemaModel.buscarMorfemasEnPalabra(sanskritName, listaMorfema);
     
>>>>>>> b9edf8cf485417f0681920ef1e4fd5a0d4cbbacd
        if (foundAsana != null) {
        	System.out.println("si se econtro");
        	String nombreAsana = foundAsana.getNombreEnSans();
            request.setAttribute("sancrito", nombreAsana);
            request.setAttribute("ingles", foundAsana.getNombreEnIngles());
            request.setAttribute("español" , foundAsana.getNombreEnEspañol());
            request.setAttribute("rutaImagen" , foundAsana.getRutaImgen());
            request.setAttribute("morfemas", foundMorfemas);
            request.getRequestDispatcher("/jsp/searchResultAsana.jsp").forward(request, response);
        } else {
<<<<<<< HEAD
            request.setAttribute("error", "La postura no fue encontrada.");
            request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);
        }
=======
        	System.out.println("NO se encontro");
            error(request, response);
        }   
>>>>>>> b9edf8cf485417f0681920ef1e4fd5a0d4cbbacd
    }
	
	private void searchMorfema(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		String morfemaName = request.getParameter("morfemaName");
		System.out.println(morfemaName);
		
        Morfema morfemaModel = new Morfema();
        ArrayList<Morfema> listaMorfemas = morfemaModel.getMorfemas();
        Morfema foundMorfema = morfemaModel.buscarPorNombre(morfemaName, listaMorfemas);

        if (foundMorfema != null) {
            request.setAttribute("morfemaSancrito", foundMorfema.getNombreMorfema());
            request.setAttribute("morfemaEspañol", foundMorfema.getTraduccion());
            System.out.println("" + foundMorfema.getNombreMorfema() + foundMorfema.getTraduccion());
            request.getRequestDispatcher("/jsp/searchResultMorfema.jsp").forward(request, response);
        } else {
            request.setAttribute("error1", "El Morfema no fue encontrado.");
            request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);

        }
	}

<<<<<<< HEAD
	
=======
>>>>>>> b9edf8cf485417f0681920ef1e4fd5a0d4cbbacd
	private void searchAsanaByCategory(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    // Paso 1: Obtener el parámetro de categoría
	    String categoria = request.getParameter("category");
	    String translatedCategory;
	    switch (categoria) {
	        case "p":
	            translatedCategory = "De Pie";
	            break;
	        case "s":
	            translatedCategory = "Sentado";
	            break;
	        case "a":
	            translatedCategory = "Sedente";
	            break;
	        default:
	            // Valor por defecto si no coincide con ninguno de los casos anteriores
	            translatedCategory = "Valor por defecto";
	            break;
	    }

	    // Paso 2: Obtener Asanas filtradas por categoría
	    Asana asanaModel = new Asana();
	    ArrayList<Asana> asanasPorCategoria = asanaModel.getAsanasPorCategoria(categoria);
	    
	    // Paso 3: Almacenar el resultado en el objeto de solicitud
	    request.setAttribute("asanasPorCategoria", asanasPorCategoria);
	    request.setAttribute("Categoria", translatedCategory);
	    // Paso 4: Redirigir a la vista correspondiente
	    request.getServletContext().getRequestDispatcher("/jsp/searchAsanaByCategory.jsp").forward(request, response);
	}
<<<<<<< HEAD
	

=======
  
>>>>>>> b9edf8cf485417f0681920ef1e4fd5a0d4cbbacd
	private void error(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String mensaje = "ERROR";
		request.setAttribute("mensaje", mensaje);
		try {
			request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
