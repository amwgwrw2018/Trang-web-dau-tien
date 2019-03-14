package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.captcha.botdetect.web.servlet.Captcha;

import Model.KhachHang;

import Model.QuanLyKhachHang;
import Model.Validation;

/**
 * Servlet implementation class XuLyKhachHangDangKy
 */
@WebServlet("/XuLyKhachHangDangKy")
public class XuLyKhachHangDangKy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyKhachHangDangKy() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Captcha captcha=Captcha.load(request, "capchavvv");//id cua captcha ben ngoai
		boolean isCaptchaCorrect=captcha.validate(request.getParameter("captchaCode"));
		
Validation validationName=new Validation(request.getParameter("name"), "Bạn Phải Nhập Họ Tên Của Mình");
		Validation validateUserName = new Validation(request.getParameter("userName"), "Bạn phải nhập tên đăng nhập");
		Validation validateEmail = new Validation(request.getParameter("email"), "Bạn phải nhập Email");
		Validation validatePassMatch = new Validation(request.getParameter("pass"),request.getParameter("passre"), "Mật Khẩu Không Khớp");
		Validation validatePhone=new Validation(request.getParameter("phone"), "Bạn phải nhập Số Điện Thoại");
		Validation validatePass=new Validation(request.getParameter("pass"), "Bạn phải nhập mật khẩu");
		Validation validatePassre=new Validation(request.getParameter("passre"), "Bạn phải nhập lại mật khẩu một lần nữa");
		Validation validateAddress=new Validation(request.getParameter("address"),"Bạn cần nhập địa chỉ");
boolean isExistUserName=false;
boolean isOutOfIndexPhone=false;
		QuanLyKhachHang qlkh=new QuanLyKhachHang();
		ArrayList<KhachHang> listKh=qlkh.getAllNguoiDung();
		KhachHang kh;
		if (validateUserName.isError()) {
			request.setAttribute("errorName", validateUserName.getMessage());

		}
		if(validateAddress.isError()){
			request.setAttribute("errorAddress", validateAddress.getMessage());
		}
		if(request.getParameter("phone").length()!=10){
			request.setAttribute("outOfIndexPhone", "Số Điện Thoại Phải Có 10 Ký Tự");
			isOutOfIndexPhone=true;
			
		}
		if(validatePass.isError()){
			request.setAttribute("errorPass", validatePass.getMessage());
		}
		if(validatePassre.isError()){
			request.setAttribute("errorPassre", validatePassre.getMessage());
		}
		if(validatePhone.isError()){
			request.setAttribute("errorPhone", validatePhone.getMessage());
		}
		if (validateEmail.isError()) {
			request.setAttribute("errorEmail", validateEmail.getMessage());

		}
		if (validatePassMatch.isPasswordNotMatch()) {
			request.setAttribute("errorPassNotMatch", validatePassMatch.getMessage());

		}
		if(validationName.isError()){
			request.setAttribute("errorHoTen", validationName.getMessage());
		}
		for (int i = 0; i < listKh.size(); i++) {
			if(request.getParameter("userName").equals(listKh.get(i).getUsername())){
				request.setAttribute("errorExistUserName", "Tài Khoản Đã Tồn Tại,Vui Lòng Nhập Tên Khác");
			isExistUserName=true;
			}
			
			
		}
		if(validateEmail.isError()||validateUserName.isError()||validatePassMatch.isPasswordNotMatch()||validatePass.isError()||validatePassre.isError()||validatePhone.isError()||isExistUserName||isOutOfIndexPhone||validationName.isError()||validateAddress.isError()||!isCaptchaCorrect){
			request.setAttribute("CaptchaIncorrect", "Vui Lòng Nhập Đúng Captcha");
			RequestDispatcher dispa=request.getRequestDispatcher("dangKy.jsp");
			dispa.forward(request, response);
		}else{
	kh=new KhachHang("",request.getParameter("name"),request.getParameter("userName"), request.getParameter("pass").hashCode()+"", request.getParameter("gender"), request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"), request.getParameter("address"),request.getParameter("phone"),request.getParameter("email"),"");
		System.out.println(kh.toString());	
	try {
				qlkh.insertKhachHang(kh);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	request.setAttribute("success","Bạn Đã Đăng Ký Thành Công");
	RequestDispatcher dispa = request.getRequestDispatcher("login.jsp");
			dispa.forward(request, response);
		}
	}

}
