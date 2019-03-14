package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import Model.KhachHang;
import Model.MatHang;
import Model.QuanLyKhachHang;
import Model.Validation;

/**
 * Servlet implementation class XuLyKhachHangDangNhap
 */
@WebServlet("/XuLyKhachHangDangNhap")
public class XuLyKhachHangDangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyKhachHangDangNhap() {
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
boolean haveAdmin=false;
boolean isAccountExist=false;



		String user=request.getParameter("user");
		String pass=request.getParameter("pass").hashCode()+"";
		Validation userValidate=new Validation(user, "Bạn Phải Nhập Username");
		Validation passValidate=new Validation(pass, "Bạn Phải Nhập Password");
		System.out.println(pass);
		session.setAttribute("listProductOrder", new ArrayList<MatHang>());
	QuanLyKhachHang qlkh=new QuanLyKhachHang();
	ArrayList<KhachHang> list=qlkh.getAllKH();
	ArrayList<KhachHang> listAdmin=qlkh.getAllAdmin();
	System.out.println(list);
	System.out.println(listAdmin);
	KhachHang kh;
	for (int i = 0; i < listAdmin.size(); i++) {
		if(listAdmin.get(i).getUsername().equals(user)&&listAdmin.get(i).getPassword().equals(pass)){
		
			session.setAttribute("customer", user);
			kh=listAdmin.get(i);
			session.setAttribute("KhachHangDangNhap", kh);
			session.setAttribute("isAdmin",true);
			haveAdmin=true;
			isAccountExist=true;
		}
	}
	if(haveAdmin==false){
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getUsername().equals(user)&&list.get(i).getPassword().equals(pass)){
				session.setAttribute("customer", user);
				
				kh=list.get(i);
				session.setAttribute("KhachHangDangNhap", kh);
				isAccountExist=true;
			}
		}
	}
	if(userValidate.isError()||passValidate.isError()){
		request.setAttribute("userError", userValidate.getMessage());
		request.setAttribute("passError", passValidate.getMessage());
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}else{
		if(isAccountExist){
		response.sendRedirect("index.jsp");
			}else{
				request.setAttribute("AccountNotExist", "Sai Username hoặc mật khẩu,hoặc chưa đăng ký tài khoản");
				RequestDispatcher dispa=request.getRequestDispatcher("login.jsp");
				dispa.forward(request, response);
			}
	}

		
	}
	
}
