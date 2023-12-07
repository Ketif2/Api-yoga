package tests;

import controlador.postureController;

import org.junit.Before;
import org.junit.Test;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.IOException;

public class testController {

	private postureController controller;
    private HttpServletRequest request;
    private HttpServletResponse response;

    @Before
    public void setUp() {
        controller = new postureController();
        request = mock(HttpServletRequest.class);
        response = mock(HttpServletResponse.class);
    }

    @Test
    public void testShowDashboard() throws ServletException, IOException {
        when(request.getParameter("rute")).thenReturn("showDashboard");

        controller.router(request, response);

        verify(response).sendRedirect("jsp/dashboard.jsp");
    }

}
