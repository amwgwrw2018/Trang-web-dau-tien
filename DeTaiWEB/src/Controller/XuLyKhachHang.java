package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.KhachHang;
import Model.QuanLyKhachHang;

/**
 * Servlet implementation class XuLyKhachHang
 */
@WebServlet(urlPatterns={"/dangky"})
public class XuLyKhachHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyKhachHang() {
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
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String passRe=request.getParameter("passre");
		if(!pass.equals(passRe)){
			request.setAttribute("error", "Mật Khẩu Không Khớp");
			RequestDispatcher dispa=request.getRequestDispatcher("index.jsp");
			dispa.forward(request, response);
		}else{
			if(request.getAttribute("error")!=null){
				request.setAttribute("error", null);
			}
			KhachHang kh=new KhachHang(user, pass);
			QuanLyKhachHang qlkh=new QuanLyKhachHang();
			try {
				qlkh.insertKhachHang(kh);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispa=request.getRequestDispatcher("index.jsp");
			dispa.forward(request, response);
		}
	}

}
