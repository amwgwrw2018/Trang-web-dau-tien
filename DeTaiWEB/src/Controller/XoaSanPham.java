package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MatHang;

/**
 * Servlet implementation class XoaSanPham
 */
@WebServlet("/XoaSanPham")
public class XoaSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
	String index=request.getParameter("index");
	System.out.println(index);
	
	if(session.getAttribute("listProductOrder")!=null&&((ArrayList<MatHang>)session.getAttribute("listProductOrder")).size()>0){
	((ArrayList<MatHang>)session.getAttribute("listProductOrder")).remove(Integer.parseInt(index));
	}

	if(request.getParameter("redirectLocation")!=null){
		response.sendRedirect("index.jsp");
	}else{
		
		response.sendRedirect("thanhToan.jsp");
	}
	}

}
