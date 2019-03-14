package Controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MatHang;
import Model.QuanLyMatHang;

/**
 * Servlet implementation class XuLyMatHang
 */
@WebServlet("/XuLyMatHangMuonTim")
public class XuLyMatHangMuonTim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyMatHangMuonTim() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	String ten=request.getParameter("matHangMuonTim");

	QuanLyMatHang qlmh=new QuanLyMatHang();

	ArrayList<MatHang> foundedProduct=qlmh.findProductByName(ten);
	System.out.println(foundedProduct);
	request.setAttribute("listFoundedProduct", foundedProduct);
		request.getRequestDispatcher("chiTietMatHangTimDuoc.jsp").forward(request, response);

	}

}
