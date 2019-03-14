package Controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class XuLySapXepMatHang
 */
@WebServlet("/XuLySapXepMatHang")
public class XuLySapXepMatHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLySapXepMatHang() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("typeOfSorting");
String currentURL = request.getParameter("currentURL");
	
		
		if (type.equals("byName")) {
			request.setAttribute("byName", "yes");
		}
		if (type.equals("byPrice")) {
			request.setAttribute("byPrice", "yes");
		}

		request.getRequestDispatcher(currentURL).forward(request, response);

	}

}
