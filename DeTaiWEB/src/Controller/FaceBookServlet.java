package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.google.gson.Gson;

import Model.KhachHang;
import Model.MatHang;
import Model.QuanLyKhachHang;

/**
 * Servlet implementation class FaceBookServlet
 */
@WebServlet("/FaceBookServlet")
public class FaceBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FaceBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		both(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		both(request, response);
	}

	protected void both(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
boolean isFacebookAccountExist=false;

	HttpSession session = request.getSession();
	
	

		QuanLyKhachHang qlkh=new QuanLyKhachHang();
	String faceID=	request.getParameter("faceID");
	
	byte ptext[] = request.getParameter("faceName").getBytes("ISO-8859-1"); 
	String faceName = new String(ptext, "UTF-8"); 
	KhachHang kh=new KhachHang("", faceName, faceID, "");
	try {
		if(!qlkh.isFacebookAcountExist(kh)){
		
			qlkh.insertKhachHangByFacebookLogin(kh);
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		session.setAttribute("KhachHangDangNhap", qlkh.getKHByFaceBookID(faceID));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		session.setAttribute("customer", kh.getFacebookName());
		session.setAttribute("listProductOrder", new ArrayList<MatHang>());
		session.setAttribute("isAdmin", false);
	session.setAttribute("LoginWithGoogleOrFacebook", "yes");//disable checkbox in payment page
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

}
