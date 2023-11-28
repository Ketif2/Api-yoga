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
		case "searchMorfemaInAsana":
			this.searchMorfemaInAsana(request,response);
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
        Asana foundAsana = asanaModel.buscarPorNombre(sanskritName);

        if (foundAsana != null) {
            request.setAttribute("foundAsana", foundAsana);
            request.getRequestDispatcher("jsp/searchResult.jsp").forward(request, response);
        } else {
            error(request, response);
        }
    }
	
	private void searchMorfema(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String morfemaName = request.getParameter("morfemaName");
        Morfema morfemaModel = new Morfema();
        Morfema foundMorfema = morfemaModel.buscarPorNombre(morfemaName);

        if (foundMorfema != null) {
            request.setAttribute("foundMorfema", foundMorfema);
            request.getRequestDispatcher("jsp/searchResult.jsp").forward(request, response);
        } else {
            error(request, response);
        }
	}
	
	private void searchMorfemaInAsana(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String asanaName = request.getParameter("asanaName");
        Asana asanaModel = new Asana();
        Asana foundAsana = asanaModel.buscarPorNombre(asanaName);

        if (foundAsana != null) {
            String nombreAsana = foundAsana.getNombreEnSans();
            ArrayList<Morfema> morfemasEnAsana = new Morfema().buscarMorfemasEnPalabra(nombreAsana);

            request.setAttribute("countMorfemas", morfemasEnAsana.size());
            request.getRequestDispatcher("jsp/searchResult.jsp").forward(request, response);
        } else {
            error(request, response);
        }
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
