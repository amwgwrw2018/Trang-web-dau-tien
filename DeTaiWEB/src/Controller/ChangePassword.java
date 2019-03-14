package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.KhachHang;
import Model.QuanLyKhachHang;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
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
	String oldPass=request.getParameter("pass").hashCode()+"";
	String newPass=request.getParameter("newPass").hashCode()+"";
	KhachHang kh=(KhachHang)session.getAttribute("KhachHangDangNhap");
	QuanLyKhachHang qlkh=new QuanLyKhachHang();
	System.out.println(oldPass);
	if(kh.getPassword().equals(oldPass)){
		try {
			qlkh.changePassword(newPass, kh.getMaTaiKhoan());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		kh.setPassword(newPass);
		request.setAttribute("changePassSuccess", "Đổi Mật Khẩu Thành Công");
	}else{
		request.setAttribute("PasswordDoesntMatch", "Bạn Đã Nhập Sai Password");
	}
	request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
	}

}
