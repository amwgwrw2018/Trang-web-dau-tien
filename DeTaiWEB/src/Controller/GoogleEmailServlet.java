package Controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import Model.KhachHang;
import Model.MatHang;
import Model.QuanLyKhachHang;

/**
 * Servlet implementation class GoogleEmailServlet
 */
@WebServlet("/GoogleEmailServlet")
public class GoogleEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleEmailServlet() {
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
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		QuanLyKhachHang qlkh=new QuanLyKhachHang();
	String userId=request.getParameter("userId");
	String name=request.getParameter("name");
	System.out.println(userId);
	System.out.println(name);
	KhachHang kh=new KhachHang("", userId, name);
	try {
		if(!qlkh.isGoogleAcountExist(kh)){//chua co tai khoan thi them vao
		qlkh.insertKhachHangByGoogleLogin(kh);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		session.setAttribute("KhachHangDangNhap", qlkh.getKHByGoogleID(userId));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
session.setAttribute("customer", kh.getGoogleName());
session.setAttribute("listProductOrder", new ArrayList<MatHang>());
session.setAttribute("isAdmin", false);
session.setAttribute("LoginWithGoogleOrFacebook", "yes");
System.out.println("request");
request.getRequestDispatcher("index.jsp").forward(request, response);
	//THANH CONG
	}

}
