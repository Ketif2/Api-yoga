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
		super();
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
		case "error":
			this.error(request, response);
			break;		
		}
	}
	private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.sendRedirect("jsp/dashboard.jsp");
	}
	
	private void searchAsana(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String sanskritName = request.getParameter("sanskritName");//Nombre obtenido por la busqueda del jsp 
        Asana asanaModel = new Asana();
        Morfema morfemaModel = new Morfema();
    	ArrayList<Asana> listaAsanas = asanaModel.getAsanas();
    	ArrayList<Morfema> listaMorfema = morfemaModel.getMorfemas();
    	
        Asana foundAsana = asanaModel.buscarPorNombre(sanskritName,listaAsanas);
        ArrayList<Morfema> foundMorfemas = morfemaModel.buscarMorfemasEnPalabra(sanskritName, listaMorfema);
        
        if (foundAsana != null) {
        	System.out.println("si se econtro");
        	String nombreAsana = foundAsana.getNombreEnSans();
            request.setAttribute("sancrito", nombreAsana);
            request.setAttribute("ingles", foundAsana.getNombreEnIngles());
            request.setAttribute("español" , foundAsana.getNombreEnEspañol());
            request.setAttribute("rutaImagen" , foundAsana.getRutaImgen());
            request.setAttribute("morfemas", foundMorfemas);
            request.getRequestDispatcher("jsp/searchResultAsana.jsp").forward(request, response);
        } else {
        	System.out.println("NO se encontro");
            error(request, response);
        }   
    }
	
	private void searchMorfema(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		/*
		String morfemaName = request.getParameter("morfemaName");
        Morfema morfemaModel = new Morfema();
        Morfema foundMorfema = morfemaModel.buscarPorNombre(morfemaName);

        if (foundMorfema != null) {
            request.setAttribute("foundMorfema", foundMorfema);
            request.getRequestDispatcher("jsp/searchResult.jsp").forward(request, response);
        } else {
            error(request, response);
        }
        */
	}

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
