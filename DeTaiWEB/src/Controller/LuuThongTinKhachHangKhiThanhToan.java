package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.HoaDon;
import Model.KhachHang;
import Model.MatHang;
import Model.QuanLyHoaDonVaDonHang;
import Model.Validation;

/**
 * Servlet implementation class LuuThongTinKhachHangKhiThanhToan
 */
@WebServlet("/LuuThongTinKhachHangKhiThanhToan")
public class LuuThongTinKhachHangKhiThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LuuThongTinKhachHangKhiThanhToan() {
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		QuanLyHoaDonVaDonHang qlHoaDon=new QuanLyHoaDonVaDonHang();
		Calendar ca=Calendar.getInstance();
		Validation validateName=new Validation(request.getParameter("name"), "Bạn Phải Nhập Tên");
		Validation validateAddress=new Validation(request.getParameter("diachi"), "Bạn Phải Nhập Địa Chỉ");
		Validation validatePhone=new Validation( request.getParameter("phone"), "Bạn Phải Nhập Số Điện Thoại");
		Validation validateHowToPurchase=new Validation(request.getParameter("hinhThucThanhToan"), "Vui Lòng Chọn Hình Thức Thanh Toán");
		KhachHang kh = (KhachHang) session.getAttribute("KhachHangDangNhap");
		String valueCheckBox = request.getParameter("macdinh");
		
		session.setAttribute("maKhachHangThanhToan", kh.getMaKhachHang());
		session.setAttribute("hinhThucThanhToan", request.getParameter("hinhThucThanhToan"));
		session.setAttribute("MaTaiKhoanKh", kh.getMaTaiKhoan());
		session.setAttribute("tongTien", request.getParameter("tongTien"));
		HoaDon hd=new HoaDon();
		session.setAttribute("ThoiGianXuatHoaDon", ca.get(Calendar.YEAR) + "-" + (ca.get(Calendar.MONTH) + 1) + "-" + ca.get(Calendar.DATE)+" "+ca.get(Calendar.HOUR)+":"+ca.get(Calendar.MINUTE)+":"+ca.get(Calendar.SECOND));
		System.out.println("danh sach: "+((ArrayList<MatHang>)session.getAttribute("listProductOrder")));
		if(validateName.isError()){
			request.setAttribute("errorName", validateName.getMessage());
		}
		if(validateAddress.isError()){
			request.setAttribute("errorAddress", validateAddress.getMessage());
		}
		if(validatePhone.isError()){
			request.setAttribute("errorPhone",validatePhone.getMessage());
		}
		if(validateHowToPurchase.isError()){
			request.setAttribute("missingHowToPurchase",validateHowToPurchase.getMessage());
		}
		if (valueCheckBox == null) {
			if(validateName.isError()||validateAddress.isError()||validatePhone.isError()||validateHowToPurchase.isError()){//kiem tra validate khi ko check mac dinh
			
				request.getRequestDispatcher("thanhToan.jsp").forward(request, response);
			}else{
			session.setAttribute("name", request.getParameter("name"));
			session.setAttribute("phone", request.getParameter("phone"));
			session.setAttribute("diachi", request.getParameter("diachi"));
			hd=new HoaDon("", kh.getMaKhachHang(), request.getParameter("hinhThucThanhToan"),(String)request.getParameter("ghiChu"),Double.parseDouble( request.getParameter("tongTien")),"",request.getParameter("name"),request.getParameter("diachi"),request.getParameter("phone"),((ArrayList<MatHang>)session.getAttribute("listProductOrder")),0);
			}		
			} else {//khi check vao lay tt mac dinh
				if(validateHowToPurchase.isError()){//bao loi khi chua chon hinh thuc thanh toan
					request.getRequestDispatcher("thanhToan.jsp").forward(request, response);
				}else{
			session.setAttribute("name", kh.getName());
			session.setAttribute("phone", kh.getPhone());
			session.setAttribute("diachi", kh.getAddress());
			hd=new HoaDon("", kh.getMaKhachHang(), request.getParameter("hinhThucThanhToan"),(String)request.getParameter("ghiChu"),Double.parseDouble( request.getParameter("tongTien")),"",null,null,null,((ArrayList<MatHang>)session.getAttribute("listProductOrder")),0);
				}
				}
		if((!validateName.isError()&&!validateAddress.isError()&&!validatePhone.isError()&&!validateHowToPurchase.isError()&&valueCheckBox==null)||(!validateHowToPurchase.isError()&&valueCheckBox!=null)){
try {
	qlHoaDon.insertHoaDonVaDonHang(hd,kh.getMaKhachHang());
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

request.getRequestDispatcher("ketQuaThanhToan.jsp").forward(request, response);
		}

		
	}

}
