package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.KhachHang;
import Model.QuanLyKhachHang;

/**
 * Servlet implementation class AddCustomer
 */
@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
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
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

response.setCharacterEncoding("UTF-8");
	String tenKH=request.getParameter("tenKH");
	String gioitinh=request.getParameter("genderKH");
	String diachi=request.getParameter("diachiKH");
	String sdt=request.getParameter("phone");
	
	String username=request.getParameter("username");
	String password=request.getParameter("pass");
	String email=request.getParameter("email");
	System.out.println(email);
	KhachHang kh=new KhachHang("", tenKH, username, password, gioitinh,  request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"), diachi, sdt, email,"");
	QuanLyKhachHang qlkh=new QuanLyKhachHang();
	try {
		qlkh.insertKhachHang(kh);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	response.sendRedirect("AdminControlAccount.jsp");
	}

}
